# == Schema Information
#
# Table name: beta_emails
#
#  id         :integer          not null, primary key
#  email      :string(255)      default(""), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class BetaEmailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
