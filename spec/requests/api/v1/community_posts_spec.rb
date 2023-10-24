require 'rails_helper'

RSpec.describe "Api::V1::CommunityPosts", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/community_posts/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/community_posts/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/community_posts/update"
      expect(response).to have_http_status(:success)
    end
  end

end
