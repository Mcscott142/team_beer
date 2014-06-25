class BeersController < ApplicationController

  def index
  end

  def new
    @beer = Beer.new
    @beer_types = BeerType.all
  end

  def create
    @beer = Beer.new(beer_params)


  end

end
