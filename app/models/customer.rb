class Customer < ApplicationRecord
  self.table_name  = 'customer'
  self.primary_key = 'id'
  
  has_many :contacts,          foreign_key: :cp_cv_id
  has_many :shippings,         foreign_key: :trans_id
  has_many :billing_addresses, foreign_key: :customer_id
  
  accepts_nested_attributes_for :contacts,
                                allow_destroy: true,
                                reject_if: :all_blank
  accepts_nested_attributes_for :shippings,
                                allow_destroy: true,
                                reject_if: :all_blank
  accepts_nested_attributes_for :billing_addresses,
                                allow_destroy: true,
                                reject_if: :all_blank
  
  def contacts=(params)
    params.each do |c|
      h = c[1]
      if new_record?
        self.contacts.build(h)
      else
        _contact = self.contacts.all.detect { |co| co.cp_cv_id == self.id }
        if _contact.present?
          _contact.attributes = h
        else
          self.contacts.build(h)
        end
      end
    end
  end
  
  def shippings=(params)
    params.each do |s|
      h = s[1]
      if new_record?
        self.shippings.build(h)
      else
        _shipping = self.shippings.all.detect { |sh| sh.trans_id == self.id }
        if _shipping.present?
          _shipping.attributes = h
        else
          self.shippings.build(h)
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
