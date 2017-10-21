class Product < ApplicationRecord
  self.table_name  = 'parts'
  self.primary_key = 'id'
  
  # map legacy fields-names to usable ones
  legacy_mapper [
    [:productnumber, :partnumber], [:net_listprice, :listprice], [:net_sellprice, :sellprice]
  ]
  
  def created_at
    I18n.l(self.itime, :format => Api::V1::ApiController.default_api_time_format) unless new_record?
  end
  def created_at=(v)
    # do nothing
  end
  
  def updated_at
    I18n.l(self.mtime, :format => Api::V1::ApiController.default_api_time_format) unless new_record?
  end
  def updated_at=(v)
    # do nothing
  end
  
end
