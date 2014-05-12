class RockPaperScissors
  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  # Create a class method winner that takes two 2-element arrays like those above,
  # and returns the one representing the winner:

  # RockPaperScissors.winner(['Armando','P'], ['Dave','S']) # => ['Dave','S']

  # If either player's strategy is something other than "R", "P" or "S"
  # (case-SENSITIVE), the method should raise a RockPaperScissors::NoSuchStrategyError
  # exception and provide the message: "Strategy must be one of R,P,S".

  # If both players use the same strategy, the first player is the winner.

  MOVES = { 'R' => 'S', 'S' => 'P', 'P' => 'R' }

  def self.winner(player1, player2)
    _, strategy1 = player1
    _, strategy2 = player2

    unless Set[strategy1, strategy2].subset?(Set['R', 'P', 'S'])
      raise NoSuchStrategyError.new 'Strategy must be one of R,P,S'
    end

    if MOVES.any? { |winner, loser| strategy1 == winner && strategy2 == loser } || strategy1 == strategy2
      player1
    else
      player2
    end
  end

  # A rock-paper-scissors tournament is encoded as an array of games - that is, 
  # each element can be considered its own tournament.

  # Write a method `RockPaperScissors.tournament_winner' that takes a tournament
  # encoded as an array and returns the winner. You can assume that the array is
  # well formed (that is, there are 2^n players, and each one participates in
  # exactly one match per round).

  # HINT: Formulate the problem as a recursive one whose base case you solved
  # in part 1.
  def self.tournament_winner(tournament)
    if tournament[0][0].is_a?(Array)
      winner tournament_winner(tournament[0]), tournament_winner(tournament[1])
    else
      winner tournament[0], tournament[1]
    end
  end
end
