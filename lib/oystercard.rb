class Oystercard

  attr_reader :balance
  CARD_LIMIT = 90

  def initialize
    @balance = 0
  end


  def top_up(n)
    fail "Top up excceds card limit of #{CARD_LIMIT}" if n + balance > CARD_LIMIT
    @balance += n
  end

end
