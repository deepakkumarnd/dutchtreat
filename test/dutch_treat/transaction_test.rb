require 'test_helper'

module DutchTreat

  describe Transaction do

    before do
      @nithin = Participant.new('Nithin')
      @deepak = Participant.new('Deepak')
      @alfred = Participant.new('Alfred')
      @irfan  = Participant.new('Irfan')
      @mukesh = Participant.new('Mukesh')

      @participants = [@nithin, @deepak, @alfred, @irfan, @mukesh]
    end

    describe 'Cab rent 530, to be shared by all, but paid by one person (nithin)' do

      it 'requires the amount_paid field of paying participants to be set' do
        @nithin.amount_paid = 530

        t = Transaction.new(@participants)
        t.settle!

        @nithin.total_lendings.must_equal 424
        @nithin.total_borrowings.must_equal 0

        @deepak.total_lendings.must_equal 0
        @deepak.total_borrowings.must_equal 106

        @nithin.print_settlement_details
        @deepak.print_settlement_details
      end
    end
  end
end
