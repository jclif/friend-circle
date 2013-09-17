class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    login_user!
    render :new
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to new_session_url
  end

  def password_reset_new
    render :password_reset_new
  end

  def password_reset_create
    @user = User.find_by_email(params[:user][:email])

    if @user
      @password = @user.reset_password
      @user.save

      msg = UserMailer.password_email(@user, @password)
      msg.deliver!
      redirect_to new_session_url
    else
      flash[:errors] = ["Email not found."]
      render :password_reset_new
    end

  end

end
