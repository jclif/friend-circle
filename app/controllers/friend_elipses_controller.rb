class FriendElipsesController < ApplicationController

  def new
    render :new
  end

  def create
    @friend_elipse = FriendElipse.new(params[:friend_elipse])
    if @friend_elipse.save!
      redirect_to friend_elipse_url(@friend_elipse)
    else
      flash[:errors] = @friend_elipse.errors.full_messages
      redirect_to new_friend_elipse_url
    end
  end

  def show
    @friend_elipse = FriendElipse.find(params[:id])
    if @friend_elipse
      render :show
    else
      flash[:errors] = ["You suck because the user doesn't exist, check yoself."]
      redirect_to new_session_url
    end
  end

end
