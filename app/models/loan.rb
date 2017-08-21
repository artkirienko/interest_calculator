class Loan < ApplicationRecord
  belongs_to :tariff
  belongs_to :client
  has_many :payments, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: true
  validates :amount, numericality: true,
                       format: { with: /\A\d{1,12}(\.\d{1,2})?\z/,
                                 message: I18n.t('should_be_money') }

  def monthly_base
    1.0 * amount / tariff.term
  end

  def monthly_interest
    1.0 * amount * tariff.interest / 12
  end

  def monthly_overdue_interest
    1.0 * amount * tariff.overdue_interest / 12
  end

  def monthly_total
    monthly_base + monthly_interest
  end

  def total
    1.0 * monthly_total * tariff.term
  end

  def payed_interest
    payments.inject(0.0) {|sum, payment| sum += payment.interest}
  end

  def payed_base
    payments.inject(0.0) {|sum, payment| sum += payment.base}
  end

  def payed_annual_interest
    1.0 * payed_interest / payed_base * 12 / tariff.term
  end
end
