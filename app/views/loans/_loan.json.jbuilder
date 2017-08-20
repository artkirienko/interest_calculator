json.extract! loan, :id, :name, :tariff_id, :client_id, :amount, :created_at, :updated_at
json.url loan_url(loan, format: :json)
