require_relative 'deck'
require_relative 'card'
require 'pry'

class Hand
  attr_reader :playing_deck, :cards_in_hand, :calculate_hand, :add_card

  def initialize (cards)
    @cards_in_hand = cards
  end

  def add_card (card)
    @cards_in_hand << card
    # puts "You have a #{@player_hand.cards_in_hand[-1].face_value}!"
  end

  def subtotal
    "Your current total is #{calculate_hand}!"
  end

  def calculate_hand
    score = 0
    aces = 0
    @cards_in_hand.each do |card|
      if card.face_card?
        score += 10
      elsif card.ace?
        score += 11
        aces += 1
      else
        score += card.value.to_i
      end
    end

    while score > 21 && aces > 0
      score -= 10
      aces -= 1
    end
    score
  end
end
