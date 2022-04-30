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
require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
