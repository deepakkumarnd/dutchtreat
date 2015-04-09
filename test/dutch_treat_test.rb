require 'test_helper'

module DutchTreat

  describe DutchTreat do

    before do
      @participants = []
      @transactions = []

      @participants << Participant.new(name: 'Nithin')
      @participants << Participant.new(name: 'Deepak')
      @participants << Participant.new(name: 'Alfred')
      @participants << Participant.new(name: 'Irfan')
      @participants << Participant.new(name: 'Mukesh')
    end

    it 'creates five participants' do
      @participants.size.must_equal 5
    end

    it 'cab payment: paid by one person(eg: nithin), divide equally' do
      @participants[0].amount_paid = 530
      @transactions << Transaction.new(@participants)
      @transactions.last.settle

      # transaction is even by default
      @transactions.last.even?.must_equal true

      p "Balance after settle balance"
      p @participants.map(&:balance)
      @participants[0].borrowings
      @participants[0].lendings
      @participants.each { |p| p.clear?.must_equal true }
    end
  end
end
