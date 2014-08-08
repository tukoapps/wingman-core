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
#

class Bar < ActiveRecord::Base
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :lon
  has_many :events
end
