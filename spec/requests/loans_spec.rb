require 'rails_helper'

RSpec.describe "Loans", type: :request do
  describe "GET /loans" do
    it "works! (now write some real specs)" do
      get loans_path
      expect(response).to have_http_status(200)
    end
  end
end
