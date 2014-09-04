class Deck
  attr_accessor :deck, :player, :dealer
  def initialize
    @deck = []
    (1..10).each do |card|
      deck << card.to_s + "♠"
      deck << card.to_s + "♥"
      deck << card.to_s + "♣"
      deck << card.to_s + "♦"
    end

    (["♦","♣","♥","♠"]).each do |card|
      deck << "A" + card
      deck << "K" + card
      deck << "Q" + card
      deck << "J" + card
    end
    @player = []
    @dealer = []
  end

  def hit(hand)
    card = @deck.sample
    hand << card
    @deck.delete(card)
  end

  def score_calculator(hand)
    bj_score=0
    for i in hand
      if i.include?"2"
        bj_score+=2
      end
      if i.include?"3"
        bj_score+=3
      end
      if i.include?"4"
        bj_score+=4
      end
      if i.include?"5"
        bj_score+=5
      end
      if i.include?"6"
        bj_score+=6
      end
      if i.include?"7"
        bj_score+=7
      end
      if i.include?"8"
        bj_score+=8
      end
      if i.include?"9"
        bj_score+=9
      end
      if i.include?"10"
        bj_score+=10
      end
      if i.include?"Q"
        bj_score+=10
      end
      if i.include?"J"
        bj_score+=10
      end
      if i.include?"K"
        bj_score+=10
      end
      if i.include?"A"
        bj_score+=11
      end
    end
    for c in hand
      if bj_score > 21 and c.include?("A")
        bj_score=bj_score-10
      end
    end
  return bj_score
end

end
