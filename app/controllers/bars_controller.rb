class BarsController < ApplicationController
  def new
    @bar = Bar.new
  end

  def index
    @bars = Bar.all
  end

  def create
    @bar = Bar.new(bar_params)
    if @bar.save
      flash[:notice] = @bar.name + " has been added as an Bar!"
      redirect_to @bar
    else
      render 'new'
    end
  end

  def destroy
    Bar.find(params[:id]).destroy
    flash[:success] = "Bar deleted."
    redirect_to bars_path
  end

  def edit
    @bar = Bar.find(params[:id])
  end

  def update
    @bar = Bar.find(params[:id])
    if @bar.update_attributes(bar_params)
      flash[:notice] = "Bar profile updated"
      redirect_to @bar
    else
      render 'edit'
    end
  end

  def show
    @bar = Bar.find(params[:id])
  end

  private

    def bar_params
      params.require(:bar).permit(:name, :logo_url, :image_url, :rating, :price, :phone_number, :address, :city, :state, :neighborhood, :category)
    end
end