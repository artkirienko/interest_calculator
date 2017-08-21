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
        :name => "VK, LLC",
        :tariff => tariff,
        :client => client,
        :amount => "9.99"
      ),
      Loan.create!(
        :name => "Telegram, LLC",
        :tariff => tariff,
        :client => client,
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of loans" do
    render
    assert_select "tr>td>a", :text => "VK, LLC".to_s, :count => 1
    assert_select "tr>td>a", :text => "Telegram, LLC".to_s, :count => 1
    assert_select "tr>td", :text => tariff.name.to_s, :count => 2
    assert_select "tr>td", :text => client.name.to_s, :count => 2
    assert_select "tr>td", :text => "#{number_to_currency(9.99)}", :count => 2
  end
end
