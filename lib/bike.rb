require_relative 'docking_station'

class Bike

	def initialize
		@working = true
	end

	def docked?
		true
	end

	def working?
		@working
	end

	def report
		@working = false
	end
end