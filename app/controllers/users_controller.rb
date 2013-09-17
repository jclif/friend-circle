class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update

  end

  def show
    @user = User.find(params[:id])
    render :show
  end
end
