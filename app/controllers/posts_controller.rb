class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params.require(:post).permit(:tite, :body,))

    if @post.save
      redirect_to @post, notice: "Post was saved successfully."
    else
      flash[:error] = "Error creating post. Please try again."
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      redirect_to @post
    else
      flash[:error] = "Error saving post. Please try again"
      render :edit
    end
  end
end
