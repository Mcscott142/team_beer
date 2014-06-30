class BreweriesController < ApplicationController
  def index
    if @searched_breweries?
      @breweries = @searched_breweries
    else
      @breweries = Brewery.all
    end
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
