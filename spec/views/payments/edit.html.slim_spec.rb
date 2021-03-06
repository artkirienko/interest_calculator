require 'rails_helper'

RSpec.describe "payments/edit", type: :view do
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

  it "renders the edit payment form" do
    render

    assert_select "form[action=?][method=?]", payment_path(@payment), "post" do

      assert_select "select[name=?]", "payment[loan_id]"

      assert_select "input[name=?]", "payment[base]"

      assert_select "input[name=?]", "payment[interest]"
    end
  end
end
