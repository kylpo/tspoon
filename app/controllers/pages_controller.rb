class PagesController < ApplicationController
  def home
		if mobileBrowser?
			redirect_to m_path
		end
  end

	private

	def mobileBrowser?
		if request.user_agent =~ /Mobile|webOS/
			return true
		else
			return false
		end
	end

end
