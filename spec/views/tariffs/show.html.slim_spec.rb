require 'rails_helper'

RSpec.describe "tariffs/show", type: :view do
  before(:each) do
    @tariff = assign(:tariff, Tariff.create!(
      :name => "Name",
      :term => 2,
      :interest => "9.99",
      :overdue_interest => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
