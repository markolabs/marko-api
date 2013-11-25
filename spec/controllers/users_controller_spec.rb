require 'spec_helper'

describe UsersController, type: :controller do
  default_version 1

  describe "GET #show" do
    let(:user) { FactoryGirl.create(:user) }
    before {
      get(:show, { id: user.id, fb_token: user.fb_token })
    }
    let(:response_object) { response.decoded_body }

    it "returns a single user" do
      expect(response).to be_singular_resource
    end

    it "returns json" do
      expect(response).to be_of_content_type :json
    end

    it "returns the expected user" do
      expect(response_object.response.id).to eq user.id
      expect(response_object.response.username).to eq user.username
      expect(response_object.response.fb_user_id).to eq user.fb_user_id
    end

  end

  describe "POST #create" do
    let(:user) { FactoryGirl.create(:user) }
    before {
      post(:create, { user: {
          username: "tommy",
          fb_user_id: "1158141907"
        }, fb_token: user.fb_token})
    }
    let(:response_object) { response.decoded_body }

    it "returns a single user" do
      expect(response).to be_singular_resource
    end

    it "returns json" do
      expect(response).to be_of_content_type :json
    end

    it "returns the expected user" do
      # expect(response_object.response.id).to eq user.id
      expect(response_object.response.username).to eq "tommy"
      expect(response_object.response.fb_user_id).to eq "1158141907"
    end

  end

end
