class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end
end
