class UsersController < ApplicationController
    def index
        #render plain: "I'm in the index action!"
        @users = User.all
        render json: @users
    end

    # def create
    #     render json: params
    # end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            redirect_to user_url(user)
        else
            render json: user.errors.full_messages, status:422
        end
    end

    def user_params
        params.require(:user).permit(:name, :email)
    end

end