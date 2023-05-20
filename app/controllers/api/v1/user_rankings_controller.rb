# Este archivo contiene la definición del controlador de Rails Api::V1::UserRankingsController.
# Este controlador maneja solicitudes HTTP relacionadas con los rankings de usuarios.
#
# Autor: Ferley León
#
# Fecha de creación: 2023-05-19
module Api
  module V1
    class UserRankingsController < BaseController
      before_action :set_user_ranking, only: %i[show update destroy]

      # GET /user_rankings/index
      def index
        @user_rankings = UserRanking.all

        render json: @user_rankings
      end

      # GET /rankings/:year/:month
      def year_and_month
        @user_rankings = UserRanking.by_year_and_month(params[:year], params[:month])
                                    .page(params[:page])

        render_user_rankings('year_and_month')
      end

      # GET /rankings/current
      def current
        @user_rankings = UserRanking.current_ranking
                                    .page(params[:page])

        render_user_rankings('current')
      end

      # GET /user_rankings/1
      def show
        render json: @user_ranking
      end

      # POST /user_rankings
      def create
        @user_ranking = UserRanking.new(user_ranking_params)

        if @user_ranking.save
          render json: @user_ranking, status: :created
        else
          render json: @user_ranking.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /user_rankings/1
      def update
        if @user_ranking.update(user_ranking_params)
          render json: @user_ranking
        else
          render json: @user_ranking.errors, status: :unprocessable_entity
        end
      end

      # DELETE /user_rankings/1
      def destroy
        @user_ranking.destroy
      end

      private
        def render_user_rankings(view)
          if @user_rankings.empty?
            render json: { message: 'No ranking available' }, status: :ok
          else
            render "user_rankings/#{view}"
          end
        end

        # Use callbacks to share common setup or constraints between actions.
        def set_user_ranking
          @user_ranking = UserRanking.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def user_ranking_params
          params.require(:user_ranking).permit(:user_id, :start_date, :end_date, :kilometers)
        end
    end
  end
end
