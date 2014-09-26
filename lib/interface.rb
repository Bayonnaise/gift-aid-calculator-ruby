require_relative './calculator'

class Interface

	def initialize
		@calculator = Calculator.new
	end

	attr_reader :calculator

	def run
		puts "Gift Aid Calculator\n1. Calculate gift aid on a donation\n2. Change tax rate\nPlease enter a number:"
		process_choice(gets.chomp)
	end

	private

	def process_choice(input)
		case (input)
		when "1"
			puts "Please enter your donation amount:"
			donation = gets.chomp.to_f
			puts "Please enter the event type"
			event = gets.chomp
			puts "Gift aid: £" + ('%.2f' % calculator.gift_aid(donation, event))
		when "2"
			puts "Please enter the new tax rate"
			calculator.set_tax_rate(gets.chomp.to_i)
		else
			puts "Not a valid choice"
			exit
		end
	end
end