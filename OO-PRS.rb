class Player
	attr_accessor :name, :player_pick

	def initialize(n)
		@name = n
	end

	def pick
		begin
		puts "Pick one:Paper, Scissors, Rock (P/R/S)"
		self.player_pick = gets.chomp.upcase
			if self.player_pick == "P"
				puts "#{name} picked Paper!"
			elsif self.player_pick == "R"
				puts "#{name} picked Rock!"
			elsif self.player_pick == "S"
				puts "#{name} picked Scissors!"
			end
		end until (self.player_pick == "P") || (self.player_pick == "R") || (self.player_pick == "S")
	end
end

class Computer
	attr_accessor :computer_pick

	def pick
		self.computer_pick = ["P","R","S"].sample
		if self.computer_pick == "P"
			puts "Computer picked Paper!"
		elsif self.computer_pick = "R"
			puts "Computer picked Rock"
		elsif self.computer_pick = "S"
			puts "Computer picked Scissors"
		end
	end
end



class PRS
	def play(n)
		begin
			player = Player.new(n)
			player.pick
			computer = Computer.new
			computer.pick
			compare(player,computer)
			answer = play_again?
		end until answer == "N"
	end
	
	def compare(player,computer)
		if (player.player_pick == "P" && computer.computer_pick == "R") 
			puts "Paper wraps Rock, #{player.name} won!"
		elsif (player.player_pick == "R" && computer.computer_pick == "S")  
			puts "Rock smashes Scissors, #{player.name} won!"
		elsif (player.player_pick == "S" && computer.computer_pick == "P") 
			puts "Scissors cuts Paper, #{player.name} won!"
		elsif (computer.computer_pick == "P" && player.player_pick == "R") 
			puts "Paper wraps Rock, computer won!"
		elsif (computer.computer_pick == "R" && player.player_pick == "S")  
			puts "Rock smashes Scissors, computer won!"
		elsif (computer.computer_pick == "S" && player.player_pick == "P") 
			puts "Scissors cuts Paper, computer won!"
		else
			puts "It's a tie!"
		end
	end

	def play_again?
		begin
			puts "Do you want to play again? (Y/N)"
			answer = gets.chomp.upcase
		end until answer == "Y" || answer == "N"
		return answer
	end
end

PRS.new.play("Benson")