require "employee"

class Startup

    #getter
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries_hasz)
        @name = name
        @funding = funding
        @salaries = salaries_hasz
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(another_startup)
        @funding > another_startup.funding
    end

    def hire(employee_name, title)
        if !self.valid_title?(title)
            raise_exception 
        else
            @employees << Employee.new(employee_name, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        title = employee.title
        salary = @salaries[title]
        if @funding > @salaries[title]
            employee.pay(salary)
            @funding -= salary
        else
            raise_exception
        end
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end

    def average_salary
        count = 0
        @employees.each do |person| 
            count += @salaries[person.title]
        end
        count / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        @salaries = @salaries.merge(another_startup.salaries) {|key,old,new| old}
        
        another_startup.employees.each do |person|
            @employees << person
        end


        another_startup.close
    end
end
