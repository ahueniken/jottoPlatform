class GamesController < ApplicationController
 
  def new
  	@game = Game.new
  end

  def show
  	@game = Game.find(params[:id])
  end

  def create
    @game = Game.new(params[:game]) 
    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end


end
