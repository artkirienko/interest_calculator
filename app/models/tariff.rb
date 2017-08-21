class Tariff < ApplicationRecord
  has_many :loans, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: true
  validates :term, numericality: { only_integer: true,
                                 greater_than_or_equal_to: 1,
                                 less_than_or_equal_to: 1200 }
  validates :interest, numericality: true,
                       format: { with: /\A\d(\.\d{1,4})?\z/,
                                 message: I18n.t('should_be_percent') }
  validates :overdue_interest, numericality: true,
                               format: { with: /\A\d(\.\d{1,4})?\z/,
                                         message: I18n.t('should_be_percent') }
end
