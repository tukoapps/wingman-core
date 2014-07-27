module Api
  module V1
    class BarsController < ApplicationController
      # acts_as_token_authentication_handler_for User
      respond_to :json
      
      def index
        respond_with Bar.all
      end
      
      def show
        respond_with Bar.find(params[:id])
      end
    end
  end
end