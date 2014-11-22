defmodule Solitaire do

  def card_color(%{suite: suite}) do
    case suite do
      :hearts -> :red
      :diamonds -> :red
      :spades -> :black
      :clubs -> :black
    end
  end

  def card_points(%{value: value}) do
    cond do
      value < 10 -> value
      value == "A" -> 11
      true -> 10
    end
  end

  def remove_card([], card, ex), do: raise ex
  def remove_card([h|t], card, ex) do
    cond do
      Dict.equal?(h,card) -> t 
      true -> h ++ remove_card(t,card,ex)
    end
  end
  
  def all_same_color?([_]), do: true
  def all_same_color?([first,second|t]) do
    color = card_color(second)
    case card_color(first) do
      ^color -> all_same_color?([second | t])
      _ -> false
    end
  end

  def sum_cards([]), do: 0
  def sum_cards([h|t]) do
    card_points(h) + sum_cards(t)
  end

  def score([], score), do: score 
  def score(card_list, score) do
    sum = Enum.reduce(card_list, 0, fn(e, acc) -> acc + card_points(e) end)
    if (sum > score), do: 3*(sum-score), else: (score-sum)
  end
end
