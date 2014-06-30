class BeersController < ApplicationController

  def index
    @beers = Beer.order(:name).page(params[:page])

    if ['vote_count', 'avg_rating', 'name'].include? params[:order_by]
      order_by = { params[:order_by] => :desc}
    else
      order_by = { 'vote_count' => :desc }
    end

    @beers = Beer.order(:name).page(params[:page])
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

 private

  def beer_params
    params.require(:beer).permit(:name, :description, :brewery_id, :beer_type_id, :image, :alcohol_content)
  end
end

