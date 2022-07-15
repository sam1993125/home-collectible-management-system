class UsersController < ApplicationController
    before_action :authorize
	skip_before_action :authorize, only: [:create]

    def items_index
        user = User.find(params[:user_id])
        items = user.items.order("created_at DESC")
        render json: items
    end

    def index
        user = User.last()
        render json: user.id, status: :ok
    end

    def create 
        user = User.create!(user_params)
        session[:id] = user.id 
        render json: user, status: :created 
    end

    def last_user
        user = User.last()
        render json: user.id, status: :ok
    end

    def show 
        render json: @current_user, status: :accepted
    end

    private 

    def user_params 
        params.permit(:username, :email, :user_type, :password)
    end
end
