class Tariff < ApplicationRecord
  has_many :loans

  validates :name, presence: true
  validates :term, numericality: { only_integer: true,
                                 greater_than_or_equal_to: 1,
                                 less_than_or_equal_to: 1200 }
  validates :interest, numericality: true,
                       format: { with: /\A\d(\.\d{1,4})?\z/,
                                 message: "should be percent" }
  validates :overdue_interest, numericality: true,
                               format: { with: /\A\d(\.\d{1,4})?\z/,
                                         message: "should be percent" }
end
