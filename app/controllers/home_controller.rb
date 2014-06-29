class HomeController < ApplicationController
  def index
    @beta_email = BetaEmail.new
  end
end
