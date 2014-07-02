class SearchesController < ApplicationController
  def index
    if params[:search][:search_type] == 'Beer'
      @searched_beers = Beer.beer_search(params[:search][:query])
      @searched_beers = @searched_beers.page(params[:page])
    else
      @searched_breweries = Brewery.brewery_search(params[:search][:query])
      @searched_breweries = @searched_breweries.page(params[:page])
    end
  end
end
