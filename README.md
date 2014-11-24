Solitaire
=========

This problem involves a solitaire card game invented just for this question. You will write a program that tracks the progress of a game; writing a game player is a challenge problem. You can do parts 1 to 5 before understanding the game if you wish.

A game is played with a card-list and a goal. The player has a list of held-cards, initially empty. The player makes a move by either drawing, which means removing the first card in the card-list from the card-list and adding it to the held-cards, or discarding, which means choosing one of the held-cards to remove. The game ends either when the player chooses to make no more moves or when the sum of the values of the held-cards is greater than the goal.

The objective is to end the game with a low score (0 is best). Scoring works as follows: Let `sum` be the sum of the values of the held-cards. If `sum` is greater than `goal` , the *preliminary score* is three times ( `sum - goal` ), else the *preliminary score* is ( `goal - sum` ). The score is the preliminary score unless all the held-cards are the same color, in which case the score is the preliminary score divided by 2 (and rounded down as usual with integer division).

1. Write a function `card_color`, which takes a card and returns its color (spades and clubs are black, diamonds and hearts are red). Note: One case-expression is enough.
2. Write a function `card_value`, which takes a card and returns its value (numbered cards have their number as the value, aces are 11, everything else is 10). Note: One case-expression is enough.
3. Write a function `remove_card`, which takes a list of cards cs , a card c , and an exception e . It returns a list that has all the elements of cs except c . If c is in the list more than once, remove only the rst one. If c is not in the list, raise the exception e . You can compare cards with = .
4. Write a function `all_same_color`, which takes a list of cards and returns true if all the cards in the list are the same color. Hint: An elegant solution is very similar to one of the functions using nested pattern-matching in the lectures.
5. Write a function `sum_cards`, which takes a list of cards and returns the sum of their values. Use a locally dened helper function that is tail recursive. (Take \calls use a constant amount of stack space" as a requirement for this problem.)
6. Write a function `score`, which takes a card list (the held-cards) and an int (the goal) and computes the score as described above.
7. Write a function `officiate`, which \runs a game." It takes a card list (the card-list) a move list (what the player \does" at each point), and an int (the goal) and returns the score at the end of the game after processing (some or all of) the moves in the move list in order. Use a locally dened recursive helper function that takes several arguments that together represent the current state of the game. As described above: The game starts with the held-cards being the empty list. The game ends if there are no more moves. (The player chose to stop since the move list is empty.) If the player discards some card c , play continues (i.e., make a recursive call) with the held-cards not having c and the card-list unchanged. If c is not in the held-cards, raise the IllegalMove exception. If the player draws and the card-list is (already) empty, the game is over. Else if drawing causes the sum of the held-cards to exceed the goal, the game is over (after drawing). Else play continues with a larger held-cards and a smaller card-list. Sample solution for (g) is under 20 lines.

##### Challenge Problems:

1. Write `score_challenge` and `officiate_challenge` to be like their non-challenge counterparts except each ace can have a value of 1 or 11 and `score_challenge` should always return the least (i.e., best) possible score. (Note the game-ends-if-sum-exceeds-goal rule should apply only if there is no sum less than or equal to the goal.) Hint: This is easier than you might think.
2. Write `careful_player`, which takes a card-list and a goal and returns a move-list such that calling officiate with the card-list, the goal, and the move-list has this behavior:
  * The value of the held cards never exceeds the goal.
  * A card is drawn whenever the goal is more than 10 greater than the value of the held cards. As a detail, you should (attempt to) draw, even if no cards remain in the card-list.
  * If a score of 0 is reached, there must be no more moves.
  * If it is possible to discard one card, then draw one card to produce a score of 0, then this must be done. Note `careful_player` will have to look ahead to the next card, which in many card games is considered \cheating." Also note that the previous requirement takes precedence: There must be no more moves after a score of 0 is reached even if there is another way to get back to 0.

    Notes:
    * There may be more than one result that meets the requirements above. The autograder should work for any correct strategy | it checks that the result meets the requirements.
    * This problem is not a continuation of problem 3(a). In this problem, all aces have a value of 11.
