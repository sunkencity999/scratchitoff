class ListsController < ApplicationController

  def index
    @lists = List.paginate(page: params[:page], per_page: 15)
    authorize @lists
  end

  def new
    @list = List.new
    authorize @list 
  end

  def show
    @list = List.find(params[:id])
    @posts = @list.posts.paginate(page: params[:page], per_page: 15)
    authorize @list
  end

  def edit
    @list = List.find(params[:id])
      authorize @list
  end

  def create
    @list = List.new(params.require(:list).permit(:name, :description, :public))
    authorize @list
    if @list.save
      redirect_to @list, notice: "List was saved successfully."
    else 
      flash[:error] = "Error creating list, please try again."
      render :new
    end
  end

  def update
    @list = List.find(params[:id])
    authorize @list
    if @list.update_attributes(params.require(:list).permit(:name, :description, :public))
      redirect_to @list
    else
      flash[:error] = "Error saving list, please try again."
      render :edit
    end
  end
end