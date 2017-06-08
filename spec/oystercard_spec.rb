require 'oystercard'

describe Oystercard do

  describe '#balance' do

    it 'must initialize with a balnce of 0' do
      expect(subject.balance).to eq 0
    end

  end

  describe '#traveling' do

    it 'should initialize as not traveling' do
      expect( subject.traveling ).to eq false
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

  describe '#touch_in' do

    it 'should initialize a journey' do
      subject.top_up(10)
      expect{ subject.touch_in }.to change{ subject.traveling }.to true
    end

    it 'should fail if a card attempts to start a journey with low funds' do
      expect{ subject.touch_in }.to raise_error "Not enough money on card"
    end

  end

  describe '#touch_out' do

    it 'should end a journey' do
      subject.top_up(10)
      subject.touch_in
      expect{ subject.touch_out }.to change{ subject.traveling }.to false
    end

  end

  describe '#balance_too_low?' do

    it 'should return true if balance is under MIN_BALANCE' do
      expect(subject.balance_too_low?).to eq true
    end

  end

end
