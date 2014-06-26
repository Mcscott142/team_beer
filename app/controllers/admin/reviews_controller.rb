class Admin::ReviewsController < ApplicationController

  before_action :authorize_admin

  def destroy
    Review.find(params[:id]).destroy
    redirect_to beers_path
  end

end
