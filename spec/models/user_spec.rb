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
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
