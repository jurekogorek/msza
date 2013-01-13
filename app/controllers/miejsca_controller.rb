class MiejscaController < ApplicationController
  load_and_authorize_resource
  # GET /miejsca
  # GET /miejsca.json
  def index
    @miejsca = params[:dzien]? Miejsce.w_dniu(params[:dzien]) : Miejsce.all
    
    @json = @miejsca.to_gmaps4rails do |miejsce, marker|
      marker.infowindow render_to_string(:partial => "miejsca/info_window", :object => miejsce)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @miejsca }
    end
  end

  # GET /miejsca/1
  # GET /miejsca/1.json
  def show
    @miejsce = Miejsce.find(params[:id])
    @json = @miejsce.to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @miejsce }
    end
  end

  # GET /miejsca/new
  # GET /miejsca/new.json
  def new
    @miejsce = Miejsce.new
    @json = @miejsce.to_gmaps4rails
    @action_new=true
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @miejsce }
    end
  end

  # GET /miejsca/1/edit
  def edit
    @miejsce = Miejsce.find(params[:id])
    @json = @miejsce.to_gmaps4rails
  end

  # POST /miejsca
  # POST /miejsca.json
  def create
    @miejsce = Miejsce.new(params[:miejsce])
    @miejsce.ustaw_grupy(current_user)
    respond_to do |format|
      if @miejsce.save
        format.html { redirect_to @miejsce, notice: 'Miejsce was successfully created.' }
        format.json { render json: @miejsce, status: :created, location: @miejsce }
      else
        format.html { render action: "new" }
        format.json { render json: @miejsce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /miejsca/1
  # PUT /miejsca/1.json
  def update
    @miejsce = Miejsce.find(params[:id])

    @miejsce.terminy.clear
    if params[:miejsce][:terminy_attributes]
    params[:miejsce][:terminy_attributes].each do |t|
       @miejsce.terminy.build(t[1])
    end
    end
    @miejsce.ustaw_grupy(current_user)
    params[:miejsce].delete(:terminy_attributes)

    respond_to do |format|
      if @miejsce.update_attributes(params[:miejsce])
        format.html { redirect_to @miejsce, notice: 'Miejsce was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @miejsce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /miejsca/1
  # DELETE /miejsca/1.json
  def destroy
    @miejsce = Miejsce.find(params[:id])
    @miejsce.destroy

    respond_to do |format|
      format.html { redirect_to miejsca_url }
      format.json { head :no_content }
    end
  end
end
