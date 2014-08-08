namespace :yelp do
  desc "Collect Bars from an area and add them to the database using Yelp API"
  task :get_bars_for_area, [:latitude, :longitude] => :environment do |t, args|
    require 'yelp'

    client = Yelp::Client.new({ consumer_key: "rvrO-9xzRoW4eACragjyng",
                                consumer_secret: "A4N-ZF6uEX7TvyslVa1MyJYce7s",
                                token: "eI1g-wy6UcXXTBZYEHQPOfgJqKePizFj",
                                token_secret: "Og9cu-J9kacGdY28gRShlrAAzFE"
                              })
    coordinates = { latitude: args[:latitude], longitude: args[:longitude] }
    resp = client.search_by_coordinates(coordinates, { term: 'bar' })
    resp.businesses.each do |bar|
      old_bar = Bar.where(:yelp_id => bar.id)
      if !old_bar.exists?
        new_bar = Bar.new(:name => bar.name,
                          :yelp_id => bar.id,
                          :logo_url => bar.image_url,
                          :image_url => bar.image_url,
                          :phone_number => (defined? bar.phone) ? bar.phone : nil,
                          :lat => (defined? bar.location.coordinate) ? bar.location.coordinate.latitude : nil,
                          :lon => (defined? bar.location.coordinate) ? bar.location.coordinate.longitude : nil,
                          :review_count => bar.review_count,
                          :rating => bar.rating,
                          :current_users => 0,
                          :price => 0.0)
        new_bar.save
        puts bar.name
      end
    end
  end

  task :test_offset => :environment do
    require 'yelp'

    client = Yelp::Client.new({ consumer_key: "rvrO-9xzRoW4eACragjyng",
                                consumer_secret: "A4N-ZF6uEX7TvyslVa1MyJYce7s",
                                token: "eI1g-wy6UcXXTBZYEHQPOfgJqKePizFj",
                                token_secret: "Og9cu-J9kacGdY28gRShlrAAzFE"
                              })
    0.upto(5).each do |x|
      resp = client.search('Chicago', { term: 'bars' }, offset: x*20)
      resp.businesses.each do |bar|
        puts bar.name
      end
    end
  end
end