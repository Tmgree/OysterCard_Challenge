class Oystercard

  attr_reader :balance
  attr_reader :traveling
  attr_reader :journey
  CARD_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @traveling = false
    @journey = []
  end

  def top_up(n)
    fail "Top up excceds card limit of #{CARD_LIMIT}" if n + balance > CARD_LIMIT
    @balance += n
  end

  def deduct(n)
    @balance -= n
  end

  def touch_in(entry_station)
    fail "Not enough money on card" if balance_too_low?
    @traveling=true
    push_station(entry_station)
  end

  def touch_out(exit_station)
    deduct_fare
    push_station(exit_station)
    @traveling=false
  end

  def balance_too_low?
    @balance < MIN_FARE
  end

  def deduct_fare
    @balance -= MIN_FARE
  end

  def entry_station
    @journey[0]
  end

  def exit_station
    @journey[1]
  end

  private

  def push_station(station)
    @journey.push(station)
  end

end
