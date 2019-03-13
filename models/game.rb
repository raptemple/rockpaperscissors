class Game

	def initialize(params)
		@move1 = params[:move1].to_s.downcase
		@move2 = params[:move2].to_s.downcase
		@secondplayer = set_second_player()
	end

	def result
		win_conditions = {
			"scissors" => "paper",
			"paper" => "rock",
			"rock" => "scissors"
		}

		if @move1 == @move2
			return "Draw!"
		elsif win_conditions[@move1] == @move2
			return "Player 1 wins with #{@move1}"
		elsif @move1 == win_conditions[@move2]
			return "Player 2 wins with #{@move2}"
		else
			return "Pick an actual option, please!"
		end	
	end

	def make_move
		options = {
			1 => "paper",
			2 => "rock",
			3 => "scissors"
		}
		return options[rand(1..3)]
	end

	def set_second_player
		# If move 2 has been entered, use Player 2
		return "Player 2" if @move2 != ""
		# Otherwise: Make random move and return computer
		@move2 = make_move()
		return "Computer"
	end
end
