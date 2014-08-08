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

class Event < ActiveRecord::Base

  belongs_to :mobile_user
  belongs_to :bar
end
