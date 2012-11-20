class OsobyController < ApplicationController
  load_and_authorize_resource
  # GET /osoby
  # GET /osoby.json
  def index
    @osoby = Osoba.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @osoby }
    end
  end

  # GET /osoby/1
  # GET /osoby/1.json
  def show
    @osoba = Osoba.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @osoba }
    end
  end

  # GET /osoby/new
  # GET /osoby/new.json
  def new
    @osoba = Osoba.new
    @osoba.generuj_tymczasowe_haslo
    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @osoba }
    end
  end

  # GET /osoby/1/edit
  def edit
    @osoba = Osoba.find(params[:id])
  end

  # POST /osoby
  # POST /osoby.json
  def create
    @osoba = Osoba.new(params[:osoba])

    respond_to do |format|
      if @osoba.save        
        
        format.html { redirect_to @osoba, notice: t(:created_notice, :model=>Osoba) }
        #format.json { render json: @osoba, status: :created, location: @osoba }
      else
        format.html { render action: "new" }
        #format.json { render json: @osoba.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /osoby/1
  # PUT /osoby/1.json
  def update
    @osoba = Osoba.find(params[:id])

    respond_to do |format|
      if @osoba.update_attributes(params[:osoba])
        format.html { redirect_to @osoba, notice: t(:updated_notice, :model=>t('activerecord.models.osoba')) }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @osoba.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /osoby/1
  # DELETE /osoby/1.json
  def destroy
    @osoba = Osoba.find(params[:id])
    @osoba.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      #format.json { head :no_content }
    end
  end

  # GET /reset_hasla
  def reset_hasla
    
  end

  # POST /reset_hasla
  def zresetuj_haslo
    @osoba = Osoba.find_by_email(params[:email])
    if @osoba
      @osoba.generuj_tymczasowe_haslo
      @osoba.save!
      OsobaMailer.haslo(@osoba, root_url).deliver
      redirect_to login_path, notice: t(:updated_notice, :model=>t('activerecord.attributes.osoba.password'))
    else
      redirect_to login_path, notice: t(:not_found, :model=>t('activerecord.models.osoba'))
    end
  end

  # GET /ustaw_haslo
  def ustaw_haslo
    @osoba = Osoba.find(params[:id])
    if @osoba
      @osoba.wyczysc_tymczasowe_haslo      
    else
      redirect_to root_path, notice: t(:not_found, :model=>t('activerecord.models.osoba'))
    end
  end


  def wyslij_newsletter
    NewsletterMailer.welcome_email(Osoba.where(:email=>"jerzy.czepiel@gmail.com").first).deliver
  end
end
