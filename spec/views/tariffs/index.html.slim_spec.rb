require 'rails_helper'

RSpec.describe "tariffs/index", type: :view do
  before(:each) do
    assign(:tariffs, [
      Tariff.create!(
        :name => "2 months",
        :term => 2,
        :interest => "0.35",
        :overdue_interest => "1.99"
      ),
      Tariff.create!(
        :name => "2 months special",
        :term => 2,
        :interest => "0.35",
        :overdue_interest => "1.99"
      )
    ])
  end

  it "renders a list of tariffs" do
    render
    assert_select "tr>td", :text => "2 months".to_s, :count => 1
    assert_select "tr>td", :text => "2 months special".to_s, :count => 1
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => number_to_percentage(0.35 * 100, precision: 2, strip_insignificant_zeros: true), :count => 2
    assert_select "tr>td", :text => number_to_percentage(1.99 * 100, precision: 2, strip_insignificant_zeros: true), :count => 2
  end
end
