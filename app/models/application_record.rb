class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :from_today, -> { where('scheduled_date >= ?', Time.current.beginning_of_day) }
  scope :till_yesterday, -> { where('scheduled_date < ?', Time.current.beginning_of_day).order(scheduled_date: :desc) }
end
