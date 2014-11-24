require './lib/passenger_holder'

shared_examples "PassengerHolder" do

	let(:holder)    {described_class.new}
	let(:passenger) {double :passenger, :tapped_in? => true}

	it "should have no passengers when created" do
		expect(holder.people).to eq([])
	end

	it "should hold passengers" do
		holder.hold(passenger)
		expect(holder.people).to eq([passenger])
	end

	it "should allow passengers to leave the train" do
		holder.alight(passenger)
		expect(holder.people).to eq([])
	end
	
end

#should hold people
#should release people
#should know when it is full
#should know when it is empty

#it behaves like passenger_holder