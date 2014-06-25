class BeersController < ApplicationController

  def index
    @beers = Beer.all
  end

  def new
    @beer = Beer.new
    @beer_types = BeerType.all
    @breweries = Brewery.all
  end

  def create
    @beer = Beer.new(beer_params)

    if @beer.save
      redirect_to beers_path
    else
      render :new
    end
  end

  private
  def beer_params
  params.require(:beer).permit(:name, :description, :brewery_id, :beer_type_id, :image, :alcohol_content)
  end

end