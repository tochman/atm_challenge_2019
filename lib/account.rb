class Account
    STANDARD_VALIDITY_YRS = 5
end

random_pincode = rand(1000..9999)

    def initialize(attrs = {})
        @account_status = :active
        set_owner(attrs[:owner])
    end

    def set_expire_date
        Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%Y')
    end

    def self.deactivate(account)
        account.account_status = :deactivated
    end

    private

    def set_owner(obj)
        obj == nil ? missing_owner : @owner = obj
    end

    def missing_owner
        raise "An Account owner is required"
    end
    


    #def withdraw(amount, pin code, account)
      #  case 
      #  when
      #  when
      #  else
       # end
    #end

    

