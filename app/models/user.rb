# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  accept_random     :integer          default("accepted"), not null
#  crypted_password  :string
#  email             :string           not null
#  github_name       :string           not null
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
class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :events
  has_many :participations, dependent: :destroy
  has_many :participating_events, through: :participations, source: :event
  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: lambda {
                                                          new_record? || changes[:crypted_password]
                                                        }
  validates :mattermost_id, uniqueness: true
  validates :github_name, uniqueness: true, presence: true
  validates :name, length: { maximum: 20 }
  validates :email, uniqueness: true, presence: true
  validates :accept_random, presence: true

  enum role: { general: 0, admin: 1 }
  enum accept_random: { accepted: 0, denied: 1 }

  def participation(event)
    participating_events << event
  end

  def cansel(event)
    participating_events.delete event
  end

  def participation?(event)
    participating_events.include? event
  end
end
