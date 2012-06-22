class BrewhousesController < ApplicationController
  # GET /brewhouses
  # GET /brewhouses.json
  def index
    @brewhouses = Brewhouse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brewhouses }
    end
  end

  # GET /brewhouses/1
  # GET /brewhouses/1.json
  def show
    @brewhouse = Brewhouse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brewhouse }
    end
  end

  # GET /brewhouses/new
  # GET /brewhouses/new.json
  def new
    @brewhouse = Brewhouse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brewhouse }
    end
  end

  # GET /brewhouses/1/edit
  def edit
    @brewhouse = Brewhouse.find(params[:id])
  end

  # POST /brewhouses
  # POST /brewhouses.json
  def create
    @brewhouse = Brewhouse.new(params[:brewhouse])

    respond_to do |format|
      if @brewhouse.save
        format.html { redirect_to @brewhouse, notice: 'Brewhouse was successfully created.' }
        format.json { render json: @brewhouse, status: :created, location: @brewhouse }
      else
        format.html { render action: "new" }
        format.json { render json: @brewhouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brewhouses/1
  # PUT /brewhouses/1.json
  def update
    @brewhouse = Brewhouse.find(params[:id])

    respond_to do |format|
      if @brewhouse.update_attributes(params[:brewhouse])
        format.html { redirect_to @brewhouse, notice: 'Brewhouse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brewhouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brewhouses/1
  # DELETE /brewhouses/1.json
  def destroy
    @brewhouse = Brewhouse.find(params[:id])
    @brewhouse.destroy

    respond_to do |format|
      format.html { redirect_to brewhouses_url }
      format.json { head :no_content }
    end
  end
end
