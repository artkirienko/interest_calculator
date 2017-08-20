require 'rails_helper'

RSpec.describe "loans/show", type: :view do
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
    @loan = assign(:loan, Loan.create!(
      :name => "Name",
      :tariff => tariff,
      :client => client,
      :amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/6 months/)
    expect(rendered).to match(/Acme, LLC\./)
    expect(rendered).to match(/9.99/)
  end
end
