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

	def updateElo(winnerId, loserId)
		@user1 = User.find_by_id(winnerId)
		@user2 = User.find_by_id(loserId)
		bob  = Elo::Player.new(:rating => @user1.elo)
		jane = Elo::Player.new(:rating => @user2.elo)
		game1 = bob.wins_from(jane)
		@user1.update_attribute(:elo, bob.rating)
		@user2.update_attribute(:elo, jane.rating)
	end

	def updateEloTie(id1, id2)
		@user1 = User.find_by_id(id1)
		@user2 = User.find_by_id(id2)
		bob  = Elo::Player.new(:rating => @user1.elo)
		jane = Elo::Player.new(:rating => @user2.elo)
		game1 = bob.plays_draw(jane)
		@user1.update_attribute(:elo, bob.rating)
		@user2.update_attribute(:elo, jane.rating)
	end

end
