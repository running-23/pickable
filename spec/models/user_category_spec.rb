# == Schema Information
#
# Table name: user_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_user_categories_on_category_id_and_user_id  (category_id,user_id) UNIQUE
#  index_user_categories_on_user_id                  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe UserCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
