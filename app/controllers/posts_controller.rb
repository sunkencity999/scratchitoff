class PostsController < ApplicationController
  #allows controller to respond to JSON 
  respond_to :json
  

  def new
    #defines the list via :list_id that the post will nest under, then calls the 
    #.new method on @post object
    @list = List.find(params[:list_id])
    @post = Post.new
    authorize @post
  end

  def show
    # displays posts and list by their :id and :list_id (nesting)
    @post = Post.find(params[:id])
    @list = List.find(params[:list_id])
    authorize @post
  end

  def edit
    # the post being edited is given by id and the :list_id of the list it is nested under
    @list = List.find(params[:list_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    # finds the list the post is nested under, then builds a post linked to current user 
    # using the .build method and paramaters. 
    @list = List.find(params[:list_id])
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    @post.list = @list
    authorize @post


    if @post.save
      #after saving, the user is redirected to a view of the created post. If there is an error 
      # the :error is displayed  
      redirect_to @post.list, notice: "Post was saved successfully."
    else
      flash[:error] = "Error creating post. Please try again."
      render :new
    end
  end

  def update
    # finds list the post is nested under using :list_id, identifies the post by :id, authorizes.
    @list = List.find(params[:list_id])
    @post = Post.find(params[:id])
    authorize @post
    # updates the post using the .update_attributes method, flashes errors/notices as required
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

    #defines title using the .title method, then calls it in a string as the :notice object
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
    # this method is used to create the functionality of the checkbox. 
    params[:posts_checkbox].each do |check|
      post_id = check
        p = Post.find_by_id(post_id)
      p.update_attribute(:completed, true)
    end
    redirect_to :back, alert: "Items marked 'Complete'!"
  end
end
