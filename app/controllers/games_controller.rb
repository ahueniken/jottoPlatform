class GamesController < ApplicationController
  
  def new
  	@game = Game.new
  end

  def show
  	@game = Game.find(params[:id])
    if @game.word1 != nil && @game.word2 != nil
      @setupflag = true
    else
      @setupflag = false
    end
  end

  def create
    @game = Game.new(params[:game]) 
    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def update
  	@game = Game.find(params[:id])
    if current_user.id == @game.user1
      if @game.update_attribute(:word1, params[:game][:word1]) 
        flash[:success] = params[:game][:word1]
        redirect_to @game
      else
        flash[:error] = "Errpr"
        render 'show'
      end
    elsif current_user.id == @game.user2
      if @game.update_attribute(:word2, params[:game][:word2])
        flash[:success] = params[:game][:word2]
        redirect_to @game
      else
        flash[:error] = "Errpr"
        render 'show'
      end
    end
  end


end
