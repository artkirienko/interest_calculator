require 'rails_helper'

RSpec.describe "tariffs/edit", type: :view do
  before(:each) do
    @tariff = assign(:tariff, Tariff.create!(
      :name => "MyString",
      :term => 1,
      :interest => "9.99",
      :overdue_interest => "9.99"
    ))
  end

  it "renders the edit tariff form" do
    render

    assert_select "form[action=?][method=?]", tariff_path(@tariff), "post" do

      assert_select "input[name=?]", "tariff[name]"

      assert_select "input[name=?]", "tariff[term]"

      assert_select "input[name=?]", "tariff[interest]"

      assert_select "input[name=?]", "tariff[overdue_interest]"
    end
  end
end
