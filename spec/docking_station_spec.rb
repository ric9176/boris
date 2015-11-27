# spec/docking_station_spec.rb

require 'docking_station'

describe DockingStation do
	let(:bike) { double :bike }
	it "should respond to release_bike method call" do
		expect(subject).to respond_to :release_bike
	end

	it "should get a bike and expect the bike to be working" do
		allow(bike).to receive(:working?).and_return(true)
		subject.dock_bike(bike)
		subject.release_bike
		expect(bike).to be_working
	end

	it "should respond to method dock_bike" do
		expect(subject).to respond_to(:dock_bike).with(1).argument
	end

	it "should return the docked bike" do
		allow(bike).to receive(:working?).and_return(true)
		subject.dock_bike(bike)
		expect(subject.release_bike).to eq bike
	end

	it "raises an error when there are no bikes" do
		expect {subject.release_bike}.to raise_error 'no bikes'
	end

	it "has a defauly capacity" do 
		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end

	it "raises an error if docking station is full" do 
		subject.capacity.times { subject.dock_bike double(:bike) }
		expect { subject.dock_bike double(:bike) }.to raise_error "station full"
	end	

	it 'has a variable capacity' do
    docking_station = DockingStation.new(50)
    50.times { docking_station.dock_bike double(:bike) }
    expect{ docking_station.dock_bike double(:bike) }.to raise_error 'station full'
  end

  	

  	it 'Should not release broken bike and raise an error' do
  		bike = double(:bike, working?: false, report: false)
  		bike.report
  		subject.dock_bike(bike)
  		expect{subject.release_bike}.to raise_error "Bike is broken, cannot release bike."
  	end

  	it 'Should release a working bike if available' do
  		working_bike = double(:bike, working?: true, report: true)
  		broken_bike = double(:bike, working?: false, report: false)
  		broken_bike.report
  		subject.dock_bike(working_bike)
  		subject.dock_bike(broken_bike)
  		expect(subject.release_bike).to eq working_bike
  	end

	
	
  



end
