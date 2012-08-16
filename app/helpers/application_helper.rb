module ApplicationHelper
	def no_navbar?
		if !defined? @no_navbar
			return false
		else
			return @no_navbar
		end
	end
end
