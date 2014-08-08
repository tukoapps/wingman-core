module Api
  module V1
    class LocationsController < ApplicationController
      # acts_as_token_authentication_handler_for User
      respond_to :json
      
      def check
        lat_val = 42.019555#params[:lat]
        lon_val = -87.679735#params[:lon]
        Bar.where('ABS(lat - ?) < 1 AND ABS(lon - ?) < 1', lat_val, lon_val).limit(1)
        respond_with Bar.all.limit(20)
      end
      
    end
  end
end