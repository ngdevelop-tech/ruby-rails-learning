class PasswordResetController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params['email'])

    if @user.present?
      # Send email
      PasswordMailer.with(user: @user).reset.deliver_now
    end

    flash[:info] = 'You will receive an email to reset password'
    redirect_to root_path
  end

  def edit
    @user = find_by_token(params[:token])

    if @user.nil?
      flash['error'] = 'Invalid token'
      render :new
    end
  end

  def update
    @user = find_by_token(params[:token])

    if @user.update(update_params)
      flash['success'] = 'Your Password reset successfully. Please sign in agains'
      redirect_to(root_path)
    else
      # flash['error'] = 'Password update failed'
      render :edit
    end
  end

  private

  def update_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
