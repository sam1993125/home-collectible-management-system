class ItemStatusesController < ApplicationController

    def index 
        render json: ItemStatus.all 
    end
end
