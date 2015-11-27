require 'van'

describe Van do

	it 'Should respond to arrive method' do 
  		expect(subject).to respond_to :arrive
  	end

  	it 'should collect broken bikes from docking station and hold in array' do 
  		expect(subject.arrive).to eq subject.broken_bikes
  	end

  	it 'should return an array of broken bikes' do
  		bike = Bike.new
  		bike.report
  		station = DockingStation.new
  		station.dock_bike(bike)
  		expect(subject.arrive(station)).to eq [bike]
  	end


end
