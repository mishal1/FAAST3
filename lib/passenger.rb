class Passenger

	def initialize
		@tapped_in = false
	end

	def tap_into_station
		@tapped_in = true
	end

	def tapped_in?
		@tapped_in
	end

	def tap_out_of_station
		@tapped_in = false
	end

end