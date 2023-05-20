# collection @user_rankings
# attributes :id, :user_id, :start_date, :end_date, :kilometers

collection @user_rankings

attributes :user
attributes :total_kilometers

child :user do
  attributes :name, :email
end