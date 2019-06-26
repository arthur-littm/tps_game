class GamesController < ApplicationController
  before_action :find_game, only: [:show, :edit, :update, :destroy, :invite]
  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new
    @game.code = SecureRandom.hex(5)
    @game.user = find_user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def invite
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:code)
  end

  def find_user
    User.find(params[:user_id])
  end
end
