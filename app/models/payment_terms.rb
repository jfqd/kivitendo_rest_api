class PaymentTerm < ApplicationRecord
  self.table_name  = 'payment_terms'
  self.primary_key = 'id'
end
