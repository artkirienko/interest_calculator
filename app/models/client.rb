class Client < ApplicationRecord
  has_many :loans, dependent: :destroy
  validates :name, presence: true,
                   uniqueness: true

  def annual_realistic
    payed_interest = loans.includes(:payments).inject(0.0) {|sum, loan| sum += loan.payed_interest}
    payed_base = loans.includes(:payments).inject(0.0) {|sum, loan| sum += loan.payed_base}
    (1.0 * payed_interest / payed_base / loans.first.tariff.term * 12).round(4)
  end

  def annual_optimistic
    annual_interest = loans.includes(:tariff).inject(0.0) {|sum, loan| sum += (loan.monthly_interest * loan.tariff.term)}
    annual_base = loans.includes(:tariff).inject(0.0) {|sum, loan| sum += (loan.monthly_base * loan.tariff.term)}
    (1.0 * annual_interest / annual_base / loans.first.tariff.term * 12).round(4)
  end
end
