json.extract! payment, :id, :loan_id, :base, :interest, :created_at, :updated_at
json.url payment_url(payment, format: :json)
