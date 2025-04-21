collection @invoice

attributes :id,
           :invoice_number,
           :customer_id,
           :shop_number
           :created_at,
           :updated_at

child :customer do
  attributes :id, :name
end
