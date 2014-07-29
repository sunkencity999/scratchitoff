module API
  class ListsController < ApplicationController
    def index
      lists = List.all
      render json: lists, status:200
    end

    def show
      list = List.find(params[:id])
      render json: list, status: 200
    end
  end
end