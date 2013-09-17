class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user.nil?
      flash[:errors] = ["Credentials were wrong"]
      render :new
    else
      user.reset_session_token!
      self.current_user = user
      redirect_to user_url(user)
    end
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
