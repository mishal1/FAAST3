class Passenger

	def initialize
		@tapped_in = false
	end

	def tap_into(station)
		@tapped_in = true
		station.hold(self)
	end

	def tapped_in?
		@tapped_in
	end

	def tap_out_of(station)
		@tapped_in = false
		station.release(self)
	end

end