class ApplicationController < ActionController::Base
  protect_from_forgery

  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    errors = Array(instance.error_message).join(',')
    unless html_tag =~ /^<label/
      %(#{html_tag}<span class="help-inline">&nbsp;#{errors}</span>).html_safe
    else
      %(#{html_tag}).html_safe
    end
  end
  helper_method :current_user
  def current_user
    @current_user ||= Osoba.find(session[:user_id]) if session[:user_id]
  end
  

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = t (:access_denied)
    redirect_to root_url
  end

  rescue_from HasloTymczasoweException do |exception|
    flash[:error] = t :haslo_tymczasowe_ustawione
    redirect_to ustaw_haslo_path(:id => current_user.id)
  end

  def admin_lub_moderator
    current_user.try(:admin?) || current_user.try(:moderator?)
  end
end
