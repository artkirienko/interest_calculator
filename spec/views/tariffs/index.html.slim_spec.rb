require 'rails_helper'

RSpec.describe "tariffs/index", type: :view do
  before(:each) do
    assign(:tariffs, [
      Tariff.create!(
        :name => "Name",
        :term => 2,
        :interest => "0.35",
        :overdue_interest => "1.99"
      ),
      Tariff.create!(
        :name => "Name",
        :term => 2,
        :interest => "0.35",
        :overdue_interest => "1.99"
      )
    ])
  end

  it "renders a list of tariffs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "0.35".to_s, :count => 2
    assert_select "tr>td", :text => "1.99".to_s, :count => 2
  end
end
