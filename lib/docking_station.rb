require_relative 'bike'
require_relative 'van'

class DockingStation
	attr_reader :capacity, :broken_bikes
	
	DEFAULT_CAPACITY = 20

	def initialize(capacity=DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end

	def release_bike
		raise 'no bikes' if empty?
		raise 'Bike is broken, cannot release bike.' if all_broken
		release
	end

	def dock_bike(bike)
		raise 'station full' if full?
		bikes << bike
	end
	
	def van_arrival
		@broken_bikes = bikes.map{|bike| bike.working? == false}
		@broken_bikes
	end

private

	attr_reader :bikes

	def full?
		bikes.size >= capacity ? true : false
	end

	def empty?
		bikes.empty? ? true : false
	end
	
	def all_broken
		bikes.all?{|bike| bike.working? == false}
	end

	def release
		bikes.delete(bikes.find{|bike| bike.working?})
	end


end
