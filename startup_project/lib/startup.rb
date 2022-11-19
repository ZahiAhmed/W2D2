require "employee"
require "byebug"
class Startup
    
    attr_reader :name, :funding, :salaries, :employees
    
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        salaries.has_key?(title)
    end
    
    def >(startup)
        self.funding > startup.funding
    end

    def hire(name, title)
        if self.valid_title?(title)
            employees << name = Employee.new(name, title)
        else 
            raise error
        end
    end

    def size
        employees.length
    end

    def pay_employee(employee)
        if @funding >= salaries[employee.title]
            employee.pay(salaries[employee.title])
            @funding -= salaries[employee.title]
        else 
            raise error
        end
    end

    def payday
        employees.each {|employee| pay_employee(employee)}
    end


    #PART 3
    def average_salary
        sum = 0
        #debugger
        #salaries.each {|title, salary| sum += salary}
        employees.each {|employee| sum += salaries[employee.title]}
        sum/employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each {|title, salary| salaries[title] = salary if !salaries.has_key?(title)}
        @employees += startup.employees
        startup.close
    end
end
