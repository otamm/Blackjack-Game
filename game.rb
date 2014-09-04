require_relative 'deck'
require 'pry'

class Game
  def initialize
    @game = Deck.new
    @game.hit(@game.player)
    @game.hit(@game.player)
    @game.hit(@game.dealer)
    @game.hit(@game.dealer)
  end

  def player_turn
    a = ""
    puts @game.score_calculator(@game.player)
    puts "Hit or Stand?(H/S)"
    while true
      a = gets.chomp
      if a.upcase == "H"
        @game.hit(@game.player)
         if @game.score_calculator(@game.player) > 21
          puts "Busted!"
          break
        end
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
      @game.hit(@game.dealer)
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
