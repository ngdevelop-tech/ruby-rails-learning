class MainController < ApplicationController
  def index
    # flash[:success] = 'Logged in successful' #flash without .now caches the it for one more request
    # flash.now[:error] = 'Something went wrong'
  end
end
