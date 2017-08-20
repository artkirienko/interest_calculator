require 'rails_helper'

RSpec.describe "loans/index", type: :view do
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
    assign(:loans, [
      Loan.create!(
        :name => "Name",
        :tariff => tariff,
        :client => client,
        :amount => "9.99"
      ),
      Loan.create!(
        :name => "Name",
        :tariff => tariff,
        :client => client,
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of loans" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => tariff.name.to_s, :count => 2
    assert_select "tr>td", :text => client.name.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
