class ListsController < ApplicationController
  #allows controller to respond to both JSON and HTML
  respond_to :json
  respond_to :html
  

  def index
    #this defines @lists as lists belonging to the logged-in "current" user
    @lists = current_user.lists
   
  end

  def new
    #calls the .new method on List object, then authorizes the @list with pundit
    @list = List.new
    authorize @list
  end

  def show
    #Find lists to show based on their :id. Posts are nested in lists and paginated.
    @list = List.find(params[:id])
    @posts = @list.posts.paginate(page: params[:page], per_page: 15)
    authorize @list
    
  end

  def edit
    @list = List.find(params[:id])
      authorize @list
  end

  def create
    #this allows us to create a list that is linked to the user that creates it, and then save it.
    @list = current_user.lists.build(params.require(:list).permit(:name, :description, :public))
    authorize @list
    if @list.save
      redirect_to @list, notice: "List was saved successfully."
    else 
      flash[:error] = "Error creating list, please try again."
      render :new
    end
  end

  def update
    #Defines list objects as those belonging to current user, checks authorization, redirects as necessary
    @list = current_user.lists.find(params[:user_id])
    authorize @list
    if @list.update_attributes(params.require(:list).permit(:name, :description, :public))
      redirect_to @list
    else
      flash[:error] = "Error saving list, please try again."
      render :edit
    end
  end

  def destroy
    # defines list object with :id as paramater, then links the name using the .name method
    @list = List.find(params[:id])
    name = @list.name

    authorize @list
    if @list.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to lists_path
    else
      flash[:error] = "There was an error deleting the list."
      render :show
    end
  end
end
