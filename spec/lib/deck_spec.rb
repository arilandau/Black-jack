require "spec_helper"

RSpec.describe Deck do
let(:test_deck) { Deck.new }
let(:test_deck2) { Deck.new }

  describe "#cards" do
    it "contains 52 card objects" do
      expect(test_deck.cards.length).to eq(52)
    end


    it "contains 52 unique objects" do
      expect(test_deck.cards.uniq.size).to eq(52)
    end
#
    it "shuffles the deck" do
      expect(test_deck.cards[0]).not_to eq(test_deck2.cards[0])
    end
  end
#
  describe "#deal" do
    it "returns an array of cards" do
      expect(test_deck.deal(2)).to be_a(Array)
    end

    it "removes correct number of cards" do
      start_size = test_deck.cards.size
      finish_size = start_size - 2
      test_deck.deal(2)
      expect(test_deck.cards.size).to eq(finish_size)
    end

    it "deals the top card in the deck" do
      correct_card = test_deck.cards[-1]
      expect(test_deck.deal(1)).to eq([correct_card])
    end
  end
end
