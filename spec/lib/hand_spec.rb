require "spec_helper"
require 'pry'
RSpec.describe Hand do
  # Your tests here
  #deals initial hand
  let(:test_deck) { Deck.new }
  let(:test_hand) { Hand.new(test_deck.deal(2)) }
  let(:test_hand2) { test_hand.add_card(test_deck.deal(1))}
  let(:test_hand3) { Hand.new([Card.new("10", "♦"), Card.new("J", "♥")])}
  let(:test_hand4) { Hand.new([Card.new("10", "♦"), Card.new("3", "♥")])}
  let(:test_hand5) { Hand.new([Card.new("A", "♦"), Card.new("Q", "♥")])}
  let(:test_hand6) { Hand.new([Card.new("A", "♦"), Card.new("9", "♥"), Card.new("10", "♦")])}
  let(:test_hand7) { Hand.new([Card.new("9", "♥"), Card.new("10", "♦"), Card.new("A", "♦")])}



  # let(:test_hand3) { Hand.new(["10♦", "J♥"]) }
  # let(:test_hand5) { Hand.new(["A♦", "10♦"])}
  # let(:test_hand6) { Hand.new(["10♦", "10♦", "A♦"])}

  describe "#new" do
    it "creates a hand object" do
      expect(test_hand).to be_a(Hand)
    end
  end

  describe "#cards_in_hand" do
    it "takes in a certain number of cards" do
      expect(test_hand.cards_in_hand.count).to eq(2)
    end

    it "stores an array of cards" do
      expect(test_hand.cards_in_hand).to be_a(Array)
    end
  end

  describe "#add card" do
    it "increases #cards_in_hand by 1" do
      expect(test_hand2.size).to eq(3)
    end

    it "removes a card from the deck" do
      test_hand2
      expect(test_deck.cards.size).to eq(49)
    end
  end

  describe "#calculate_hand" do
    # We have included some example tests below. Change these once you get started!

    it "adds up cards that include a face card" do
      # Use the RSpec keyword `expect`, as it appears below, to test your assertions
      result = test_hand3.calculate_hand
      expect(result).to eq(20)
    end

    it "adds up number cards" do
      result = test_hand4.calculate_hand
      expect(result).to eq(13)
    end
    
    it "counts aces as 11 if total is 21 or less" do
      result = test_hand5.calculate_hand
      expect(result).to eq(21)
    end

    it "counts aces as 1 if total would go over 21" do
      result = test_hand6.calculate_hand
      result2 = test_hand7.calculate_hand

      expect(result).to eq(20)
      expect(result).to eq(20)
    end
  end
  # describe "#playing_deck" do
  #   it "has no cards left after 26 hands" do
  #     50.times { lets_play.hit_me }
  #
  #     expect(lets_play.playing_deck.cards).to eq([])
  #   end
  # end
  #
  # describe "#show_me" do
  #   it "tells me the value of my hand" do
  #     play = Hand.new
  #     play.hand = Card.new("10", "♥")
  #     expect(play.show_me).to eq("Player has a 10♥")
  #   end
  #
  #   it "addresses the players directly" do
  #     card_1 = Card.new("10", "♥")
  #     card_2 = Card.new("9", "♥")
  #     play = Hand.new([card_1, card_2])
  #     binding.pry
  #     expect(play.show_me("dealer")).to eq("Dealer has a 10♥")
  #   end

end
  #outputs face value of cards

  #tallies score
