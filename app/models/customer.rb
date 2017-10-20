class Customer < ApplicationRecord
  self.table_name  = 'customer'
  self.primary_key = 'id'
  
  has_many :contacts, :foreign_key => :cp_cv_id
end
