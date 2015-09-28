# TTT2
Ruby tictactoe game built using TDD

# 9/24 - Figuring out Requirements

I spent an hour and a half trying to familairze myself a bit more with TDD and where to begin. I found after not much searching that this uncertainty around how and where to begin was pretty commonplace for developers getting acquainted with TDD. After reading a lot about common mistakes and varying perspectives and opinions on how to tackle the seemingly daunting task of doing TDD well, I came to the conclusion that it was important to figure out my requirements since ultimately that was what I was going to test. Furthermore, I wanted to try and boil those requirements down to the simplest langauge and logic I could think of. Essentially, I wanted to come up with a list of rules to the game of tic tac toe that I could explain to a toddler. The caveat being that they understood what a UI was already. Without further ado, here are the requirements I will base my tests off of.

**Requirements**
1. We need 2 *players*
2. Each player should have the option to be *computer* or *human* controlled
3. The players need to play a *game*
4. The game is played on a *board* (usually 3x3)
5. Each player has a token they play the game with
6. The players can choose the token they play with
7. The players can choose the order they play in
8. The game is played by the players taking turns placing tokens into empty spaces on the board
9. The game ends if all the spaces on the board are occupied by a token
10. A winner is declared if 3 of the same tokens occupy the same row, column or diagonal
11. If the board is full and no winner is declared, the game is a tie
12. A computer controlled player will always win or tie
13. We need an *interface* so that the players can interact with the board and game.

# 9/25 - Figuring out Architechture

Now that I have a solid list of requirements for my TTT game. It's time to actually start thinking about
the architecture of the site. I've italicized what I think make sense as good Ruby classes for this
program. I wonder if I would have came to the same structure had I not built a version of the program
before... Anyway, I've decided to that first a foremost we need a player class because without players
you can't really have a game. So I created a lib folder in the TTT2 directory and made a player.rb file.
Furthermore, I know that I want to a player to be either computer or human controlled. so I made a
computer.rb and human.rb for the human and computer classes, which right now I think will inherit from
the player class since a human is a type of player as is a computer.

Now that we have the players, the next thing we need is a game for them to play. So I created a game.rb
file in the lib folder that will house the game class. I also know that the game is played on a board so
I created a board class and put it in the board.rb file. Finally, I know I'll want an interface so that
the player cane see what's going on the board and in the game. the ui class in ui.rb takes care of that.

# 9/25 - Beginning Testing

I now have a really basic architecture laid out. Based on my really basic understanding of TDD, I believe
the next step is to start testing the framework by writing unit tests for the behaviors I have outlined
in my requirements. However, I don't really know which requirement to test first. So I think it's
probably best to just get started and test the first one: **We need 2 *players***.

How do I even go about testing this? Well I probably need a somewhere to write my tests so let me create
a player_spec.rb file in my spec folder. I'll need this file to use rspec, which I've already installed,
so I'll write `require "rspec"` up at the top. I'll also need this file to have access to my player class
since I imagine that is what it will be testing. So I'll also require my player.rb file with `require "player"`. Before I go any further a thought occurs to me, "*What* exactly needs 2 players?" Does it
actually make sense for me to test this first requirement using my player class? It might be more
accurate to say that, "In order to play a *game* of TTT, I need two instances of my player class". Maybe
in fact. I don't even need a player maybe I just need access to the computer and human classes so that I
can have instances of those. At this point, I only vaguely know what I'm talking about, and have little
to no clue of how I would go about testing this first requirement, So I decide it's probably not the best
requirement to test first.

I'm also lost on requirement #2 and #3 seems so basic that I don't think it makes sense to test it. It's only until I get to requirement #4 that I think, "Hey, this might be something that I can test". requirement #4 says that, "The game is played on a *board* (usually 3x3)". This tells me a couple of things:

  1. I need to test for the existence of a board.
  2. I need to test the dimensions of the board.
  3. I need to test that the game is being played on the board.

Awesome! so first let me create a board_spec.rb file... Ahhhh wait a sec. unit tests are supposed to test behavior this stuff is more a priori or comes about as a result of testing the behavior. So let's try again and look at the requirements that are actually testing a behavior and start from there. #6 seems to be the first requirement that looks at an actual behavior - choosing a token. In my mind, a player chooses a token, so let's go back to the player-spec.rb file I created earlier and write a test for this behavior. This is what I wrote:

```ruby
describe "Player" do

  describe "choose_token" do
    it "selects a token for the player" do
    @player = Player.new

      expect(@player.choose_token).to eq("X"||"O")
    end
  end
end
```
So first, I described the Player object and created and instance variable: @player that I can use in my
tests so I have access to the methods within the player class. I want the return value of the
choose_token method, which I have yet to create to be either "X" or "O" which I've designated as the
availabe tokens. Right off the bat, something seems off to me about this test, but I can't quite put my finger on it so I'll run it and see what happens. I go to the command line cd to my directory TTT2 and type in rspec. As expected it fails because I haven't written any code yet, so it's trying to find the choose_token method which doesn't exist. Here's my `choose_token` method:

```ruby
def choose_token(token)
  if token == "X"
    return "X"
  elsif token == "O"
    return "O"
  end
end
```
I added the token argument because I'd imagine that this would get passed in from a user's interaction with the UI e.g. "please select your token. type x for "X" and o for "O"". I rewokred my test to accomodate this argument and, voila! it passed. It's ugly, the test has hard-coded values, which I think might make it fragile and my `choose_token` method is not particularly DRY. but the test passes so perhaps the next thing to do is to refactor the current method and test? Here's my new method and it still passes.

```ruby
def choose_token(token)
    return token
  end
end
```

The next thing to test for is requirement #7 aka choosing the order of play. Again, I reason that the player is going to choose the order they want to play in. so I write a test. As I'm writing a test, it becomes clear to me that in order to select an order I'll also have to create a method that allows me to choose the type of player. so I imagine a UI where:

  1. Would you like to play a game of TTT y/n
  2. Who's playing first (comp/human)
  3. If human -- first play name
  4. Which token will "player 1 be using?" x/o
  5. Is player 2 a human or comp
  6. Assign remaining token to player 2.


Now I'm thinking that choosing an order is more a function of the game class because it's an aspect of the game and not neccessarily of the player. In other words, a game *has* an order, a players are *in* an order. I create the game_spec.rb file in my spec folder and give it access to rspec and the game class via require.

Here's how I thought about my test: I wanted to work backwards from the expected outcome. In this case I thought it would make sense if my `choose_player_order` method returned an array of of instances of the human and computer classes in whatever order was decided e.g. human goes first computer goes second `[@human,@computer]` so wokring backward from there I tried to figure out how I would go about getting that output. More than likely I'll be using some string input taken from some method in my ui class in my argument for the `choose_player_order` method. I thought I could just do some simple conditionals to take care of that, but the fact that we also need to decide what kind of player the second player is, made me think that it'd be better if that argument was an array of string inputs corresponding to what type of player the user wanted the first and second players to be. So from there I was able to craft my test:


```ruby
describe "choose_player_order" do
  it "decides the order of play" do
    computer = Computer.new
    human = Human.new
    @game = Game.new(computer,human)

    expect(@game.choose_player_order(['c','h'])).to eq([computer,human])
  end
end
```

Initially I had `eq([@computer,@human])` but for a reason I haven't figure out yet, it equated those to nil. So in order to make the test work I changed them into local variables and that did the trick.

The next thing to test is:
*8. The game is played by the players taking turns placing tokens into empty spaces on the board*
There's a whole lot wrapped up in here, so let me see if I can break it down a bit. We'll call placing a token making a move. the board needs to keep track of those moves and also the # of empty spaces left. So I think it makes sense to test whether the board can keep track of the moves on the board as a next step.

How do we do this. well we want to be able to see a change on the board. Whatever the board is. In my
last version I made the board an array of numbers 1..9. However, this doesn't allow me to change the
board dimensions, which I might want to do. So maybe the first step is creating a board that...
-------

#9/25 - TDD Explained

At the end of the day I was getting to know some of the other apprentices. Noah is a design apprentice and Brian a resident sofware apprentice straight out of college. Brian is very new to 8th Light as well and was dealing with some of my current struggles very recently. He was nice enough to pair with me at the end of the day and explain some of what he learned while doing the exact same exercise a couple weeks earlier. I explained my current thought process as I have laid about above and as I was beginning to expect I was making things too complicated for myself. Brian said he'd made the same mistakes, making too many assumptions and thinking too far ahead. He suggested thinking about things in a very sequential and rudimentary manner and made me aware of some basic tenants for doing TDD:

  1. You are not allowed to write any production code unless it is to make a failing unit test pass.
  2. You are not allowed to write any more of a unit test than is sufficient to fail; and compilation   failures are failures.
  3. You are not allowed to write any more production code than is sufficient to pass the one failing unit test.

We wrote some basic unit tests together so I could see what we were discussing in action. It was extremely helpful and I feel like something definitely clicked for me after that conversation. As Brian said, "TDD is easy, but you ahve to get yourself into the right mindset"

I'll be deleting all the code and tests that I've written up till now and try TDD once again with a blank slate save the code Brian and I wrote together.

#9/28 - Restarting

I tried for a bit to start from where Brian and I had left off. However, after some tepid attempts it was pretty clear that I was still mentally stuck. Something about TDD was just not clicking. I had all this previous knowledge of how I laid out the domain model in the previous iteration of the game and I was having a very difficult time, letting that go and starting fresh. I had spent so much time thinking about how to lay out my classes and make things as expressive and elegant as possible that it was really difficult to dislodge those designs from my brain and start with a beginner's mind.

The conversation with Chris last night helped a bit. He reminded me of the introduction to Chris Pine's book, wherein the author explains all the detailed steps/instructions we would have to give a computer in order to have it make us a sandwich. I think I had forgotten just how granular and rudimentary those instructions must be. Writing tests is almost like writing those instructions at least explaining to the computer what the expectations are for a given class or method. With the instructions in hand we can write the actual functional code to make the computer obey the instructions.


















