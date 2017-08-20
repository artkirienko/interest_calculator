require 'rails_helper'

RSpec.describe "loans/new", type: :view do
  let(:tariff) { Tariff.create!(
                    name: '6 months',
                    term: 6,
                    interest: 0.35,
                    overdue_interest: 1.05
  ) }
  let(:client) { Client.create!(
                    name: 'Acme, LLC.'
  ) }

  before(:each) do
    assign(:loan, Loan.new(
      :name => "MyString",
      :tariff => nil,
      :client => nil,
      :amount => "9.99"
    ))
  end

  it "renders new loan form" do
    render

    assert_select "form[action=?][method=?]", loans_path, "post" do

      assert_select "input[name=?]", "loan[name]"

      assert_select "select[name=?]", "loan[tariff_id]"

      assert_select "select[name=?]", "loan[client_id]"

      assert_select "input[name=?]", "loan[amount]"
    end
  end
end
