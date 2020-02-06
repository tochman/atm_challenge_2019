require 'pry'
require './lib/account'

class Person
    attr_accessor :name, :cash, :account


    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @cash = 0
        @account = nil
        
        #@balance = 1000
        #@account_status = :active
        #@owner = set_owner(attrs[:owner])
        #@pin_code = set_pin_code()
        #@exp_date = set_expire_date()
    end

    def create_account
        self.account = Account.new(owner: self)
    end

    def set_owner_of_account(name)
        name
    end

    def deposit(amount)
        if self.account != nil 
        account.balance += amount 
        @cash -= amount 
        else raise "No account present"
        end
    end  

    private 

    def set_name(name)
        name == nil ? missing_name : name
    end

    def missing_name
        raise "A name is required"
    end

    #def withdraw(name, cash, account)
       # @funds -= amount
       # account.balance = account.balance - amount
    #end
end
