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
#
class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :number_of_members, presence: true
  validates :number_of_applicants, presence: true
  validates :scheduled_date, presence: true
  validates :place, presence: true
  validates :pickable_mode, presence: true

  enum pickable_mode: { all_applicant: 0, part_of_applicant: 1, random: 2 }
end
