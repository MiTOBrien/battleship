class Turns
    attr_reader :computer_cruiser,
                 :computer_submarine,
                 :computer_cruiser_arr,
                 :computer_submarine_arr,
                  :computer_board


    attr_writer :computer_cruiser,
                :computer_submarine,
                :computer_cruiser_arr,
                :computer_submarine_arr,
                 :computer_board

    def initialize
        @computer_board = Board.new
        @computer_cruiser = Ship.new("Cruiser", 3)
        @computer_submarine = Ship.new("Submarine", 2)
        @computer_cruiser_coord = ""
        @computer_submarine_coord = ""
        @computer_cruiser_arr = []
        @computer_submarine_arr = []

        @player_board = Board.new
        @p_cruiser_coord = ""
        @p_submarine_coord = ""
        @p_cruiser_arr = []
        @p_submarine_arr = []
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)
    end

    def computer_place_ships
        # Randomly generate coords for cruiser
        correct_array_cruiser = [['A1', 'A2', 'A3'],
        ['A2', 'A3', 'A4'],
        ['B1', 'B2', 'B3'],
        ['B2', 'B3', 'B4'],
        ['C1', 'C2', 'C3'],
        ['C2', 'C3', 'C4'],
        ['D1', 'D2', 'D3'],
        ['D2', 'D3', 'D4'],
        ['A1', 'B1', 'C1'],
        ['B1', 'C1', 'D1'],
        ['A2', 'B2', 'C2'],
        ['B2', 'C2', 'D2'],
        ['A3', 'B3', 'C3'],
        ['B3', 'C3', 'D3'],
        ['A4', 'B4', 'C4'],
        ['B4', 'C4', 'D4']]
         correct_array_sub = [['A1', 'A2'], ['A2', 'A3'], ['A3', 'A4'], ['B1', 'B2'], ['B2', 'B3'], ['B3', 'B4'], ['C1', 'C2'], ['C2', 'C3'], ['C3', 'C4'], ['D1', 'D2'], ['D2', 'D3'], ['D3', 'D4'], ['A1', 'B1'], ['A2', 'B2'], ['A3', 'B3'], ['A4', 'B4'], ['B1', 'C1'], ['B2', 'C2'], ['B3', 'C3'], ['B4', 'C4'], ['C1', 'D1'], ['C2', 'D2'], ['C3', 'D3'], ['C4', 'D4']]

         @computer_cruiser_arr.concat(correct_array_cruiser.sample)
         @computer_submarine_arr.concat(correct_array_sub.sample)
        
         @computer_board.place(@computer_cruiser, @computer_cruiser_arr)
         @computer_board.place(@computer_submarine, @computer_submarine_arr)
         computer_turn
    end

    def computer_turn
        # Randomly take shot and display result
       I3_board_render
        # puts "My shot on #{computer_shot} was a hit (or miss)"

        cords = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4']

        computer_shot = cords.sample 
        @computer_board.cells[computer_shot].fire upon
        
        puts "My shot on #{computer_shot} was a #{@computer_board.cells[computer_shot].render}"

        # Display computer board
        puts "==========COMPUTER BOARD=========="
        puts @computer_board.render
        # Display player board
        puts "==========PLAYER BOARD=========="
        puts @player_board.render(true)
        # Check if game is over (Both ships are sunk)
        if game_over? == true
            game_over
        else 
            player_turn        # Go to game_over methor or start player_turn method
    
        end
    end
    def player_turn
        # Prompt player to take a shot
        puts "Enter the coordinate for your shot"
        player_shot = gets.chomp
        # Validate coordinate
        @player_board.valid_coordinate[player_shot]
        @player_board.cells[player_shot].fire_upon
        # Display result
        puts "Your shot on #{player_shot} was a hit (or miss)"
        # Display computer board
        puts "==========COMPUTER BOARD=========="
        puts @computer_board.render
        # Display plaer board
        puts "==========PLAYER BOARD=========="
        puts @player_board.render(true)
        # Check if games is over (Both ships are sunk)
        # Go to game_over method or start computer_turn method
    end

   I3_board_render
    def ships_sunk?
        # check if ships are sunk to end game?
    end

    def ask_user_to_play
        puts "Welcome to Battleship!"
        puts "Enter p to play or any other key to quit:"
        play_game = gets.chomp.downcase
        case play_game
        when 'p'
            start
        else
            puts "Hope to play soon."
            exit
        end
    end

    def start
        puts "Please enter your name:"
        player_name = gets.chomp
        puts "Hello #{player_name}! You are playing with Battleship against the computer."
        puts "I have placed my 2 ships on the grid."
        puts "You need to place your two ships"
        puts @player_board.render
        puts "THe Cruiser is 3 spaces long and the Submarine is 2 long."
        puts "Ships can only be placed horizontally or vertically."
        puts "Enter the 3 squares for your Cruiser in this format A1 B1 C1."
        @p_cruiser_coord = gets.chomp
        @p_cruiser_arr = @p_cruiser_coord.split(" ")
        valid?(@player_cruiser, @p_cruiser_arr)
        @p_cruiser_arr.map!(&:upcase)
        @player_board.place(@player_cruiser, @p_cruiser_arr)
        puts @player_board.render(true)
        puts "Enter the 2 squares for your Submarine in this format D2 D3."
        @p_submarine_coord = gets.chomp
        @p_submarine_arr = @p_submarine_coord.split(" ")
        valid?(@player_submarine, @p_submarine_arr)
        @p_submarine_arr.map!(&:upcase)
        while @player_board.place(@player_submarine, @p_submarine_arr) == false
            puts "Those are invalid coordinates.  Please try again:"
            @p_submarine_coord = gets.chomp
            @p_submarine_arr = @p_submarine_coord.split(" ")
            @p_submarine_arr.map!(&:upcase)
        end
        puts @player_board.render(true)
        take_turns = Turns.new
        take_turns.computer_place_ships()
    end

    def valid?(ship, coords)
        while @player_board.valid_placement?(@player_cruiser, @p_cruiser_arr) == false
            puts "Those are invalid coordinates.  Please try again:"
            @p_cruiser_coord = gets.chomp
            @p_cruiser_arr = @p_cruiser_coord.split(" ")
        end
    end

    def game_over
        puts "Would you like to play again?  (y/n)?"
        play_again = gets.chomp.downcase
        if play_again == "y" || play_again == "Y"
            Play.new.start
        else
            puts "Great game!  Hope we can play again soon."
            exit
        end

    def game_over?
        # Display if computer won or user won
        # Prompt to start a new game or exit

    end
end