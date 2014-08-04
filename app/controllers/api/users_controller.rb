module API
  class UsersController < ApiController

    def index
      users = User.all
      render json: users, status:200
    end

    def show
      user = User.find(params[:id])
      render json: user, status: 200
    end

    def create
      user = User.new(user_params)

      if user.save
        head 204, location: user
      else
        render json: user.errors, status: 422
      end
    end

    def update
      user = User.find(params[:id])
      if user.update(user_params)
        render json: user, status:200
      end
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      head 204
    end

      private

      def user_params
        params.require(:user).permit(:name, :email)
      end
  end
end
