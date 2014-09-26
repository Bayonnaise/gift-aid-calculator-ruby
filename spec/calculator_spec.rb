require 'calculator'

describe 'gift aid calulator' do
	
	let(:calculator) { Calculator.new }

	context 'Story 1:' do
		it 'calculates gift aid at the current tax rate' do
			expect(calculator.gift_aid(20)).to eq 5
		end

		it 'calculates gift aid for non-whole numbers at the current tax rate' do
			expect(calculator.gift_aid(14)).to eq 3.5
		end
	end

	context 'Story 2:' do
		it 'can change the tax rate without affecting the code' do
			calculator.set_tax_rate(25)
			expect(calculator.gift_aid(15)).to eq 5
		end
	end

	context "Story 3:" do
		it 'rounds the gift aid total to 2dp' do
			expect(calculator.gift_aid(19.50)).to eq 4.88
		end
	end

	context 'Story 4:' do
		it 'adds a supplement for specific events' do
			expect(calculator.gift_aid(20, "running")).to eq 5.25
			expect(calculator.gift_aid(20, "swimming")).to eq 5.15
		end
	end

end