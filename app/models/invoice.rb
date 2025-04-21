class Invoice < ApplicationRecord
  self.table_name  = 'ar'
  self.primary_key = 'id'

  # map usable to legacy fields-names
  legacy_mapper [
    [:invoice_number, :invnumber],
    [:shop_number,    :cusordnumber]
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
