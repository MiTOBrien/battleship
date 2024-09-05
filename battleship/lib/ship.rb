class Ship
    attr_reader :name,
                :length

    attr_accessor :health,
                  :hit

    def initialize(name, length)
        @name = name
        @length = length

    end
end