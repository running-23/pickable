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
