# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  mobile_user_id  :integer
#  bar_id          :integer
#  elapsed_minutes :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
