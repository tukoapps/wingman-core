namespace :yelp do
  desc "[DEPRECATED] Collect Bars from an area and add them to the database using Yelp API"
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
        bigger_image = bar.image_url.sub! "ms.jpg", "ls.jpg"
        new_bar = Bar.new(:name => bar.name,
                          :yelp_id => bar.id,
                          :logo_url => bar.image_url,
                          :image_url => (defined? bigger_image) ? bigger_image : bar.image_url,
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

  desc "Collect Bars from a city and add them to the database using Yelp API"
  task :get_city, [:city] => :environment do |t, args|
    require 'yelp'

    client = Yelp::Client.new({ consumer_key: "rvrO-9xzRoW4eACragjyng",
                                consumer_secret: "A4N-ZF6uEX7TvyslVa1MyJYce7s",
                                token: "eI1g-wy6UcXXTBZYEHQPOfgJqKePizFj",
                                token_secret: "Og9cu-J9kacGdY28gRShlrAAzFE"
                              })
    types = ['champagne_bars', 'divebars', 'gaybars', 'irish_pubs', 'lounges', 'pubs', 'sportsbars', 'wine_bars']
    types.each do |type|
      total_type = client.search(args[:city], { term: 'bars', category_filter: type}, limit: 1).total
      0.upto((total_type/20).ceil).each do |x|
        resp = client.search(args[:city], { term: 'bars', category_filter: 'pubs' }, offset: x*20, limit: 20)
        resp.businesses.each do |bar|
          old_bar = Bar.where(:yelp_id => bar.id)
          if !old_bar.exists?
            if !defined? bar.location.coordinate
              loc_str = ""
              bar.location.display_address.each do |c|
                loc_str += c + " "
              end
              coords = Geocoder.coordinates(loc_str)
            end

            begin
              bigger_image = bar.image_url.sub! "ms.jpg", "ls.jpg"
              new_bar = Bar.new(:name => bar.name,
                                :yelp_id => bar.id,
                                :logo_url => bar.image_url,
                                :image_url => (defined? bigger_image) ? bigger_image : bar.image_url,
                                :phone_number => (defined? bar.phone) ? bar.phone : nil,
                                :lat => (defined? bar.location.coordinate) ? bar.location.coordinate.latitude : (defined? coords[0]) ? coords[0] : nil,
                                :lon => (defined? bar.location.coordinate) ? bar.location.coordinate.longitude : (defined? coords[1]) ? coords[1] : nil,
                                :address => bar.location.address[0],
                                :city => bar.location.city,
                                :neighborhood => (defined? bar.location.neighborhoods) ? bar.location.neighborhoods[0] : nil,
                                :state => bar.location.state_code,
                                :review_count => bar.review_count,
                                :rating => bar.rating,
                                :category => type,
                                :current_users => 0,
                                :price => 0.0)
              if new_bar.save
                puts bar.name
              end
            rescue => error
              puts "#{bar.id} could not be added because #{error}"
            end
          end
        end
      end
    end
  end
end