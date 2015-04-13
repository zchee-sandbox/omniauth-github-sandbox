class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # deviceのコントローラーのときに、下記のメソッドを呼ぶ
  # noinspection RailsParamDefResolve
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # sign_inのときに、usernameも許可する
    devise_parameter_sanitizer.for(:sign_in) << :email
    # sign_upのときに、usernameも許可する
    devise_parameter_sanitizer.for(:sign_up) << :email
    #  account_updateのときに、usernameも許可する
    devise_parameter_sanitizer.for(:account_update) << :email
  end
end
