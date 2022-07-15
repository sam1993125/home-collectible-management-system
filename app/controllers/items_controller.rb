class ItemsController < ApplicationController
    skip_before_action :authorize, only: :index

    def index 
        render json: Item.all 
    end

    def show 
        item = Item.find(params[:id])
        render json: item
    end

    def create 
        item = @current_user.items.create!(item_param)
        render json: item, status: :created
    end

    def update
        item = @current_user.items.find(params[:id])
        new_item = item.update!(item_param_update)
        render json: new_item, status: :accepted
    end

    def destroy
        item = Item.find(params[:id])
        item.destroy
        head :no_content
    end

    private

    def item_param
        params.permit(:image_url, :object_name, :object_year, :object_type, :object_description, :condition, :location, :bought_at,:has_invoice, :user_id)
    end

    def item_param_update
    params.permit(:has_invoice)
    end
end
