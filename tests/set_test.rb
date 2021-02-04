require 'minitest/autorun'
require_relative '../lib/set.rb'

class TestCard < MiniTest::Test
    #tests if addThreeDisplayedCardsToUsed will add the 3 given cards to the given array
    def test_add_three_displayed_cards_to_used
        card_one = Card.new(0, 0, 0, 1)
        card_two = Card.new(0, 0, 0, 2)
        card_three = Card.new(0, 0, 0, 3)

        cards_displayed = [card_one, card_two, card_three]
        cards_used = []

        add_three_displayed_cards_to_used(cards_displayed, cards_used, card_one, card_two, card_three)

        cards_used_wanted = [card_one, card_two, card_three]
        cards_displayed_wanted = []

        assert_equal cards_used, cards_used_wanted
        assert_equal cards_displayed, cards_displayed_wanted
    end

    # tests the is_set method by giving an example that is a set
    def test_is_set_is_a_set
        card_one = Card.new(0, 0, 0, 1)
        card_two = Card.new(0, 0, 0, 2)
        card_three = Card.new(0, 0, 0, 3)

        is_set_result = is_set(card_one, card_two, card_three)
        is_set_wanted = true

        assert_equal is_set_result, is_set_wanted
    end

    # tests the is_set method by giving an example that is not a set
    def test_is_set_is_not_a_set
        card_one = Card.new 0, 0, 0, 1
        card_two = Card.new 0, 0, 0, 2
        card_three = Card.new 1, 0, 0, 3

        is_set_result = is_set(card_one, card_two, card_three)
        is_set_wanted = false

        assert_equal is_set_result, is_set_wanted
    end

    # tests generate_deck to make sure it generates 81 cards
    def test_generate_cards
        cards_available = []

        generate_deck(cards_available)

        assert_equal 81, cards_available.length
    end

    # tests shuffle deck by making sure cards_available has all the cards
    def test_shuffle_deck
        cards_available = []
        cards_displayed = []
        cards_used = []

        generate_deck(cards_available)
        add_random_available_cards_to_displayed(cards_available, cards_displayed, 6)
        add_three_displayed_cards_to_used(cards_displayed, cards_used, cards_displayed[0], cards_displayed[1], cards_displayed[2])
        shuffle_deck(cards_available, cards_displayed, cards_used)

        assert_equal 81, cards_available.length
        assert_equal 0, cards_displayed.length
        assert_equal 0, cards_used.length
    end
end
