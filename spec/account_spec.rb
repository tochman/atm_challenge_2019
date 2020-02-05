require './lib/account.rb'
    describe Account do
        let(:account_owner) { instance_double('Account', pin_code: '1234', account_status: :active)}
        before do 
            allow(account).to receive(:balance).and_return(1000)
            allow(account).to receive(:balance=)
        end

        it 'has 1000$ on initialize' do
            expect(subject.funds).to eq 1000
        end


        it 'check the length of a number' do 
        number = 1234
        number_length = Math.log10(number).to_i + 1
        expect(number_length).to eq 4
        end

    
    end


