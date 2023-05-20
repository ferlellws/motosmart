class CreateUserRankings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_rankings do |t|
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :kilometers

      t.timestamps
    end
  end
end
