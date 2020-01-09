class Item

    attr_reader :title, :deadline, :description

    def self.valid_date?(date_string)
        date_array = date_string.split("-")
        raise 'sorry, that date was invalid :(' if !(1..12).include?(date_array[1].to_i) || !(1..31).include?(date_array[2].to_i)
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        Item.valid_date?(deadline) 
    end 

    def title=(new_title)
        @title = new_title
    end

    def deadline=(new_deadline)
        Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end

    def description=(new_description)
        @description = new_description
    end


end
