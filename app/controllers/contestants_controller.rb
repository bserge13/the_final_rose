class ContestantsController < ApplicationController
  def index 
    @bach = Bachelorette.find(params[:bachelorette_id])
    @contestants = @bach.contestants 
  end

  def show
    @contestant = Contestant.find(params[:id])
    @bach = @contestant.bachelorette
  end
end