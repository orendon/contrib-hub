require 'spec_helper'

describe TaggingController do

  describe "GET 'update_tags'" do
    it "returns http success" do
      get 'update_tags'
      response.should be_success
    end
  end

end
