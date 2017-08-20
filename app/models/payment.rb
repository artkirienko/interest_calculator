class Payment < ApplicationRecord
  belongs_to :loan

  validates :base, numericality: true,
                   format: { with: /\A\d{1,12}(\.\d{1,2})?\z/,
                             message: "should be money" }
  validates :interest, numericality: true,
                       format: { with: /\A\d{1,12}(\.\d{1,2})?\z/,
                                 message: "should be money" }

  def total
    base + interest
  end
end
