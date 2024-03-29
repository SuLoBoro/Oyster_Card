class OysterCard
  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1

  attr_reader :balance, :in_journey, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station
    @exit_station
    @journeys = {}
  end

  def top_up(amount)
    fail "Maximum balance exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient balance to touch in" if balance < MINIMUM_CHARGE
    @journeys.clear
    @in_journey = true
    @journeys.merge!(entry_station: station)
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @in_journey = false
    @entry_station = nil
    @journeys.merge!(exit_station: station)
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
