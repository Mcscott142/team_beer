class Admin::ReviewsController < ApplicationController

  before_action :authorize_admin

  def destroy
    Review.find(params[:id]).destroy
    redirect_to beers_path
  end

  private

  def authorize_admin
    if current_user.is_admin == false
      redirect_to root
    end
  end

end
