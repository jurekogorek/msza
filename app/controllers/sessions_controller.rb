class SessionsController < ApplicationController
  def new
  end

  def create
    o = Osoba.find_by_email(params[:email])    
    if o && o.authenticate(params[:password])
      session[:user_id] = o.id
      raise HasloTymczasoweException if o.try(:tymczasowe_haslo_ustawione?)
      redirect_to params[:url_for] ? params[:url_for] : root_url, :notice => t(:logged)
    else
      redirect_to params[:url_for] ? params[:url_for] : root_url, :alert => t(:zly_email_lub_haslo)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to params[:url_for] ? params[:url_for] : root_url, :notice => t(:logged_out)
  end
end
