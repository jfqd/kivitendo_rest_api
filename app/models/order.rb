class Order < ApplicationRecord
  self.table_name  = 'oe'
  self.primary_key = 'id'
  
  has_many :orderitems, foreign_key: :trans_id
  
  # map legacy fields-names to usable ones
  legacy_mapper [
    [:gross_total, :amount], [:net_total, :netamount], [:contact_id, :cp_id],
    [:delivery_date, :reqdate], [:order_date, :transdate]
  ]
  
  accepts_nested_attributes_for :orderitems, allow_destroy: true,
                                             reject_if: :all_blank
  
  def orderitems=(params)
    params.each do |c|
      if new_record?
        self.orderitems.build(c[1])
      else
        if c['id'].present?
          item = self.orderitems.all.detect { |co| co.oid == c['id'] }
          item.attributes = c
        else
          self.orderitems.build(c)
        end
      end
    end
  end
  
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
