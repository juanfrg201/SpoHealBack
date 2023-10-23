require 'rails_helper'

RSpec.describe "Api::V1::UserRoutes", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/user_routes/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/user_routes/index"
      expect(response).to have_http_status(:success)
    end
  end

end
