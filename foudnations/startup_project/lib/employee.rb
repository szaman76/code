class Employee

    #getter
    attr_reader :name, :title
    #setter
    attr_writer :earnings
    #both
    attr_accessor


    def initialize(name,title)
        @name = name
        @title = title
        @earnings = 0
    end

    def pay(amount)
        @earnings += amount
    end

end 
