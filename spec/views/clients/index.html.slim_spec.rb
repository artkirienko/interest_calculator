require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        :name => "VK, LLC"
      ),
      Client.create!(
        :name => "Telegram, LLC"
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", :text => "VK, LLC".to_s, :count => 1
    assert_select "tr>td", :text => "Telegram, LLC".to_s, :count => 1
  end
end
