class Board
  attr_accessor :cases, :victory

  

  def initialize
      @A1 = BoardCase.new("a1", " ")
      @A2 = BoardCase.new("a2", " ")
      @A3 = BoardCase.new("a3", " ")
      @B1 = BoardCase.new("b1", " ")
      @B2 = BoardCase.new("b2", " ")
      @B3 = BoardCase.new("b3", " ")
      @C1 = BoardCase.new("c1", " ")
      @C2 = BoardCase.new("c2", " ")
      @C3 = BoardCase.new("c3", " ")
      @victory = false
      @round = 0
      @cases =[@A1,@A2,@A3,@B1,@B2,@B3,@C1,@C2,@C3]
      @positions = ["a1","a2","a3","b1","b2","b3","c1","c2","c3"]
  end


  def play_turn (player)
    puts "A toi de jouer #{player.name}. Fais un choix : "
    @symbol = player.symbol
    position = gets.chomp.to_s

    while @positions.include?(position) == false
      puts "Choisis une position valable et disponible :"
      position = gets.chomp.to_s
    end
    @positions.delete(position)
    @round += 1
    @cases.map do |i|
      if i.position == position
          i.content = @symbol
      end
    end
    show
    game_state
    if @victory == true && @round != 9
			puts "Bravo #{player.name}, tu as gagné."
		elsif @victory == true && @round == 9
      puts "Match nul !"
    end
  end

  # This function verify each possibilities of win and get the victory variable at true if find any
  def game_state

    if @A1.content == "o" && @A2.content == "o" && @A3.content == "o" || @A1.content == "x" && @A2.content == "x" && @A3.content == "x"
      @victory = true
    end

    if @B1.content == "o" && @B2.content == "o" && @B3.content == "o" || @B1.content == "x" && @B2.content == "x" && @B3.content == "x"
      @victory = true
    end

    if @C1.content == "o" && @C2.content == "o" && @C3.content == "o" || @C1.content == "x" && @C2.content == "x" && @C3.content == "x"
    @victory = true
    end

    if @A1.content == "o" && @B1.content == "o" && @C1.content == "o" || @A1.content == "x" && @B1.content == "x" && @C1.content == "x"
      @victory = true
    end

    if @A2.content == "o" && @B2.content == "o" && @C2.content == "o" || @A2.content == "x" && @B2.content == "x" && @C2.content == "x"
      @victory = true
    end

    if @A3.content == "o" && @B3.content == "o" && @C3.content == "o" || @A3.content == "x" && @B3.content == "x" && @C3.content == "x"
      @victory = true
    end

    if @A1.content == "o" && @B2.content == "o" && @C3.content == "o" || @A1.content == "x" && @B2.content == "x" && @C3.content == "x"
      @victory = true
    end

    if @A3.content == "o" && @B2.content == "o" && @C1.content == "o" || @A3.content == "x" && @B2.content == "x" && @C1.content == "x"
      @victory = true
    end

    if @round == 9
      @victory = true
    end
  end

  # Show empty board at initialization and get variable at each player turn
  def show
    puts ""
    puts "   1   2  3"
    puts " a #{@A1.content} | #{@A2.content} | #{@A3.content}"
    puts "   ---------"
    puts " b #{@B1.content} | #{@B2.content} | #{@B3.content}"
    puts "   ---------"
    puts " c #{@C1.content} | #{@C2.content} | #{@C3.content}"
    puts ""
  end
end