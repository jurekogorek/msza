class TerminyController < ApplicationController
  load_and_authorize_resource
  # GET /terminy
  # GET /terminy.json
  def index
    @terminy = Termin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @terminy }
    end
  end

  # GET /terminy/1
  # GET /terminy/1.json
  def show
    @termin = Termin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @termin }
    end
  end

  # GET /terminy/new
  # GET /terminy/new.json
  def new
    @termin = Termin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @termin }
    end
  end

  # GET /terminy/1/edit
  def edit
    @termin = Termin.find(params[:id])
  end

  # POST /terminy
  # POST /terminy.json
  def create
    @termin = Termin.new(params[:termin])

    respond_to do |format|
      if @termin.save
        format.html { redirect_to @termin, notice: 'Termin was successfully created.' }
        format.json { render json: @termin, status: :created, location: @termin }
      else
        format.html { render action: "new" }
        format.json { render json: @termin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /terminy/1
  # PUT /terminy/1.json
  def update
    @termin = Termin.find(params[:id])

    respond_to do |format|
      if @termin.update_attributes(params[:termin])
        format.html { redirect_to @termin, notice: 'Termin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @termin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terminy/1
  # DELETE /terminy/1.json
  def destroy
    @termin = Termin.find(params[:id])
    @termin.destroy

    respond_to do |format|
      format.html { redirect_to terminy_url }
      format.json { head :no_content }
    end
  end
end
