require 'oystercard'

describe Oystercard do

  describe '#balance' do

    it 'must initialize with a balnce of 0' do
      expect(subject.balance).to eq 0
    end

  end

  describe '#top_up' do

    it 'must top up the cards balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'should throw an error if top up exceeds card limit' do
      max_balance = Oystercard::CARD_LIMIT
      expect{ subject.top_up(max_balance+1) }.to raise_error "Top up excceds card limit of #{max_balance}"
    end

  end

  describe '#deduct' do

    it 'must deduct money from the cards balance'do
      subject.top_up(1)
      expect{ subject.deduct 1 }.to change{ subject.balance }.by -1
    end

  end

end
