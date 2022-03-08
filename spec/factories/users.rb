# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  accept_random    :boolean          default(TRUE), not null
#  crypted_password :string
#  email            :string           not null
#  name             :string           not null
#  role             :integer          default("general"), not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  mattermost_id    :string           not null
#
# Indexes
#
#  index_users_on_email          (email) UNIQUE
#  index_users_on_mattermost_id  (mattermost_id) UNIQUE
#
FactoryBot.define do
  factory :user do
    
  end
end
