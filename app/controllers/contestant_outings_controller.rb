class ContestantOutingsController < ApplicationController
  def destroy
    contestant = Contestant.find(params[:contestant_id])
    outing = Outing.find(params[:outing_id])
    contestant_outing = ContestantOuting.find_by(outing_id: outing.id, contestant_id: contestant.id)

    contestant_outing.delete 
    redirect_to outing_path(outing)
  end
end