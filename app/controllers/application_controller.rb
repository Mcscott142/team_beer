class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :vote_count

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def vote_count(upvoteable_object)
    sum = 0
    upvoteable_object.votes.each do |vote|
      sum = sum + vote.vote
    end
    sum
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:is_21, :img_url, :username]
  end

  def authorize_admin
    if current_user.is_admin == false
      redirect_to root
    end
  end
end
