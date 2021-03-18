class Default < ApplicationRecord
  self.table_name  = 'defaults'
  self.primary_key = 'id'
  
  legacy_mapper [
    [:invoice_number,  :invnumber],
    [:order_number,    :sonumber],
    [:quote_number,    :sqnumber],
    [:customer_number, :customernumber]
  ]
  
end
