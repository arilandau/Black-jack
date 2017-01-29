require "spec_helper"

describe Card do
  let(:test_card) { Card.new("10", "♥") }
  let(:test_card2) { Card.new("Q", "%") }
  #
  describe "#value" do
    it "returns the value of a number card (10)" do
      expect(test_card.value).to eq("10")
    end

    it "returns the value of a face card(Q)" do
      expect(test_card2.value).to eq("Q")
    end
  end

  describe "#suit" do
    it "returns to suit shape (♥)" do
      expect(test_card.suit).to eq("♥")
    end
  end
  #
  describe "#face_value" do
    it "tells me the face value of a card" do
      expect(test_card.face_value).to eq("10♥")
    end
  end
end
