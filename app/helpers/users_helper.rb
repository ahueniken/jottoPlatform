module UsersHelper

	def updateWinner(userId)
		@user = User.find_by_id(userId)
		@user.update_attribute(:wins, @user.wins + 1)
	end

	def updateLoser(userId)
		@user = User.find_by_id(userId)
		@user.update_attribute(:losses, @user.losses + 1)
	end

	def updateTies(userId)
		@user = User.find_by_id(userId)
		@user.update_attribute(:ties, @user.ties + 1)
	end

end
