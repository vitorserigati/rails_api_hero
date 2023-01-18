module Authenticable
  private

  def authenticate_with_token
    @token ||= request.headers['Authorization']

    unless valid_token?
      render json: { error: 'You do not have the required permission' },
             status: :unauthorized
    end
  end

  def valid_token?
    @token.present? && @token == Rails.application.credentials.token
  end
end
