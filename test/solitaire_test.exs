defmodule SolitaireTest do
  use ExUnit.Case
  setup do
    card = %{suite: :hearts, value: "K"}
    {:ok, card: card}
  end

  test "returns its color", %{card: card} do
    assert Solitaire.card_color(card) == :red
  end
  
  test "returns its value in points", %{card: card} do
    assert Solitaire.card_points(card) == 10
  end

  test "returns a list of cards without the card and fails if card is not in the list", %{card: card} do
    card_list = [%{suite: :hearts, value: "K"}, %{suite: :hearts, value: "A"},%{suite: :hearts, value: "J"}]
    assert Solitaire.remove_card(card_list, card, Error) == [%{suite: :hearts, value: "A"},%{suite: :hearts, value: "J"}]
    assert_raise ArithmeticError, fn ->
      Solitaire.remove_card(card_list, %{suite: :clubs, value: 5}, ArithmeticError)
    end
  end

  test "returns true if all the cards are the same color." do
    card_list = [%{suite: :hearts, value: "K"}, %{suite: :hearts, value: "A"},%{suite: :hearts, value: "J"}]
    assert Solitaire.all_same_color?( [%{suite: :hearts, value: "K"}, %{suite: :hearts, value: "A"},%{suite: :hearts, value: "J"}]) == true
    refute Solitaire.all_same_color?( [%{suite: :clubs, value: "K"}, %{suite: :hearts, value: "A"},%{suite: :hearts, value: "J"}]) == true
  end

  test "returns the sum of their values" do 
     card_list = [%{suite: :hearts, value: "K"}, %{suite: :hearts, value: "A"},%{suite: :hearts, value: "J"}]
     assert Solitaire.sum_cards(card_list) == 31
  end

  test "calculates the score" do
    assert Solitaire.score([%{suite: :hearts, value: 2}, %{suite: :clubs, value: 4}],10) == 4
    assert Solitaire.score([%{suite: :hearts, value: "K"}, %{suite: :spades, value: 3}],10) == 9
    assert Solitaire.score([%{suite: :hearts, value: "K"}, %{suite: :diamonds, value: "A"}],12) == 27 
  end
end
