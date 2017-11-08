class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize_admin
    redirect_to root_path, alert: "You need to have a restaurant!" unless current_user.admin?
  end
end
