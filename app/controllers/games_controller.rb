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
    @game.code = Faker::Movies::StarWars.planet.parameterize
    @user = User.new(name: game_params[:user_name])
    if @game.save
      @user.game = @game
      @user.save
      session[:user_id] = @user.id
      @game.update(user: @user)
      start_ups = StartUp.all.sample(rounds)
      rounds.times do
        start_up = start_ups.sample
        Round.create(game: @game, start_up: start_up, guess_category: Round::CATEGORIES.sample)
        start_ups.delete(start_up)
      end
      redirect_to game_path(@game.code)
    else
      render :new
    end
  end

  def endgame
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
