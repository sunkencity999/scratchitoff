class ApiController < ActionController::Base
  
  #before_action :authenticate
  #necessary in all controllers that respond to JSON
  respond_to :json 


  protected
  #the following enables authentication based on user
  #name and password
    def authenticate
      authenticate_basic_auth || render_unauthorized
    end

    def authenticate_basic_auth
      authenticate_with_http_basic do |username, password|
        User.authenticate(username, password)
      end
    end

    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Basic realm="Zombies"'
      
      respond_to do |format|
        format.json { render json: 'Bad credentials', status: 401 }
        format.xml { render xml: 'Bad credentials', status: 401 }
      end
   end


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