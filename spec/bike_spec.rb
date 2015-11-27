require 'bike'

describe Bike do
	it "should respond to method working?" do
		expect(subject).to respond_to :working?
	end
	
	it 'Bike responds to report method' do
  		expect(Bike.new).to respond_to :report
  	end

  	it 'Bike not working when reported' do
  		bike = Bike.new
  		bike.report
  		expect(bike.working?).to eq false
  	end

	
end