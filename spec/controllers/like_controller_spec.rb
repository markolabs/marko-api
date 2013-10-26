require 'spec_helper'

describe LikeController do

  describe "GET 'message:reference'" do
    it "returns http success" do
      get 'message:reference'
      response.should be_success
    end
  end

  describe "GET 'user:reference'" do
    it "returns http success" do
      get 'user:reference'
      response.should be_success
    end
  end

end
