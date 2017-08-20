namespace :scenarios do
  desc "Example calculation ☕️"
  task first: :environment do
    tariff = Tariff.create(name: '6 месяцев', term: 6, interest: 0.3, overdue_interest: 0.5)
    client = Client.create(name: 'Заёмщик')

    first_loan = client.loans.create(name: 'ЮЛ-1', amount: 1_000_000, tariff: tariff)
    first_loan.payments = [
      Payment.create(
        interest: first_loan.monthly_interest,
        base:     first_loan.monthly_base
      ),
      Payment.create(
        interest: first_loan.monthly_interest,
        base:     first_loan.monthly_base
      ),
      Payment.create(
        interest: first_loan.monthly_interest,
        base:     first_loan.monthly_base
      ),
      Payment.create(
        interest: first_loan.monthly_interest,
        base:     first_loan.monthly_base
      ),
      Payment.create(
        interest: first_loan.monthly_interest,
        base:     first_loan.monthly_base
      ),
      Payment.create(
        interest: first_loan.monthly_interest,
        base:     first_loan.monthly_base
      )
    ]

    second_loan = client.loans.create(name: 'ЮЛ-2', amount: 1_000_000, tariff: tariff)
    second_loan.payments = [
      Payment.create(
        interest: second_loan.monthly_interest,
        base:     second_loan.monthly_base
      ),
      Payment.create(
        interest: second_loan.monthly_interest,
        base:     second_loan.monthly_base
      ),
      Payment.create(
        interest: second_loan.monthly_interest,
        base:     second_loan.monthly_base
      ),
      Payment.create(
        interest: second_loan.monthly_interest,
        base:     second_loan.amount - second_loan.monthly_base * 3
      ),
      Payment.create(
        interest: 0.0,
        base:     0.0
      ),
      Payment.create(
        interest: 0.0,
        base:     0.0
      )
    ]

    third_loan = client.loans.create(name: 'ЮЛ-3', amount: 1_000_000, tariff: tariff)
    third_loan.payments = [
      Payment.create(
        interest: third_loan.monthly_interest,
        base:     third_loan.monthly_base
      ),
      Payment.create(
        interest: third_loan.monthly_interest,
        base:     third_loan.monthly_base
      ),
      Payment.create(
        interest: third_loan.monthly_overdue_interest,
        base:     third_loan.monthly_base
      ),
      Payment.create(
        interest: third_loan.monthly_overdue_interest,
        base:     third_loan.monthly_base
      ),
      Payment.create(
        interest: third_loan.monthly_overdue_interest,
        base:     third_loan.monthly_base
      ),
      Payment.create(
        interest: third_loan.monthly_overdue_interest,
        base:     third_loan.monthly_base
      )
    ]
  end
end
