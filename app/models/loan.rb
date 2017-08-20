class Loan < ApplicationRecord
  belongs_to :tariff
  belongs_to :client
  has_many :payments

  validates :name, presence: true
  validates :amount, numericality: true,
                       format: { with: /\A\d{1,12}(\.\d{1,2})?\z/,
                                 message: "should be money" }
end
