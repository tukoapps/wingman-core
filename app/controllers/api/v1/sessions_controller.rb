module Api
  module V1
    class SessionsController < ApplicationController
      respond_to :json
      require 'net/http'
      
      def new
        error = nil
        begin
          url = URI.parse('https://graph.facebook.com/me?access_token=' + params[:access_token])
          req = Net::HTTP::Get.new(url.to_s)
          res = Net::HTTP.start(url.host, url.port) {|http|
            http.request(req)
          }
        rescue => error
        end
        if error
          err = {error: "Facebook Access Token is invalid"}
          respond_with err.to_json
        else
          @user = User.where(:fb_id => params[:fb_id], :email => params[:email])
          if @user
            respond_with @user
          else
            # TODO: create new user
            # & return auth token
          end
        end
      end
      
    end
  end
end