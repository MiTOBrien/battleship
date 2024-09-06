class Ship
    attr_reader :name,
                :length

    attr_accessor :health,
                  :hit,
                  :sunk
                  
                  

    def initialize(name, length,)
        @name = name
        @length = length
        @health = length
        @sunk = false
    end

   

    def hit
        @health -= 1
    end

    def sunk?
        @health == 0
    end
end