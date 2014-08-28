# == Schema Information
#
# Table name: mobile_users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  fb_access_token :string(255)
#  fb_id           :integer
#  email           :string(255)
#  male            :boolean
#  lat             :decimal(10, 6)
#  lon             :decimal(10, 6)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class MobileUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
