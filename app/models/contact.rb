class Contact < ApplicationRecord
  self.table_name  = 'contacts'
  self.primary_key = 'cp_id'

  belongs_to :customer, :foreign_key => :cp_cv_id

  # map legacy fields-names to usable
  legacy_mapper [ [:id, :cp_id], [:title, :cp_title], [:fist_name, :cp_givenname], [:last_name, :cp_name] ]
end
