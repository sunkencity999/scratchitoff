class PostsController < ApplicationController
 

  def new
    @list = List.find(params[:list_id])
    @post = Post.new
    authorize @post
  end

  def show
    @post = Post.find(params[:id])
    @list = List.find(params[:list_id])
  end

  def edit
    @list = List.find(params[:list_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    @list = List.find(params[:list_id])
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    @post.list = @list
    authorize @post


    if @post.save
      redirect_to @post, notice: "Post was saved successfully."
    else
      flash[:error] = "Error creating post. Please try again."
      render :new
    end
  end

  def update
    @list = List.find(params[:list_id])
    @post = Post.find(params[:id])
    authorize @post
    
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post has been updated."
      redirect_to @post
    else
      flash[:error] = "Error saving post. Please try again"
      render :edit
    end
  end
end