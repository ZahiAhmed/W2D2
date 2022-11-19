class Room
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        @occupants.length >= capacity
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(person)
        if self.full?
            puts "sorry, room is full"
            return false
        end
        @occupants << person
        puts "check in successful"
        true
    end


end