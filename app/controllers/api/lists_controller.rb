module API
  class ListsController < ApplicationController
    def index
      lists = List.all
      render json: lists, status:200

      respond_to do |format|
        format.json { render json: lists, status: 200}
      end
    end

    def show
      list = List.find(params[:id])
      render json: list, status: 200
    end

    def create
      list = List.new(list_params)

      if list.save
        head 204, location: list
      else
        render json: list.errors, status: 422
      end
    end

    def update
      list = List.find(params[:id])
      if list.update(list_params)
        render json: list, status:200
      end
    end

    def destroy
      list = List.find(params[:id])
      list.destroy
      head 204
    end

    private

    def list_params
      params.require(:list).permit(:name, :description)
    end
  end
end