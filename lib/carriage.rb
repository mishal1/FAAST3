class Carriage

	attr_accessor :people

	def initialize
		@people = []
	end

	def count
		@people.count
	end

	def hold(passenger)
		raise "The train is full" if count == 40
		people << passenger
	end

	def alight(passenger)
		people.delete(passenger)
	end

end