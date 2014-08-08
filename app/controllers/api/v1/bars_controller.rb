module Api
  module V1
    class BarsController < ApplicationController
      # acts_as_token_authentication_handler_for User
      respond_to :json
      
      def index
        # hash = {:id => params[:id], :lat => params[:lat], :lon => params[:lon]}
        # respond_with Bar.all.limit(20)
        respond_with Bar.within(5, :origin => [params[:lat],params[:lon]]).limit(5)
      end
      
      def show
        respond_with Bar.find(params[:id])
      end
    end
  end
end