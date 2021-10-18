class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #          flash[:success] = "User successfully created"
      #         puts @user
      session[:user_id] = @user.id
      redirect_to root_path, success: 'User successfully created'
    else
      #   flash[:error] = "Something went wrong"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
