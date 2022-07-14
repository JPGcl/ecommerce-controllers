class ApplicationController < ActionController::Base
  #before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_user!

  def current_order
    if current_user
      order = Order.where(user_id: current_user.id).where(state: "created").last
      if order.nil?
        order = Order.create(user: current_user, state: "created")
      end
      return order
    end
    nil
  end

  protected

  def configure_permitted_parameters
      #added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
      added_attrs = [ :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs)
      devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
      devise_parameter_sanitizer.permit(:sign_update, keys: added_attrs)
  end
end
