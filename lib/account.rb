class Account
    attr_accessor :pin_code, :exp_date, :account_status, :balance, :owner

    STANDARD_VALIDITY_YRS = 5

    def initialize(attrs = {})
        @balance = 1000
        @account_status = :active
        @owner = set_owner(attrs[:owner])
        @pin_code = set_pin_code()
        @exp_date = set_expire_date()
    end

    def deactivate
        @account_status = :deactivated
    end

    private

    def set_expire_date
        Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

    def set_pin_code
        rand(1000..9999)
    end

    def set_owner(obj)
        obj == nil ? missing_owner : @owner = obj
    end

    def missing_owner
        raise "An Account owner is required"
    end
end

    

