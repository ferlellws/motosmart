module Api
  module V1
    class SessionsController < ApplicationController
      require_relative '../../../../config/initializers/jwt'

      def create
        # binding.pry
        user = User.find_by(email: params[:email])

        if user
          token = generate_token(user)
          render json: { token: token }, status: :ok
        else
          head :unauthorized
        end
      end

      private

      def generate_token(user)
        payload = {
          user_id: user.id,
          uuid: user.uuid,
          exp: Time.now.to_i + 60.minutes
        }
        JWT.encode(payload, JWT_SECRET, 'HS256')
      end
    end
  end
end
