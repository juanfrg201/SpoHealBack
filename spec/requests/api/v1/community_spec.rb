require 'rails_helper'

RSpec.describe "Api::V1::Communities", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/community/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/api/v1/community/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/community/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/community/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/community/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
