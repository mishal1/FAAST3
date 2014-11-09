class Passenger

	attr_reader :oyster_amount

	def initialize
		@tapped_in = false
		@oyster_amount = 0
	end

	def tap_into(station)
		return raise "You need to top up your oyster" if @oyster_amount<2
		@tapped_in = true
		@oyster_amount -=2
		station.hold(self)
	end

	def tapped_in?
		@tapped_in
	end

	def tap_out_of(station)
		@tapped_in = false
		station.alight(self)
	end

	def top_up(amount)
		@oyster_amount += amount
	end

end