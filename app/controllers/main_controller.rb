class MainController < ApplicationController
    def index
        flash[:info] = 'Logged in successful' #flash without .now caches the it for one more request
        flash.now[:alert] = 'Something went wrong'
    end
end