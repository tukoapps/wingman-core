module Api
  module V1
    class LocationsController < ApplicationController
      # acts_as_token_authentication_handler_for User
      respond_to :json
      
      def new
        if params[:user_id]
          bar = Bar.near([params[:lat],params[:lon]], 0.01).first
          user = MobileUser.find(params[:user_id])
          if bar
            event = Event.where('bar_id = ? AND mobile_user_id = ? AND created_at > ?', bar.id, user.id, Time.now-15.minutes).first
            if event
              event.update_attributes(:elapsed_minutes => event.elapsed_minutes + 15)
              respond_with event
            else
              new_event = Event.new(:bar_id => bar.id, :mobile_user_id => user.id, :elapsed_minutes => 0).save
              respond_with new_event
            end
          else
            respond_with "Error: no bar found"
          end
        else
          respond_with "Error: inccorrect or missing parameters"
        end
      end
      
    end
  end
end