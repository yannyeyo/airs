require 'rails_helper'

RSpec.describe "Rewiews", type: :request do
  describe "GET /_new_comm" do
    it "returns http success" do
      get "/rewiews/_new_comm"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/rewiews/show"
      expect(response).to have_http_status(:success)
    end
  end

end
