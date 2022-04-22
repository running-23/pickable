# == Schema Information
#
# Table name: events
#
#  id                :bigint           not null, primary key
#  description       :string           not null
#  number_of_members :integer          not null
#  pickable_counts   :integer          default(0), not null
#  place             :string           not null
#  scheduled_date    :datetime         not null
#  title             :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  category_id       :bigint
#  user_id           :bigint
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
  has_many :participating_users, through: :participations, source: :user
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: { maximum: 38 }
  validates :description, presence: true
  validates :number_of_members, presence: true, numericality: { greater_than: 1 }
  validates :scheduled_date, presence: true
  validates :place, presence: true
  validates :pickable_counts, presence: true, inclusion: { in: 0..1 }
  validate :past_scheduled_date
  validate :over_participations, on: :update

  def past_scheduled_date
    if !scheduled_date.nil? && Time.current >= scheduled_date
      errors.add(:scheduled_date,
                 'は、現在時刻以降を入力して下さい')
    end
  end

  def created_by?(user)
    return false unless user

    user_id == user.id
  end

  def over_participations
    if !number_of_members.nil? && participating_users.length > number_of_members
      errors.add(:number_of_members, 'が参加者を下回っています')
    end
  end
end
