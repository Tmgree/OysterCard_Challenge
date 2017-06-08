class Oystercard

  attr_reader :balance
  attr_reader :traveling
  CARD_LIMIT = 90

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
    @traveling=true
  end

  def touch_out
    @traveling=false
  end

end
