require 'rails_helper'

RSpec.describe "tariffs/new", type: :view do
  before(:each) do
    assign(:tariff, Tariff.new(
      :name => "MyString",
      :term => 1,
      :interest => "9.99",
      :overdue_interest => "9.99"
    ))
  end

  it "renders new tariff form" do
    render

    assert_select "form[action=?][method=?]", tariffs_path, "post" do

      assert_select "input[name=?]", "tariff[name]"

      assert_select "input[name=?]", "tariff[term]"

      assert_select "input[name=?]", "tariff[interest]"

      assert_select "input[name=?]", "tariff[overdue_interest]"
    end
  end
end
