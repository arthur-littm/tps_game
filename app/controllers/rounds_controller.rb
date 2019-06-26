class RoundsController < ApplicationController
  def show
    @round = Round.find(params[:id])
    @answer = Answer.new
  end

  def result
    @round = Round.find(params[:id])
    @start_up = @round.start_up
  end
end
