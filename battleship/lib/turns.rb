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
        cords = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4']

        computer_shot = cords.sample 
        @computer_board.cells[computer_shot].fire upon
        
        puts "My shot on #{computer_shot} was a #{@computer_board.cells[computer_shot].render}"
        # Display computer board
        puts "==========COMPUTER BOARD=========="
        @computer_board.render
        # Display player board
        puts "==========PLAYER BOARD=========="
        @player_board.render
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
        @computer_board.render
        # Display plaer board
        puts "==========PLAYER BOARD=========="
        @player_board.render
        # Check if games is over (Both ships are sunk)
        # Go to game_over method or start computer_turn method
    end

    def game_over?
        # Display if computer won or user won
        # Prompt to start a new game or exit
    end
end