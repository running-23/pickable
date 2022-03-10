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
FactoryBot.define do
  factory :event do
    title { "MyString" }
    description { "MyString" }
    number_of_members { 1 }
    number_of_applicants { 1 }
    scheduled_date { "2022-03-08 10:18:36" }
    place { "MyString" }
    pickable_mode { 1 }
    user { nil }
    category { nil }
  end
end