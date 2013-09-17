class PostsController < ApplicationController

  def new
    render :new
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to new_post_url
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end
end
