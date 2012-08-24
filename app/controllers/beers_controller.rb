class String
    def is_i?
       !!(self =~ /^[-+]?[0-9]+$/)
    end
end

class BeersController < ApplicationController
  # GET /beers
  # GET /beers.json
  before_filter :authenticate_user!

  def index
    if current_user.admin
      @beers = Beer.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @beers }
      end
    else
      root_path
    end
  end

  # GET /beers/1
  # GET /beers/1.json
  def show
    @beer = Beer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @beer }
    end
  end

  # GET /beers/new
  # GET /beers/new.json
  def new
    @beer = Beer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @beer }
    end
  end

  # GET /beers/1/edit
  def edit
    @beer = Beer.find(params[:id])
  end

  # POST /beers
  # POST /beers.json
  def create
    @beer = Beer.new(params[:beer])
    #puts params[:beer]

    respond_to do |format|
      if @beer.save
        format.html { redirect_to @beer, notice: 'Beer was successfully created.' }
        format.json { render json: @beer, status: :created, location: @beer }
      else
        format.html { render action: "new" }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /beers/1
  # PUT /beers/1.json
  def update
    @beer = Beer.find(params[:id])

    respond_to do |format|
      if @beer.update_attributes(params[:beer])
        format.html { redirect_to @beer, notice: 'Beer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beers/1
  # DELETE /beers/1.json
  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy

    respond_to do |format|
      format.html { redirect_to beers_url }
      format.json { head :no_content }
    end
  end

  # takes a mechanize agent object and page object
  
  def find_page_type(agent, current)
    current_url = current.uri.to_s
    puts current_url
    case 
    #beer
    when current_url.match(/\/beer\/profile\/[0-9]+\/[0-9]+/) 
      return "beer"
    #brewery
    when current_url.match(/\/beer\/profile\/[0-9]+$/) 
      return "brewery"
    #breweries
    when current_url.match(/\/beerfly\/list?.+/) 
      return "breweries"
    #state
    when current_url.match(/\/beerfly\/directory\/[0-9]+\/[A-Z][A-Z]\/[A-Z][A-Z]$/) 
      return "state"
    #country
    when current_url.match(/\/beerfly\/directory\/[0-9]+\/[A-Z][A-Z]$/)
      return "country"
    #top_level
    when current_url.match(/\/beerfly\/directory\?show=all/)
      return "top_level"
    else
      return false 
    end
  end

  def find_link_type(agent, link)
    link_url = link.href 
    case 
    #beer
    when link_url.match(/\/beer\/profile\/[0-9]+\/[0-9]+\z/) 
      return "beer"
    #brewery
    when link_url.match(/\/beer\/profile\/[0-9]+$/) 
      return "brewery"
    #breweries
    when link_url.match(/\/beerfly\/list?.+/) 
      return "breweries"
    #state
    when link_url.match(/\/beerfly\/directory\/[0-9]+\/[A-Z][A-Z]\/[A-Z][A-Z]$/) 
      return "state"
    #country
    when link_url.match(/\/beerfly\/directory\/[0-9]+\/[A-Z][A-Z]$/)
      return "country"
    #top_level
    when link_url.match(/\/beerfly\/directory\?show=all/)
      return "top_level"
    else
      return false 
    end
  end

  def scrape_helper(agent, current)
    page_type = find_page_type(agent, current)
    case page_type
    when "beer"
      beer_name = current.title.gsub(/\s-\s.+/,"")
      puts beer_name
      beer_style = find_on_page(current, %r{\/beer\/style\/[0-9]+}, "<b>", "</b>")
      brewery_name = find_on_page(current, %r{\/beer\/profile\/[0-9]+\"}, "<b>", "</b>")
      abv_anchor = current.content.index(%r{[0-9]+\.[0-9]+\%\s\<a\shref\=\"\/articles\/[0-9]+\"\>ABV})
      bascore_anchor = current.content.index(%r{BAscore_big})
      bascore_start = current.content.index(">", bascore_anchor)
      bascore_end = current.content.index("<", bascore_start)
      beer_bascore = current.content[bascore_start+1...bascore_end]      
      if abv_anchor == nil
        beer_abv = nil
      else  
        abv_end = current.content.index("%", abv_anchor)
        beer_abv = current.content[abv_anchor...abv_end]
      end
      puts beer_abv
      beer_params = { :brewery_name => brewery_name, 
               :beer_name => beer_name, 
               :beer_style => beer_style,
               :beer_abv => beer_abv,
               :beer_bascore => beer_bascore}
      puts beer_params
      beer = Beer.new(beer_params)
      beer.save
    
    when "brewery"
      puts "start link list"
      current.links.each do |link|
        if find_link_type(agent, link) == "beer"
          current = link.click
          scrape_helper(agent, current)
          sleep(2)
        end
      end
    end

    # base case for brewery page
  end

def find_on_page(current, start_regex, start_tag, end_tag)
  anchor = current.content.index(start_regex)
  if anchor == nil
    return nil
  else
    start = current.content.index(start_tag, anchor)
    final = current.content.index(end_tag, start)
    name = current.content[start+(end_tag).length-1...final]
    return name
  end
end

  def scrape
    require 'mechanize'
    ## create agent
    agent = Mechanize.new
    #current = agent.get("http://beeradvocate.com/beer/profile/735/20781")
    current = agent.get("http://beeradvocate.com/beer/profile/735/56656")
    #current = agent.get("http://beeradvocate.com/beer/profile/735")
    #current = agent.get("http://beeradvocate.com/beerfly/list?c_id=US&s_id=CA&brewery=Y")
    #current = agent.get("http://beeradvocate.com/beerfly/directory/0/US/CA")
    #current = agent.get("http://beeradvocate.com/beerfly/directory/0/US")
    #current = agent.get("http://beeradvocate.com/beerfly/directory?show=all")
    #current = agent.get("http://www.google.com")
    #current = agent.get("http://beeradvocate.com/beer/profile/735")
    scrape_helper(agent, current)
    redirect_to beers_path
  end
end
