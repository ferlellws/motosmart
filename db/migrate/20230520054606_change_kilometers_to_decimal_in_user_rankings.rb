class ChangeKilometersToDecimalInUserRankings < ActiveRecord::Migration[7.0]
  def change
    change_column :user_rankings, :kilometers, :decimal, precision: 10, scale: 2
  end
end
