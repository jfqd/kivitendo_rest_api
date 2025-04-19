class Order < ApplicationRecord
  self.table_name  = 'oe'
  self.primary_key = 'id'

  before_save :set_validity_date, if: :quotation?

  has_many :orderitems, foreign_key: :trans_id
  has_one  :periodic_invoice, foreign_key: :oe_id
  
  # map usable to legacy fields-names
  legacy_mapper [
    [:order_number,  :ordnumber],
    [:quote_number,  :quonumber],
    [:gross_total,   :amount],
    [:net_total,     :netamount],
    [:contact_id,    :cp_id],
    [:delivery_date, :reqdate],
    [:validity_date, :reqdate],
    [:order_date,    :transdate],
    [:shop_number,   :cusordnumber]
  ]

  accepts_nested_attributes_for :orderitems, allow_destroy: true,
                                             reject_if: :all_blank

  accepts_nested_attributes_for :periodic_invoice,
                                allow_destroy: true

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
  
  def periodic_invoice=(params)
    self.periodic_invoice.build(params) if new_record?
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

  private

  def set_validity_date
    self.validity_date = ( Time.now + 14.days ) if new_record?
  end

  def quotation?
    self.order_number.blank?
  end

end
