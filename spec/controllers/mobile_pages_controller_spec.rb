require 'spec_helper'

describe MobilePagesController do
	render_views

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

end
