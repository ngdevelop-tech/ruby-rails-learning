class ApplicationController < ActionController::Base
  before_action :set_current_user
  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    if Current.user.nil?
      flash[:info] = 'Sign in required'
      redirect_to root_path
    end
  end
end
