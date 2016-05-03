class ApplicationController < ActionController::API
  rescue_from RailsParam::Param::InvalidParameterError do |ex|
    render json: { message: "#{ex.message} - #{ex.param}" }, status: 400
  end
end
