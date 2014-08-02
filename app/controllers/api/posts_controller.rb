module API
  class PostsController < ApplicationController
    def index
      posts = Post.all
      render json: posts, status:200

      respond_to do |format|
        format.json { render json: posts, status: 200}
      end
    end

    def show
      post = Post.find(params[:id])
      render json: post, status: 200
    end

    def create
      post = Post.new(post_params)
      if post.save
        head 204, location: post
      else
        render json: post.errors, status: 422
      end
    end

    def update
      post = Post.find(params[:id])
      if post.update(post_params)
        render json: post, status:200
      end
    end

    def destroy
      post = Post.find(params[:id])
      post.destroy
      head 204
    end

    private

    def post_params
      params.require(:post).permit(:title, :body)
    end

  end
end