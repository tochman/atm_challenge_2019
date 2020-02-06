class Person
    attr_accessor :name, :cash, :account


    def initialize(attrs = {})
        @name = name()
        @cash = deposit_cash()
        @account = create_account_holder()
        
        #@balance = 1000
        #@account_status = :active
        #@owner = set_owner(attrs[:owner])
        #@pin_code = set_pin_code()
        #@exp_date = set_expire_date()
    end


    def create_account_holder(obj)
        obj == nil ? 
    end

private 

    def deposit_cash(amount, account)
        @funds += amount
        account.balance = account.balance + amount
    end

    def withdraw(name, cash, account)
        @funds -= amount
        account.balance = account.balance - amount
    end
end
