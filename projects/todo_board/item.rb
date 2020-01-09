class Item

    attr_reader :deadline, :done
    attr_accessor :title, :description

    def self.valid_date?(date_string)
        date_array = date_string.split('-').map(&:to_i)
        year, month, day = date_array
        return false if date_array.length != 3
        return false if !(0..12).include?(month)
        return false if !(0..31).include?(day)
        true
    end

    def initialize(title, deadline, description)
        raise "data is not valid" if !Item.valid_date?(deadline) 
        @title = title
        @deadline = deadline
        @description = description
        @done = false
    end 

    def title=(new_title)
        @title = new_title
    end

    def deadline=(new_deadline)
        raise "data is not valid" if !Item.valid_date?(deadline)
        @deadline = new_deadline
    end

    def description=(new_description)
        @description = new_description
    end

    def toggle
        @done = !@done
    end


end
