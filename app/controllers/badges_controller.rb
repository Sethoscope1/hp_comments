class BadgesController < ApplicationController

  def index
    @allBadges = Merit::Badge.keys.map { |key| Merit::Badge[key] }
    
    respond_to do |format|
      format.html { render json: @allBadges }
      format.json { render json: @allBadges }
    end
  end
end
