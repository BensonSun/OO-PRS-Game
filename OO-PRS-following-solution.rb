class Hand
  include Comparable
  attr_accessor :value
  
  def initialize(v)
    @value = v
  end

  def <=>(another_hand)
    if self.value == another_hand.value
      0
    elsif (self.value == "P" && another_hand.value == "R") || (self.value == "R" && another_hand.value == "S") || (self.value == "S" && another_hand.value == "P")
      1
    else
      -1
    end
  end

  def display_winner_message
    case @value
      when "P"
        puts "Paper wraps rock!"
      when "R"
        puts "Rock smashes scissors!"
      when "S"
        puts "Scissors cut paper!"
      end
  end


end

class Player
  attr_accessor :hand
  attr_reader :name

  def initialize (n)
    @name = n
  end
end

class Human < Player
  def pick
    begin
      puts "#{name}, please pick one: Paper, Scissors, Rock (P/R/S)"
      c = gets.chomp.upcase
    end until Game::CHOICE.keys.include?(c)
    puts "#{name} picked #{Game::CHOICE[c]}!"  
    self.hand = Hand.new(c)
  end
end


class Computer < Player
  def pick
    self.hand = Hand.new(Game::CHOICE.keys.sample)
    puts "#{name} picked #{Game::CHOICE[hand.value]}!"
      
  end
end



class Game
  CHOICE = {"P" => "Paper", "R" => "Rock", "S" => "Scissors"}
  def initialize
    @player = Human.new("Benson")
    @computer = Computer.new("X864")
  end

  def play
  	@player.pick
  	@computer.pick
  	compare
  end

  def compare
    if @player.hand > @computer.hand
      @player.hand.display_winner_message
      puts "#{@player.name} won!"
    elsif @player.hand < @computer.hand
      @player.hand.display_winner_message
      puts "#{@computer.name} won!"
    else @player.hand == @computer.hand
      puts "It's a tie!"
    end
  end

end

Game.new.play