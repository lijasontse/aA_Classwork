
class Employee

    attr_accessor :boss
    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @bonus = @salary * multiplier
    end


end


class Manager < Employee


    def initialize(name, title, salary, boss)
        super
        @employees = []
        boss.add_employee(self) unless boss.nil?
    end

    def add_employee(employee)
        @employees << employee
    end

    def bonus(multiplier)
        @bonus = @employees.map(&:salary).sum * multiplier
    end

end
