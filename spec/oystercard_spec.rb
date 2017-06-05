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

  end

end
