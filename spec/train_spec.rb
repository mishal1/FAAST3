require 'train'

describe Train do
	
	let(:train)    {Train.new}
	let(:station)  {double :station}
	let(:carriage) {double :carriage}

	it "should not be in the station when created" do
		expect(train.inside_of_station?).to be false
	end

	it "should be able to enter a station" do
		allow(station).to receive(:dock).with(train)
		train.stop_at(station)
		expect(train.inside_of_station?).to be true
	end

	it "should be able to leave a station" do
		allow(station).to receive(:dock).with(train)
		train.stop_at(station)
		allow(station).to receive(:release).with(train)
		train.move_out_of(station)
		expect(train.inside_of_station?).to be false
	end

	it "should dock in the station" do
		expect(station).to receive(:dock).with(train)
		train.stop_at(station)
	end

	it "should be released from station" do
		expect(station).to receive(:release).with(train)
		train.move_out_of(station)
	end

	it "should contain no carriages when created" do
		expect(train.carriages).to eq([])
	end

	it "should be able to add a carriage" do
		train.attach(carriage)
		expect(train.carriages).to eq([carriage])
	end

	it "should be able to remove a train" do
		train.attach(carriage)
		train.detach(carriage)
		expect(train.carriages).to eq([])
	end

end