class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all
  end

  def show
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.beers
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name, :description, :city, :state, :url,
                    :region, :image)
  end
end
