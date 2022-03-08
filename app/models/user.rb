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
class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: lambda {
                                                          new_record? || changes[:crypted_password]
                                                        }

  validates :mattermost_id, uniqueness: true, presence: true

  validates :name, presence: true, length: { maximum: 20 }

  validates :email, uniqueness: true, presence: true

  validates :accept_randam, inclusion: { in: [true, false] }

  enum role: { general: 0, admin: 1 }
  enum accept_random: { accept: true, none: false }
end
