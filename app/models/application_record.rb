class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :date_from_now_on, -> { where('scheduled_date >= ?', Time.current) }
  scope :date_till_now,
        -> { where('scheduled_date < ?', Time.current).order(scheduled_date: :desc) }
end
