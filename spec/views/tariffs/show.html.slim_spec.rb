require 'rails_helper'

RSpec.describe "tariffs/show", type: :view do
  before(:each) do
    @tariff = assign(:tariff, Tariff.create!(
      :name => "Name",
      :term => 2,
      :interest => "0.35",
      :overdue_interest => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(number_to_percentage(0.35 * 100, precision: 2, strip_insignificant_zeros: true))
    expect(rendered).to match(number_to_percentage(9.99 * 100, precision: 2, strip_insignificant_zeros: true))
  end
end
