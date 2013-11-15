module GamesHelper

 def compareWords(guess, secret)
 	count = 0
 	for i in 0..4
 		if guess[i] == secret[i]
 			count = count + 1
 		end
 	end
 	return count
 end
 
end
