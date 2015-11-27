require_relative 'docking_station'

class Van

	attr_reader :broken_bikes

	def initialize 
		@broken_bikes = []
	end
	

	def arrive(station)

	 broken_bikes << station.delete_if{|bike| bike.working? == false}
	end
end