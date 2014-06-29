class BetaEmailsController < ApplicationController

  def new
    @beta_email = BetaEmail.new
  end

  def index
    if params[:search]
      beta_emails = BetaEmail.search(params[:search])
      @beta_emails = beta_emails.order("created_at DESC")
    else
      beta_emails = BetaEmail.all
      @beta_emails = BetaEmail.all.order("created_at DESC")
    end
  end

  def create
    @beta_email = BetaEmail.find_by(email: beta_email_params[:email].downcase)
    if @beta_email    
      render json: {:status => "error", :message => "Email exists already!"}
    else
      @beta_email = BetaEmail.new(beta_email_params)
      if @beta_email.save
        render json: {:status => "success", :message => "Thanks for Subscribing!"}   
      else
        render json: {:status => "error", :message => "Incorrect format."}
      end
    end
  end

  def destroy
    BetaEmail.find(params[:id]).destroy
    flash[:success] = "beta_email deleted."  
  end


  private

    def beta_email_params
      params.require(:beta_email).permit(:email)
    end
end
