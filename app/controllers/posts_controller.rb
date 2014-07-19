class PostsController < ApplicationController
  before_filter :restrict_user, :only => [:show, :view, :edit, :delete, :update]

  def new
    @list = List.find(params[:list_id])
    @post = Post.new
    authorize @post
  end

  def show
    @post = Post.find(params[:id])
    @list = List.find(params[:list_id])
    render json: @post
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
      redirect_to @post.list, notice: "Post was saved successfully."
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
      redirect_to @post.list
    else
      flash[:error] = "Error saving post. Please try again"
      render :edit
    end
  end
  
  def destroy
    @list = List.find(params[:list_id])
    @post = Post.find(params[:id])

    title = @post.title
    authorize @post
    if @post.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @list
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end

  def complete
    params[:posts_checkbox].each do |check|
      post_id = check
        p = Post.find_by_id(post_id)
      p.update_attribute(:completed, true)
    end
    redirect_to :back, alert: "Items marked 'Complete'!"
  end

 private

  def restrict_user
   @post = current_user.posts.where(:id => params[:id].to_i)
  end
end
