class ItemStatusesController < ApplicationController

    def show
        item = @current_user.items.find(params[:id])
        render json: item.item_statuses
    end

    def create 
        item = @current_user.items.find(params[:id])
        item_statuses = item.item_statuses.create!(item_statuses_param)
        render json: item_statuses, status: :created
    end

    def update
        item_statuses = ItemStatus.find(params[:id])
        item_statuses.update!(item_statuses_param)
        render json: item_statuses, status: :accepted
    end

    def destroy
        item_statuses = ItemStatus.find(params[:id])
        item_statuses.destroy
        head :no_content
    end

    private 

    def item_statuses_param
        params.permit(:selling_or_donating, :report_date, :is_shipped)
    end

end
