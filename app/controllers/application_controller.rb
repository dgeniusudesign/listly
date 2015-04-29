class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.for(:sign_in) << [:remember_me]
  end

  def after_sign_in_path_for(resource)
    sign_in(resource)
    root_path
  end

  def is_list_viewable
    list_id = params[:id]
    if current_user.share_lists.find_by_id(list_id) || current_user.lists.find_by_id(list_id)
      true
    else
      redirect_to root_path, notice: "You are not allowed to view this list"
    end
  end

end
