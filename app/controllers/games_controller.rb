class GamesController < ApplicationController
  before_action :find_game, only: [:show]

  def show
  end

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
    @game.code = SecureRandom.hex(5)
    @game.user = find_user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  private

  def find_game
    @game = Game.find_by(code: params[:id])
  end

  def find_user
    User.find(params[:user_id])
  end
end
