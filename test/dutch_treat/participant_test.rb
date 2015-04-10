require 'test_helper'

module DutchTreat

  describe Participant do

    describe '#clear?' do

      let(:p) { Participant.new('Deepak') }

      it 'is clear by default' do
        p.clear?.must_equal true
      end

      it 'is not clear if he has to settle balance amount' do
        p.balance = 100
        p.clear?.must_equal false
      end
    end

    describe '#total_borrowings' do

      let(:p) { Participant.new('Deepak') }

      it 'has 0 borrowings at the beginning' do
        p.total_borrowings.must_equal 0
      end

      it 'has 0 lendings at the beginning' do
        p.total_lendings.must_equal 0
      end
    end
  end
end
