class Atm
    attr_accessor :funds
    require 'date' 
    
    def initialize
        @funds = 1000
    end

    def withdraw(amount, pin_code, account)
        case
        when insufficient_funds_in_account?(amount, account)
            { status: false, message: 'insufficient funds', date: Date.today }
        when insufficient_funds_in_atm?(amount)
            { status: false, message: 'insufficient funds in ATM', date: Date.today }
        when incorrect_pin?(pin_code, account.pin_code)
            { status: false, message: 'wrong pin', date: Date.today }
        when card_expired?(account.exp_date)
            { status: false, message: 'card expired', date: Date.today }
        when account_disabled?(account.account_status)
            { status: false, message: 'account disabled', date: Date.today }
        else
            perform_transaction(amount, account)
        end
    end

    private

    def incorrect_pin?(pin_code, actual_pin)
        pin_code != actual_pin
    end

    def insufficient_funds_in_account?(amount, account)
        amount > account.balance 
    end

    def insufficient_funds_in_atm?(amount)
        @funds < amount
    end

    def perform_transaction(amount, account)
        @funds -= amount
        account.balance = account.balance - amount
        { status: true, message: 'success', date: Date.today, amount: amount, bills: add_bills(amount) }
    end

    def card_expired?(exp_date)
        Date.strptime(exp_date, '%m/%y') < Date.today
    end
    
    def account_disabled?(account_status)
        account_status != :active
    end

    def add_bills(amount)
        denominations = [20, 10, 5]
        bills = []
        denominations.each do |bill|
            while amount - bill >= 0
                amount -= bill
                bills << bill
            end
        end    
        bills
    end    
end