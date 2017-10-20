class Contact < ApplicationRecord
  self.table_name  = 'contacts'
  self.primary_key = 'cp_id'
  
  belongs_to :customer, :foreign_key => :cp_cv_id
end
