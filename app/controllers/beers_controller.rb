class BeersController < ApplicationController

  def index
    if params[:search]
      @beers = Beer.search(params[:search][:query])
    else
      @beers = Beer.all
    end

    @beers = @beers.order(:name).page(params[:page])
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

  def show
    @beer = Beer.find(params[:id])
    @reviews = @beer.reviews
    @new_review = Review.new
  end

  def search

  end
end
