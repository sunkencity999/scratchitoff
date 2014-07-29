module API
  class PostsController < ApplicationController
    def index
      posts = Post.all
      render json: posts, status:200
    end

    def show
      post = Post.find(params[:id])
      render json: post, status: 200
    end
  end
end