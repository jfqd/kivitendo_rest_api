class Contact < ApplicationRecord
  self.table_name  = 'contacts'
  self.primary_key = 'cp_id'

  belongs_to :customer, foreign_key: :cp_cv_id,
                        inverse_of:  :contacts,
                        optional:    true

  # map usable to legacy fields-names
  legacy_mapper [
    [:id,         :cp_id],
    [:title,      :cp_title],
    [:first_name, :cp_givenname],
    [:last_name,  :cp_name],
    [:gender,     :cp_gender],
    [:position,   :cp_position],
    [:email,      :cp_email],
    [:phone,      :cp_phone1],
    [:fax,        :cp_fax],
    [:mobile,     :cp_mobile1]
  ]
  
  def created_at
    I18n.l(self.itime, :format => Api::V1::ApiController.default_api_time_format) unless new_record?
  rescue
    nil
  end
  def created_at=(v)
    # do nothing
  end
  
  def updated_at
    I18n.l(self.mtime, :format => Api::V1::ApiController.default_api_time_format) unless new_record?
  rescue
    nil
  end
  def updated_at=(v)
    # do nothing
  end
  
end
