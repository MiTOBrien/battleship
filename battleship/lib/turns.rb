class Turns

    def initialize
        @computer_board = Board.new
        @player_board = Board.new
        @computer_cruiser = Ship.new("Cruiser", 3)
        @computer_submarine = Ship.new("Submarine", 2)
        @computer_cruiser_coord = ""
        @computer_submarine_coord = ""
        @computer_cruiser_arr = []
        @computer_submarine_arr = []
    end

    def computer_place_ships(@computer_cruiser, @computer_submarine)
        # Randomly generate coords for cruiser
        # Place cruiser
        # Randomly generate coords for submarine
        # Place submarine
        # Start computer turn 
    end

    def computer_turn
        # Randomly take shot
        # Puts "My shot on #{computer_shot} was a hit (or miss)"
        # Display computer board
        # Display player board
        # Check if game is over (Both ships are sunk)
        # Go to game_over methor or start player_turn method
    end

    def player_turn
        # Puts "Enter the coordinate for your shot"
        # Validate coordinate
        # Puts "Your shot on #{player_shot} was a hit (or miss)"
        # Display computer board
        # Display plaer board
        # Check if games is over (Both ships are sunk)
        # Go to game_over method or start computer_turn method
    end

    def game_over
        # Display if computer won or user won
        # Prompt to start a new game or exit
    end
end