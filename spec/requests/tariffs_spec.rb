require 'rails_helper'

RSpec.describe "Tariffs", type: :request do
  describe "GET /tariffs" do
    it "works! (now write some real specs)" do
      get tariffs_path
      expect(response).to have_http_status(200)
    end
  end
end
