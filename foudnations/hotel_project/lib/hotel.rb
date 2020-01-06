require_relative "room"

class Hotel
  
    def initialize(name,capacity)
        @name = name
        @rooms = {}
        capacity.each do |room_name,cap|
            @rooms[room_name] = Room.new(cap)
        end
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        @rooms.has_key?(name)     
    end

    def check_in(person,room)
        if self.room_exists?(room)
            if @rooms[room].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.values.any?{|room| room.available_space > 0 }
    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts "#{room_name}: #{room.available_space}"
        end
    end

end

#["Basement", #<Room:0x00000000016d3db8 @capacity=4, @occupants=["Jesse", "Walter", "Gus", "Hank"]>]
#["Attic", #<Room:0x00000000016d3890 @capacity=2, @occupants=["Rick", "Morty"]>]
#["Under the Stairs", #<Room:0x00000000016d37c8 @capacity=1, @occupants=["Harry"]>]