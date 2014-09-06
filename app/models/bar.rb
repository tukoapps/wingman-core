# == Schema Information
#
# Table name: bars
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  yelp_id       :string(255)
#  logo_url      :string(255)
#  image_url     :string(255)
#  lat           :decimal(10, 6)
#  lon           :decimal(10, 6)
#  review_count  :integer
#  rating        :decimal(4, 2)
#  current_users :integer
#  price         :decimal(4, 2)
#  created_at    :datetime
#  updated_at    :datetime
#  phone_number  :string(255)
#  address       :string(255)
#  city          :string(255)
#  state         :string(255)
#  neighborhood  :string(255)
#  category      :string(255)
#

class Bar < ActiveRecord::Base
  geocoded_by :address, :latitude  => :lat, :longitude => :lon 
  after_validation :geocode
  
  has_many :events

  def current_users
    Event.where('bar_id = ? AND updated_at > ?', id, Time.now - 15.minutes).count
  end
end
