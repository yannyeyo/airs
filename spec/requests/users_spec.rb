require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /_create_page" do
    it "returns http success" do
      get "/users/_create_page"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /_update_page" do
    it "returns http success" do
      get "/users/_update_page"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/users/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/users/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end

end
