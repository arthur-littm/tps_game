class RoundsController < ApplicationController
  def show
    @round = Round.find(params[:id])
    @answer = Answer.new
    @user = User.find(session[:user_id])
    redirect_to result_game_round_path(@round.game, @round) if @round.game.users.size == @round.answers.size
  end

  def result
    @round = Round.find(params[:id])
    @start_up = @round.start_up
  end
end
