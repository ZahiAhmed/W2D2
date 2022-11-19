require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = Hash[rooms.map {|k, v| [k, Room.new(v)]}]
        #rooms.each {|k , v| Room.initialize(v)}
    end

    def name
        @name.split.map {|word| word.capitalize}.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        return true if @rooms.has_key?(room)
        false
    end

    def check_in(person, room)
        if self.room_exists?(room) 
            @rooms[room].add_occupant(person)
        end
        puts "sorry, room does not exist"  
    end

    def has_vacancy?
        @rooms.any?{|k, v| !v.full?}
    end

    def list_rooms
        @rooms.each{|name, cap| puts name + cap.available_space.to_s}
    end
end
