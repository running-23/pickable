# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  accept_randam    :boolean          default(TRUE), not null
#  crypted_password :string
#  name             :string           not null
#  role             :integer          default(0), not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  mattermost_id    :string           not null
#
# Indexes
#
#  index_users_on_mattermost_id  (mattermost_id) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :mattermost_id, uniqueness: true, presence:true

  validates :accept_randam, inclusion: {in: [true, false]}
  

end
