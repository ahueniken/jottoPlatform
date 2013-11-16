class GamesController < ApplicationController
  @@setupCompleted = false
  @@p1Done = false
  @@p2Done = false

  def new
  	@game = Game.new
  end

  def show
  	@game = Game.find(params[:id])
    @p1Done = false
    @p2Done = false 

    if @game.word1 != nil && @game.word2 != nil
      @@setupCompleted = true
    else
      @@setupCompleted = false
    end

    if (@game.p1GuessResults != nil)
      if @game.p1GuessResults.include? @game.word2
        @p1Done = true
      end
    end
    if (@game.p2GuessResults != nil)
      if @game.p2GuessResults.include? @game.word1
        @p2Done = true
      end
    end

    if @game.winner != nil || (@p1Done && @p2Done)
      @gameDone = true
    else 
      @gameDone = false
    end

    if @gameDone && @game.winner == nil
      if @game.p2GuessResults.length < @game.p1GuessResults.length
        @game.update_attribute(:winner, @game.user2) 
        updateWinner(@game.user2)
        updateLoser(@game.user1)
        updateElo(@game.user2, @game.user1)
      elsif @game.p1GuessResults.length < @game.p2GuessResults.length
        @game.update_attribute(:winner, @game.user1) 
        updateWinner(@game.user1)
        updateLoser(@game.user2)
        updateElo(@game.user1, @game.user2)
      else
        @game.update_attribute(:winner, -1) 
        updateTies(@game.user2)
        updateTies(@game.user1)
        updateEloTie(@game.user1, @game.user2)
      end
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
        if @game.update_attributes(:word1 => params[:game][:word1].upcase) 
          flash[:success] = params[:game][:word1]
          redirect_to @game
        else 
          flash[:error] = "Invalid Word"
          redirect_to @game
        end
      elsif current_user.id == @game.user2
        if @game.update_attributes(:word2 => params[:game][:word2].upcase)
          flash[:success] = params[:game][:word2]
          redirect_to @game
        else 
          flash[:error] = "Invalid Word"
          redirect_to @game
        end
      end
    

    else
      if current_user.id == @game.user1
        if (@game.p1GuessResults != nil)
          guesses = @game.p1GuessResults 
          guesses[params[:game][:p1guesses]] = compareWords(params[:game][:p1guesses].upcase, @game.word2.upcase)
        else 
          guesses = Hash.new
          guesses[params[:game][:p1guesses]] = compareWords(params[:game][:p1guesses].upcase, @game.word2.upcase)
        end
        if @game.update_attributes(:p1GuessResults => guesses) 
          flash[:success] = params[:game][:p1guesses]
          redirect_to @game
        end
      
      elsif current_user.id == @game.user2
       if (@game.p2GuessResults != nil)
          guesses = @game.p2GuessResults 
          guesses[params[:game][:p2guesses]] = compareWords(params[:game][:p2guesses].upcase, @game.word1.upcase)
        else 
          guesses = Hash.new
          guesses[params[:game][:p2guesses]] = compareWords(params[:game][:p2guesses].upcase, @game.word1.upcase)
        end
        if @game.update_attributes(:p2GuessResults => guesses)
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
