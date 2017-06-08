class Oystercard

  attr_reader :balance
  attr_reader :traveling
  CARD_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @traveling = false
  end

  def top_up(n)
    fail "Top up excceds card limit of #{CARD_LIMIT}" if n + balance > CARD_LIMIT
    @balance += n
  end

  def deduct(n)
    @balance -= n
  end

  def touch_in
    fail "Not enough money on card" if balance_too_low?
    @traveling=true
  end

  def touch_out
    deduct_fare
    @traveling=false
  end

  def balance_too_low?
    @balance < MIN_FARE
  end

  def deduct_fare
    @balance -= MIN_FARE
  end

end
