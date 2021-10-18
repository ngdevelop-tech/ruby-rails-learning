class MainController < ApplicationController
  def index
    # flash[:success] = 'Logged in successful' #flash without .now caches the it for one more request
    # flash.now[:error] = 'Something went wrong'

    @user = User.find_by(id: session[:user_id])
  end
end
