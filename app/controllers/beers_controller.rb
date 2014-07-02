class BeersController < ApplicationController

  def index
    @beers = Beer.order(:name).page(params[:page])

    if ['vote_count', 'avg_rating', 'name'].include? params[:order_by]
      order_by = { params[:order_by] => :desc}
    else
      order_by = { 'vote_count' => :desc }
    end

    if params[:beer_type]
      results = Beer.find_by_sql(["SELECT beers.id FROM beers JOIN beer_types
        ON beers.beer_type_id = beer_types.id WHERE beer_types.name = ?",
        params[:beer_type]])
      new_results = results.map { |x| x.id }
      @beers = Beer.where(id: new_results).order(order_by).page(params[:page])

    else
      @beers = Beer.order(order_by).page(params[:page])
    end
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

