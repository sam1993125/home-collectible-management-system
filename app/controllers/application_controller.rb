class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found 
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  before_action :authorize 


  private 

  def authorize 
      @current_user User.find_by(id:session[:user_id])
      render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
  end

  def record_invalid (e)
     render json: {errors: e.record.errors}, status: :unprocessable_entity
  end

  def record_not_found (invalid)
    render json: {errors: invalid}, status: :not_found
  end

end
 