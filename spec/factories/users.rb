# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  accept_random     :integer          default("accepted"), not null
#  crypted_password  :string
#  email             :string           not null
#  github_name       :string           not null
#  hiyoconne_url     :string
#  name              :string
#  remote_avatar_url :string
#  role              :integer          default("general"), not null
#  salt              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_users_on_email        (email) UNIQUE
#  index_users_on_github_name  (github_name) UNIQUE
#
FactoryBot.define do
  factory :user do
    
  end
end
