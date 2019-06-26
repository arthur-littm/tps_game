class GamesController < ApplicationController
  before_action :find_game, only: [:show]

  def invite
    @user = User.new
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new
    rounds = game_params[:rounds].to_i
    @game.code = SecureRandom.hex(5)
    @user = User.new(name: game_params[:user_name])
    if @game.save
      @user.game = @game
      @user.save
      session[:user_id] = @user.id
      @game.update(user: @user)
      rounds.times do
        startups = StartUp.all.sample(rounds)
        Round.create(game: @game, start_up: startups[rounds - 1])
      end
      redirect_to game_path(@game.code)
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:rounds, :user_name)
  end

  def find_game
    @game = Game.find_by(code: params[:id])
  end

  def find_user
    User.find(params[:user_id])
  end
end
