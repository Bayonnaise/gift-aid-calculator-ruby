class Calculator

	def initialize
		@tax_rate = 20
	end

	attr_reader :tax_rate

	def gift_aid(donation, event="")
		bonus = calculate_bonus(event)
		( donation * (tax_rate / (100.0 - tax_rate)) * bonus ).round(2)
	end

	def set_tax_rate(new_rate)
		@tax_rate = new_rate
	end

	def calculate_bonus(event)
		case event.downcase
			when "running" 
				1.05
			when "swimming"
				1.03
			else
				1
		end
	end

end