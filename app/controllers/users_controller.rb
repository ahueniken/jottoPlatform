class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user]) 
    if @user.save
      self.class.initializeRecords(@user.id)
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def UsersController.initializeRecords(userId)
    @user = User.find_by_id(userId)
    @user.update_attribute(:wins, 0)
    @user.update_attribute(:losses, 0)
    @user.update_attribute(:ties, 0)
    logger.debug "------------------------------------"
    Rails.logger.info(@user.errors.messages.inspect)
  end

end
