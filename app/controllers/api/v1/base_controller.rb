class Api::V1::BaseController < ApplicationController
  require_relative '../../../../config/initializers/jwt'

  before_action :authenticate_user

  private

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    unless token && valid_token?(token)
      render json: { error: 'No autorizado' }, status: :unauthorized
      return
    end

    @user = User.find(decoded_token(token)['user_id'])
    unless @user && @user.uuid == decoded_token(token)['uuid']
      render json: { error: 'No autorizado' }, status: :unauthorized
      return
    end
  end

  def valid_token?(token)
    decoded_token(token)
  rescue JWT::DecodeError, JWT::ExpiredSignature
    false
  end

  def decoded_token(token)
    JWT.decode(token, JWT_SECRET, true, algorithm: 'HS256').first
  end
end
