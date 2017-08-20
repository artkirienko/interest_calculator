require 'rails_helper'

RSpec.describe "payments/show", type: :view do
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
    @payment = assign(:payment, Payment.create!(
      :loan => loan,
      :base => "9.99",
      :interest => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Telegram, LLC/)
    expect(rendered).to match(/9\.99/)
    expect(rendered).to match(/9\.99/)
  end
end
