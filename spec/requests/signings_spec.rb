require 'rails_helper'

RSpec.describe "Signings", type: :request do
  describe "GET /_create_sign_page" do
    it "returns http success" do
      get "/signings/_create_sign_page"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /airs" do
    it "returns http success" do
      get "/signings/airs"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /sign" do
    it "returns http success" do
      get "/signings/sign"
      expect(response).to have_http_status(:success)
    end
  end

end
