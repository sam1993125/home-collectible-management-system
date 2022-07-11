class ItemDetailsController < ApplicationController
    skip_before_action :authorize, only: :index

    def index 
        render json: ItemDetail.all 
    end

end
