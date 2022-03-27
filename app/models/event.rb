# == Schema Information
#
# Table name: events
#
#  id                   :bigint           not null, primary key
#  description          :string           not null
#  number_of_applicants :integer          default(0), not null
#  number_of_members    :integer          not null
#  pickable_mode        :integer          not null
#  place                :string           not null
#  scheduled_date       :datetime         not null
#  title                :string           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  category_id          :bigint
#  user_id              :bigint
#
# Indexes
#
#  index_events_on_category_id  (category_id)
#  index_events_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
class Event < ApplicationRecord
  has_many :participations, dependent: :destroy
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true
  validates :number_of_members, presence: true
  validates :number_of_applicants, presence: true,
                                   numericality: { less_than_or_equal_to: :number_of_members }
  validates :scheduled_date, presence: true
  validates :place, presence: true
  validates :pickable_mode, presence: true

  enum pickable_mode: { all_applicant: 0, applicant_and_random: 1, random: 2 }

  scope :scheduled_date, -> { where(scheduled_date: Time.current..Time.current.since(3.years)) }

  def created_by?(user)
    return false unless user

    user_id == user.id
  end
end
