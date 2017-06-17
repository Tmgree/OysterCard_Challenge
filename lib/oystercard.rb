require_relative 'station'

class Oystercard

  attr_reader :balance, :current_journey, :journeys, :traveling
  CARD_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @current_journey = []
    @journeys = {}
    @traveling = false
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
    push_hash(@current_journey)
    @traveling=false
  end

  def balance_too_low?
    @balance < MIN_FARE
  end

  def deduct_fare
    @balance -= MIN_FARE
  end

  def entry_station
    @current_journey[0]
  end

  def exit_station
    @current_journey[1]
  end

  private

  def push_station(station)
    @current_journey.push(station)
  end

  def push_hash(current_journey)
    @journeys["journey #{journeys.size + 1}"] = current_journey
  end

end
