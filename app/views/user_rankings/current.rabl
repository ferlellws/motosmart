collection @user_rankings

attributes :user
attributes :total_kilometers

child :user do
  attributes :id, :name, :email
end