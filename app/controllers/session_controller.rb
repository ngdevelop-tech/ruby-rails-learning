class SessionController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Loggedin successfully'
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, info: 'Logged Out'
  end
end
