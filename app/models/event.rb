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
#  timescale         :datetime
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
  validates :number_of_members, presence: true, numericality: { greater_than: 1, less_than: 101 }
  validates :scheduled_date, presence: true
  validates :place, presence: true
  validates :pickable_counts, presence: true, inclusion: { in: 0..1 }
  validate :past_scheduled_date
  validate :limit_reduce_number_of_members, on: :update

  def past_scheduled_date
    if !scheduled_date.nil? && Time.current >= scheduled_date
      errors.add(:scheduled_date,
                 I18n.t('defaults.past_date'))
    end
  end

  def created_by?(user)
    return false unless user

    user_id == user.id
  end

  def limit_reduce_number_of_members
    if !number_of_members.nil? && participating_users.length > number_of_members
      errors.add(:number_of_members, I18n.t('defaults.min_participant'))
    end
  end
end
