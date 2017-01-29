require 'pry'
class Card

  # Your code here
  attr_reader :value, :suit
  def initialize (rank, suit)
    @value = rank
    @suit = suit
  end

  def face_value
    "#{@value}#{@suit}"
  end

  def face_card?
    @value == "K" || @value == "Q" || @value == "J"
  end

  def ace?
    @value == "A"
  end
end
