require 'interface'

describe 'interface' do
	let(:interface) { Interface.new }

	before(:each) do
		allow(interface).to receive(:puts)
	end

	it 'displays options and responds to user input' do
		expect(interface).to receive(:gets).and_return "1"
		expect(interface).to receive(:gets).and_return "20"
		expect(interface).to receive(:gets).and_return ""
		expect(interface).to receive(:puts).with "Gift aid: £5.00"
		interface.run
	end

	it 'allows the admin to change the tax rate' do
		expect(interface).to receive(:gets).and_return "2"
		expect(interface).to receive(:gets).and_return "25"
		interface.run
		expect(interface.calculator.tax_rate).to eq 25
	end

	it 'responds correctly to a running event' do
		expect(interface).to receive(:gets).and_return "1"
		expect(interface).to receive(:gets).and_return "20"
		expect(interface).to receive(:gets).and_return "Running"
		expect(interface).to receive(:puts).with "Gift aid: £5.25"
		interface.run
	end

	it 'responds correctly to a swimming event' do
		expect(interface).to receive(:gets).and_return "1"
		expect(interface).to receive(:gets).and_return "20"
		expect(interface).to receive(:gets).and_return "Swimming"
		expect(interface).to receive(:puts).with "Gift aid: £5.15"
		interface.run
	end
end