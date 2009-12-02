module Bowling
	class Game
		def initialize
			@rolls = []
		end

		def roll(pins)
			@rolls << pins
		end

		def score
			score = 0
			roll_idx =0
			10.times do
				if roll_at(roll_idx) == 10 #strike
					score += roll_at(roll_idx)
					score += two_rolls_from(roll_idx + 1)
					roll_idx += 1
				elsif two_rolls_from(roll_idx) == 10 #spare
					score += two_rolls_from(roll_idx)
					score += roll_at(roll_idx + 2)
					roll_idx += 2
				else #others
					score += two_rolls_from(roll_idx)
					roll_idx += 2
				end
			end
			score
		end

		private
		def roll_at(idx)
			@rolls[idx]
		end
		def two_rolls_from(idx)
			@rolls[idx] + @rolls[idx + 1]
		end
	end
end
