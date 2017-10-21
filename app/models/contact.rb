class Contact < ApplicationRecord
  self.table_name  = 'contacts'
  self.primary_key = 'cp_id'

  belongs_to :customer, foreign_key: :cp_cv_id,
                        inverse_of: :contacts,
                        optional: true

  # map legacy fields-names to usable ones
  legacy_mapper [
    [:id, :cp_id], [:title, :cp_title], [:fist_name, :cp_givenname], [:last_name, :cp_name],
    [:gender, :cp_gender], [:position, :cp_position], [:email, :cp_email], [:phone, :cp_phone1],
    [:fax, :cp_fax], [:mobile, :cp_mobile1]
  ]
end

# should we add theses fields too?
# [:, :cp_phone2]
# [:, :cp_mobile2]
# [:, :cp_satphone]
# [:, :cp_satfax]
# [:, :cp_privatephone]
# [:, :cp_privatemail]
# [:, :cp_abteilung]
# [:, :cp_street]
# [:, :cp_zipcode]
# [:, :cp_city]
# [:, :cp_birthday]
