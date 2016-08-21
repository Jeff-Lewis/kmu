json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :account_ver, :account_bel, :valuta, :status_ver, :status_bel, :status, :active, :trx_text, :trx_ref
  json.url transaction_url(transaction, format: :json)
end
