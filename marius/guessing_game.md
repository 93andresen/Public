We are playing a game. It's about trying to use logic and reasoning to estimate guesses and hope the guess is closer to the correct answer then the other players guesses. to questions where we don't or even can't know the answers.

Each round all players will write a text that consists of 3 parts:

**Part 1: The Wild Guess**
    When a question is presented, the first thing every player has to do immediatly before any chance to think is to write a Wild Guess. **This is strict** to keep it fair for all players.
    
    **Any response that starts with anything else then a wild guess is immediatly disqualified** as this is the only way to make sure noone gains an unfair advantage by ensuring that the wild guess is made:
    - Before any chance to use step by step thinking.
    - Before any chance to use logic, reasoning and tree of thoughts.
    - Before any chance to access the internet or anything else.
    - Before any chance to say anything. For example it may not seem like a big deal to start by saying "That is a complex question" before the wild guess, but even that would affect the wild guess, probably by widening the range of the wild guess as uncertenty is an logical assunption when taking into account that it is a complex question.

    As long as the player starts his response starts with a wild guess, he is allowed to continue playing and move on to part 2.
    It is important that the wild guess does not affect the other parts of the game as it is simply there for fun to show how useful Chain of thoughts, Browsing tool and Python is.

**Part 2: Research, Chain of thoughts and Calculations.**
    After a wild guess is written. The players get to figure out a better guess. Use a chain of thought to show your reasoning steps. This enables large language models to decompose multi-step problems into intermediate steps, allowing them to solve complex reasoning problems that were previously unsolvable with standard prompting methods. All available tools are allowed and encoriged. Use browser tool, check multiple sources, and use code for calculations and anything else useful.
    
    **Important: Writing code without interactivly executing it in your enviorment is useless, against the rules, and will NOT give you any information. The only reason for using code is to without interactivly executing it in your enviorment. The user is unable to run code. If code can be useful then you should use code. Use code for all math. All code has to be written in python, and and be structured so it can be directly run in any standard Python environment. If certain data sizes or operations are impractical to test directly, you still have provide a guess.**
    **If a player responds with a code block without executing it, that player is immediatly disqualified!**

    When you are done, if you still have time left double check your reasoning on the internet with the browser tool to make sure to maximize confidence in your guess.

**Part 3: The guess**
    The Final guess should consist of 4 ranges of posebileties and 1 Final guess. Each guess (each line) should consist of 2 numbers.
    1. The first range should 99% chance of being correct.
    2. The second range should 90% chance of being correct.
    3. The third range should 50% chance of being correct.
    4. The first range should 10% chance of being correct.
    5. Finally, a precise guess.

Example response:
0. **Part 3: The guess**
1. There is a 99% Probability that that the correct answer is between {lower_range} and {higher_range} # This means that there is a 0.5% Probabiliry that the correct answer is more then the specified guess. And 0.5% Probabiliry that the correct answer is less then the specified guess.
2. There is a 90% Probability that that the correct answer is between {lower_range} and {higher_range} # This means that there is a 5% Probabiliry that the correct answer is more then the specified guess. And 5% Probabiliry that the correct answer is less then the specified guess.
3. There is a 50% Probability that that the correct answer is between {lower_range} and {higher_range} # This means that there is a 25% Probabiliry that the correct answer is more then the specified guess. And 25% Probabiliry that the correct answer is less then the specified guess.
4. There is a 10% Probability that that the correct answer is between {lower_range} and {higher_range} # This means that there is a 45% Probabiliry that the correct answer is more then the specified guess. And 45% Probabiliry that the correct answer is less then the specified guess.
5. This is a precise guess and should be you're best try at guessing the exact, correct answer.

The objective of the game is to use logic and reasoning to estimate a better guesses that are closer to the correct anwser then the other players.
It is not allowed to see the other players guesses before everyone has written down their guesses.
If for any reason a player allready knows what the correct answer to a question is before the answer is revealed then that player has to start  He has to disclose that he allready knew the answer

We don't know either before we check the answer after everyone has made their guess. Since the game revolve around using logic and reasoning to estimate the closest guess, that is why it is crucial that we don't know the answers because knowing the correct answer would ruin the whole point of the game. it's not a game about who can remember the. it's not possible to try to beat estimate guesses. and that is. it's just for the fun of trying to beat the other players by estimationg/guessing better then them. Guessing/Estimating is the point of the game and is why almost all the questions are weird stuff that noone knows and often things that we would never do in real life but still made in a way so that the questions are always "guessable" in the sense that "How many meters can a pen draw" - It's possible to estimate an answer and most likely everybody would be very far off. 

But it's fair because when the questions are hard, it's hard for everyone and when the questions are easy, it is still equally hard for everyone to gain pionts because a player would have to guess more precise then the other players to win. So it doesen't matter how hard the question is because a player just has to be closer then the other players. 
So if the question is "How many seconds will a lighter burn before it runs out of gas", even the answer is 100 times longer then the longest guess, the player who guessed the longest will get the point.

Wrong guesses has no penalty.

It is allowed to guess a range if you are very uncertain but the larger the range is you get less points if you win the round.

A guess will be disqualefied if it unclear or ambigous. For example if the answer is a number (ammount or probability, etc...) then the guess should be a number. All guesses should be as consice, precice and be clear as possible. Any guess that is ambigous, unclear or avoids making a comcrete guess is immedietly disqualefied.

Response should look like this:
### Part 1: The Wild Guess
### Part 2: ... (and so on)

---

The question is:

