class RoundsController < ApplicationController
  def show
    @round = Round.find(params[:id])
    @answer = Answer.new
  end
end
