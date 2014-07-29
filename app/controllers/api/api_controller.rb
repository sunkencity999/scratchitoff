class ApiController < ActionController::Base
  skip_before_action :verify_authenticity_token

  #necessary in all controllers that respond to JSON
  respond_to :json 

  private

  #error responses and before_filter blocking work differently
  #with JavaScripty requests. Rather than using before_filters
  #to authenticate, use "guard clauses" like 'permission_denied_error unles condition'

  def permision_denied_error
    error(403, 'Permision Denied!')
  end

  def error(status, message = 'Something went wrong.')
    response = {
      response_type: "ERROR",
      message: message
    }

    render json: reponse.to_json, status: status
  end
end