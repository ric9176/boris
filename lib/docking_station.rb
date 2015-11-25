require_relative 'bike'

class DockingStation
	attr_reader :bikes
	
	def initialize
		@bikes = []
	end

	def release_bike
		raise 'no bikes' if empty?
		@bikes.pop
	end

	def dock_bike(bike)
		raise 'station full' if full?
		@bikes << bike
	end

private	

	def full?
		@bikes.size >= 20 ? true : false
	end

	def empty?
		@bikes.empty? ? true : false
	end
	

end
