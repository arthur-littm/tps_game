class RoundsController < ApplicationController
  def show
    @round = Round.find(params[:id])
    @answer = Answer.new
    @user = User.find(session[:user_id])
    redirect_to result_game_round_path(@round.game, @round) if @round.game.users.size <= @round.answers.size
    if Game.find_by(code: params[:game_id]).rounds.first == @round
      Pusher.trigger('game-channel','start-game', {
        started: true
      })
    end
  end

  def result
    @round = Round.find(params[:id])
    @start_up = @round.start_up
  end
end
