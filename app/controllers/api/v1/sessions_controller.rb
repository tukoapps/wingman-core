module Api
  module V1
    class SessionsController < ApplicationController
      respond_to :json
      require 'net/http'
      
      def new
        error = nil
        begin
          url = URI.parse('https://graph.facebook.com/me?access_token=' + params[:access_token])
          https = Net::HTTP.new(url.host, url.port)    
          https.use_ssl = true                                                         
          https.verify_mode = OpenSSL::SSL::VERIFY_NONE     
          res = https.request_get(url.path + '?' + url.query)
          hash = JSON.parse(res.body)
        rescue => error
        end
        if error
          err = {error: "Facebook Access Token is invalid or not provided"}
          respond_with err.to_json
        else
          @mobile_user = MobileUser.where(:fb_id => hash['id'].to_i).first
          if @mobile_user
            respond_with @mobile_user
          else
            user = MobileUser.new(:fb_id => hash['id'].to_i, 
                                  :first_name => hash['first_name'],
                                  :last_name => hash['last_name'],
                                  :male => (hash['gender'] == "male") ? true : false
                                  )
            if user.save
              respond_with user
            end
          end
        end
      end
    end
  end
end