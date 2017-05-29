class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  # before_filter :authenticate_user_from_token, except: [:token]

  def token
    authenticate_with_http_basic do |username, password|

      user = User.find_by(username: username)
      if user && user.password == password
        render json: { token: user.token }
      else
        render json: { error: 'Incorrect credentials' }, status: 401
      end

    end
  end

  private

  def authenticate_user_from_token
    unless authenticate_with_http_token { |token, options| User.find_by(token: token) }
      render json: { error: 'Bad Token'}, status: 401
    end
  end

  def render_error(resource, status)
    render json: resource, status: status, adapter: :json_api,
           serializer: ActiveModel::Serializer::ErrorSerializer
  end
end
