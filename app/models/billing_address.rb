class BillingAddress < ApplicationRecord
  self.table_name  = 'additional_billing_addresses'
  self.primary_key = 'id'

  belongs_to :customer, foreign_key: :customer_id,
                        inverse_of:  :billing_address,
                        optional:    true

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
