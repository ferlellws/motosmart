require "test_helper"

class UserRankingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_ranking = user_rankings(:one)
  end

  test "should get index" do
    get user_rankings_url, as: :json
    assert_response :success
  end

  test "should create user_ranking" do
    assert_difference("UserRanking.count") do
      post user_rankings_url, params: { user_ranking: { end_date: @user_ranking.end_date, kilometers: @user_ranking.kilometers, start_date: @user_ranking.start_date, user_id: @user_ranking.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show user_ranking" do
    get user_ranking_url(@user_ranking), as: :json
    assert_response :success
  end

  test "should update user_ranking" do
    patch user_ranking_url(@user_ranking), params: { user_ranking: { end_date: @user_ranking.end_date, kilometers: @user_ranking.kilometers, start_date: @user_ranking.start_date, user_id: @user_ranking.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy user_ranking" do
    assert_difference("UserRanking.count", -1) do
      delete user_ranking_url(@user_ranking), as: :json
    end

    assert_response :no_content
  end
end
