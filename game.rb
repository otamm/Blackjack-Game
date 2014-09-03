require_relative 'deck'
require 'pry'

class Game
  def initialize
    @game = Deck.new
    @game.player_hit
    @game.player_hit
    @game.dealer_hit
    @game.dealer_hit
  end

  def player_turn
    a = ""
    puts @game.score_calculator(@game.player)
    puts "Hit or Stand?(H/S)"
    while true
      a = gets.chomp
      if a.upcase == "H"
        @game.player_hit
      elsif a.upcase == "S"
        break
      else
        puts "Input again."
      end
      puts @game.score_calculator(@game.player)
    end
  end

  def dealer_turn
    while @game.score_calculator(@game.dealer) < 17
      @game.dealer_hit
    end
  end

  def end_game
    player = @game.score_calculator(@game.player)
    dealer = @game.score_calculator(@game.dealer)
    puts player
    puts dealer
    if (player > 21 && dealer > 21) || (player == dealer)
      puts "It's a tie!"
    elsif (dealer < player && player < 22) || dealer > 21
      puts "Player wins!"
    else
      puts "Dealer wins!"
    end
  end


end
