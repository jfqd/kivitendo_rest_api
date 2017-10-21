class Currency < ApplicationRecord
  self.table_name  = 'currencies'
  self.primary_key = 'id'
end
