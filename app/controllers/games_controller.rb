class GamesController < ApplicationController
  @@setupCompleted = false

  def new
  	@game = Game.new
  end

  def show
  	@game = Game.find(params[:id])
    if @game.word1 != nil && @game.word2 != nil
      @@setupCompleted = true
    else
      @@setupCompleted = false
    end

    if (@game.p1guesses != nil)
      @p1guessarray = @game.p1guesses.split(',')
    end
    if (@game.p2guesses != nil)
      @p2guessarray = @game.p2guesses.split(',')
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
   
    if !@@setupCompleted
      if current_user.id == @game.user1
        if @game.update_attribute(:word1, params[:game][:word1]) 
          flash[:success] = params[:game][:word1]
          redirect_to @game
        end
      elsif current_user.id == @game.user2
        if @game.update_attribute(:word2, params[:game][:word2])
          flash[:success] = params[:game][:word2]
          redirect_to @game
        end
      end

    else
      if current_user.id == @game.user1
        if (@game.p1guesses != nil)
          guesses = @game.p1guesses + "," + params[:game][:p1guesses]
        else 
          guesses = params[:game][:p1guesses]
        end
        if @game.update_attribute(:p1guesses, guesses) 
          flash[:success] = params[:game][:p1guesses]
          redirect_to @game
        end
      elsif current_user.id == @game.user2
        if (@game.p2guesses != nil)
          guesses = @game.p2guesses + "," + params[:game][:p2guesses]
        else 
          guesses = params[:game][:p2guesses]
        end
        if @game.update_attribute(:p2guesses, guesses)
          flash[:success] = params[:game][:p2guesses]
          redirect_to @game
        end
      end
    end


  end

  helper_method :setupCompleted
  def setupCompleted
    @@setupCompleted
  end


end
