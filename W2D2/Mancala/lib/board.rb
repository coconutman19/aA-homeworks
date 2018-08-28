require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = place_stones
  end

  def place_stones
    result = []
    14.times do |i|
      if i == 6 || i == 13
        result << []
      else
        result << [:stone, :stone, :stone, :stone]
      end
    end

    result
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 14
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    # debugger
    num_of_stones = @cups[start_pos].dup
    starting_idx = start_pos
    @cups[start_pos] = []

    until num_of_stones.empty?

      starting_idx += 1
      starting_idx = starting_idx % 14
      if starting_idx == 6
        @cups[6] << num_of_stones.shift if current_player_name == @name1
      elsif starting_idx == 13
        @cups[13] << num_of_stones.shift if current_player_name == @name2
      else
        @cups[starting_idx] << num_of_stones.shift
      end

    end

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
