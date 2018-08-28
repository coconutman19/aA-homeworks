require 'byebug'

class Board
  attr_accessor :cups, :current_player_name

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
        @cups[6] << num_of_stones.shift if current_player_name == @player1
      elsif starting_idx == 13
        @cups[13] << num_of_stones.shift if current_player_name == @player2
      else
        @cups[starting_idx] << num_of_stones.shift
      end

    end
    render
    next_turn(starting_idx)
    # if next_turn(starting_idx) != 1
    #   make_move(starting_idx, current_player_name)
    # end
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
      true
    else
      false
    end
  end

  def winner
    if @cups[6].count == @cups[13].count
      :draw
    elsif @cups[6].count > @cups[13].count
      @player1
    else
      @player2
    end
  end
end
