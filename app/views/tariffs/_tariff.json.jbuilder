json.extract! tariff, :id, :name, :term, :interest, :overdue_interest, :created_at, :updated_at
json.url tariff_url(tariff, format: :json)
