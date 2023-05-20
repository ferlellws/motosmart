class UserRanking < ApplicationRecord
  belongs_to :user

  validate :check_duplicate_record, on: :create


  paginates_per 10

  scope :by_year_and_month, ->(year, month) {
    where("EXTRACT(MONTH FROM start_date) = ? AND EXTRACT(YEAR FROM start_date) = ?", month, year)
      .group(:user_id)
      .select('user_id, sum(kilometers) as total_kilometers')
      .order('total_kilometers DESC')
  }

  scope :current_ranking, -> {
    group(:user_id)
      .select('user_id, sum(kilometers) as total_kilometers')
      .order('total_kilometers DESC')
  }

  private

    def check_duplicate_record
      existing_record = UserRanking.find_by(user_id: user_id, start_date: start_date, end_date: end_date)
      if existing_record
        errors.add(:base, 'A record with the same user_id, start_date, and end_date already exists')
      end
    end
end
