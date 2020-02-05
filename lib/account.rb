class Account
    STANDARD_VALIDITY_YRS = 5
end

    random_pincode = rand(1000..9999)

    def set_expire_date
        Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%Y')
    end

    

    def withdraw(amount, pin code, account)
        case 
        when
        when
        else
        end
    end

    private

    

