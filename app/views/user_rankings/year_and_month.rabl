collection @user_rankings

attributes :user
attributes :total_kilometers

child :user do
  attributes :name, :email
end
