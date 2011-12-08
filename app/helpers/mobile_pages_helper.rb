module MobilePagesHelper

	def titleHelper
		base_title = "TSPoon"
		if @title.nil?
			return base_title
		else
			return "#{base_title} - #{@title}"
		end
	end

end
