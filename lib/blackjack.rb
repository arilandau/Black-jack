require_relative "card"
require_relative "deck"
require_relative "hand"
require 'pry'
#
# deck = Deck.new
#
# dealer = Hand.new(deck.deal(2))
# player = Hand.new(deck.deal(2))
#
#
# if dealer.calculate_hand == 21
#   puts "Dealer has blackjack! You lose!"
# end
#


class Blackjack
  attr_reader :deck, :player_hand, :dealer_hand

  def initialize
    @deck = Deck.new
    @player_hand = Hand.new(@deck.deal(2))
    @dealer_hand = Hand.new(@deck.deal(2))
  end

  def play_game
    is_playing_game = true
    is_player_turn = true
    is_dealer_turn = true
    is_tallied = true
    index = 0


    puts "Player was dealt #{@player_hand.cards_in_hand[0].face_value}"
    puts "Player was dealt #{@player_hand.cards_in_hand[1].face_value}"
    puts "Dealer is showing #{@dealer_hand.cards_in_hand[1].face_value}"

    while is_playing_game

      while is_player_turn
        if @player_hand.calculate_hand == 21
          puts "Player has Blackjack!"
          is_player_turn = false
        elsif @player_hand.calculate_hand > 21
          puts "Player is bust, Dealer wins!"
          is_player_turn = false
          is_dealer_turn = false
          is_tallied = false
          is_playing_game = false
        else
          puts "Do you want to hit or stay (H/S)?"
          hit_or_stay = gets.chomp.capitalize

          if hit_or_stay == "H"
            @player_hand.add_card(@deck.deal(1)[0])
            puts "Player got a #{@player_hand.cards_in_hand[-1].face_value}!"

          elsif hit_or_stay == "S"
            puts "Player has #{@player_hand.calculate_hand}, Dealer's turn"
            is_player_turn = false
          else
            puts "Please enter an H or S!"
          end
        end
      end

      while is_dealer_turn

        while index == 0
          puts "Dealer is now showing a #{@dealer_hand.cards_in_hand[0].face_value}"
          index += 1
        end

        if @dealer_hand.calculate_hand < 17
          @dealer_hand.add_card(@deck.deal(1)[0])
          puts "Dealer got a #{@dealer_hand.cards_in_hand[-1].face_value}."
        elsif @dealer_hand.calculate_hand > 21
          puts "Dealer is bust, Player wins!"
          is_dealer_turn = false
          is_tallied = false
          is_playing_game = false
        elsif @dealer_hand.calculate_hand == 21
          puts "Dealer has Blackjack!"
          is_dealer_turn = false
        else
          puts "Dealer has #{@dealer_hand.calculate_hand}, Dealer stays."
          is_dealer_turn = false
        end
      end

      while is_tallied
        if @player_hand.calculate_hand == @dealer_hand.calculate_hand
          puts "Dealer has #{@dealer_hand.calculate_hand}, Player has #{@player_hand.calculate_hand}"
          puts "Dealer wins!"
          is_tallied = false
          is_playing_game = false
        elsif @player_hand.calculate_hand > @dealer_hand.calculate_hand
          puts "Player has #{@player_hand.calculate_hand}, Dealer has #{@dealer_hand.calculate_hand}"
          puts "Player wins!"
          is_tallied = false
          is_playing_game = false
        else
          puts "Dealer has #{@dealer_hand.calculate_hand}, Player has #{@player_hand.calculate_hand}"
          puts "Dealer wins!"
          is_tallied = false
          is_playing_game = false
        end
      end
    end
  end
end





  #   playing_game = true
  #   player_turn = true
  #   answer = "H"
  #
  #   while playing_game
  #     while player_turn
  #         puts "Do you want to hit or stay (H/S)?"
  #         answer = gets.chomp.capitalize
  #
  #           if answer == "H"
  #             @player_hand.add_card(@deck.deal(1))
  #
  #           elsif answer == "S"
  #             puts "Player stays, Dealer's turn."
  #             player_turn = false
  #
  #           else
  #             puts "Please enter and H or S!"
  #           end
  #
  #         # @player_hand.each { |hand| puts "You're current score is #{hand.calculate_hand}"}
  #       end
  #     end
  #
  #     dealer_turn = true
  #     while dealer_turn == true
  #       dealer_turn = false
  #     end
  #   end

# prompt user for input
# if user hits
#   deal a card
#   output dealt card
#   if blackjack (while player is playing ... )
#   PLAYER WINS AND playing_game = false (break while loop)
# elsif above 21
#   PLAYER LOSES AND END GAME playing game = false
  # else
  #   prompt again for input
      # while loop for hit or stand?
  # end
  # if user stands ====> player_turn = false
    # play the dealer turn
    # while score is playing (score < 17)
    # => hit on anyting less than 17
    # find the winner, tie goes to the dealer




  # private
  #
  # def player_starting_hand_output
  #   @player_hand.cards_in_hand.each do |card|
  #
  #   end
  # end
  #
  # def dealer_starting_hand_output
  #   puts "Dealer was dealt a facedown card."
  #   puts "Dealer was dealt #{@dealer_hand.cards_in_hand.first.face_value}"
  # end

# Your code here...
b = Blackjack.new
b.play_game

#deal to player
#hit me
# player.add_card(deck.deal(1).first)
