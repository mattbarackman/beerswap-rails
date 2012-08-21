class BrewsController < ApplicationController
  # GET /brews
  # GET /brews.json
  def index
    @brews = Brew.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brews }
    end
  end

  # GET /brews/1
  # GET /brews/1.json
  def show
    @brew = Brew.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brew }
    end
  end

  # GET /brews/new
  # GET /brews/new.json
  def new
    @brew = Brew.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brew }
    end
  end

  # GET /brews/1/edit
  def edit
    @brew = Brew.find(params[:id])
  end

  # POST /brews
  # POST /brews.json
  def create
    @brew = Brew.new(params[:brew])

    respond_to do |format|
      if @brew.save
        format.html { redirect_to @brew, notice: 'Brew was successfully created.' }
        format.json { render json: @brew, status: :created, location: @brew }
      else
        format.html { render action: "new" }
        format.json { render json: @brew.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brews/1
  # PUT /brews/1.json
  def update
    @brew = Brew.find(params[:id])

    respond_to do |format|
      if @brew.update_attributes(params[:brew])
        format.html { redirect_to @brew, notice: 'Brew was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brew.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brews/1
  # DELETE /brews/1.json
  def destroy
    @brew = Brew.find(params[:id])
    @brew.destroy

    respond_to do |format|
      format.html { redirect_to brews_url }
      format.json { head :no_content }
    end
  end
end
