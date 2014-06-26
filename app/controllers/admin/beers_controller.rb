class Admin::BeersController < ApplicationController

  before_action :authorize_admin

  def destroy
    Beer.find(params[:id]).destroy
    redirect_to beers_path
  end

end
