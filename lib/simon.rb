class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @seq = []
    @game_over = false
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    system("clear")
    show_sequence
    require_sequence
    round_success_message unless game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    print "> "
    input_sequence = gets.chomp
    @game_over = true unless @seq == input_sequence.split
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Nice moves dingus"
    sleep(1)
  end

  def game_over_message
    puts "GOTCHA BITCH"
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

if $PROGRAM_NAME == __FILE__
  a = Simon.new
  a.play
end
