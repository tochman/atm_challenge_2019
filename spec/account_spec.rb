require './lib/account.rb'
    describe Account do
        
        # before do 
         #   allow(account_owner).to receive(:balance).and_return(1000)
         #   allow(account_owner).to receive(:balance=)
        #end

        it 'has 1000$ on initialize' do
            expect(subject.funds).to eq 1000
        end


        it 'check the length of a number' do 
        number = 1234
        number_length = Math.log10(number).to_i + 1
        expect(number_length).to eq 4
        end



        it 'is expected to have an expiry date on initialize' do
            expected_date = Date.today.next_year(5).strftime("%m/%y")
            expect(subject.exp_date).to eq expected_date
        end
        

    
    end


