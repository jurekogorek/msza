class KrajeController < ApplicationController
  # GET /kraje
  # GET /kraje.json
  def index
    @kraje = Kraj.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kraje }
    end
  end

  # GET /kraje/1
  # GET /kraje/1.json
  def show
    @kraj = Kraj.find(params[:id])
    @miejsca = params[:dzien]? Miejsce.w_dniu_dla_kraju(params[:dzien],@kraj) : Miejsce.where(:kraj_id=>params[:id]).order("nazwa")
    @json = @miejsca.to_gmaps4rails do |miejsce, marker|
      marker.infowindow render_to_string(:partial => "miejsca/info_window", :object => miejsce)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kraj }
    end
  end

  # GET /kraje/new
  # GET /kraje/new.json
  def new
    @kraj = Kraj.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kraj }
    end
  end

  # GET /kraje/1/edit
  def edit
    @kraj = Kraj.find(params[:id])
  end

  # POST /kraje
  # POST /kraje.json
  def create
    @kraj = Kraj.new(params[:kraj])

    respond_to do |format|
      if @kraj.save
        format.html { redirect_to @kraj, notice: 'Kraj was successfully created.' }
        format.json { render json: @kraj, status: :created, location: @kraj }
      else
        format.html { render action: "new" }
        format.json { render json: @kraj.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kraje/1
  # PUT /kraje/1.json
  def update
    @kraj = Kraj.find(params[:id])

    respond_to do |format|
      if @kraj.update_attributes(params[:kraj])
        format.html { redirect_to @kraj, notice: 'Kraj was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kraj.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kraje/1
  # DELETE /kraje/1.json
  def destroy
    @kraj = Kraj.find(params[:id])
    @kraj.destroy

    respond_to do |format|
      format.html { redirect_to kraje_url }
      format.json { head :no_content }
    end
  end
end
