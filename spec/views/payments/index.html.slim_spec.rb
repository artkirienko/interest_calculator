require 'rails_helper'

RSpec.describe "payments/index", type: :view do
  let(:tariff) { Tariff.create!(
                    name: '6 months',
                    term: 6,
                    interest: 0.35,
                    overdue_interest: 1.05
  ) }
  let(:client) { Client.create!(
                    name: 'Acme, LLC.'
  ) }
  let(:loan) { Loan.create!(
    :name => 'Telegram, LLC.',
    :tariff => tariff,
    :client => client,
    :amount => "199.99"
  ) }

  before(:each) do
    assign(:payments, [
      Payment.create!(
        :loan => loan,
        :base => "24.55",
        :interest => "39.99"
      ),
      Payment.create!(
        :loan => loan,
        :base => "24.55",
        :interest => "39.99"
      )
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", :text => loan.name.to_s, :count => 2
    assert_select "tr>td", :text => number_to_currency(24.55), :count => 2
    assert_select "tr>td", :text => number_to_currency(39.99), :count => 2
    assert_select "tr>td", :text => number_to_currency(64.54), :count => 2
  end
end
