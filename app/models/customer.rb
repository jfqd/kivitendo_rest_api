class Customer < ApplicationRecord
  self.table_name  = 'customer'
  self.primary_key = 'id'
  
  has_many :contacts,  foreign_key: :cp_cv_id
  has_many :shippings, foreign_key: :trans_id
  
  accepts_nested_attributes_for :contacts,  allow_destroy: true,
                                            reject_if: :all_blank
  accepts_nested_attributes_for :shippings, allow_destroy: true,
                                            reject_if: :all_blank
  
  def contacts=(params)
    params.each do |c|
      if new_record?
        self.contacts.build(c[1])
      else
        if c['id'].present?
          contact = self.contacts.all.detect { |co| co.cp_id == c['id'] }
          contact.attributes = c
        else
          self.contacts.build(c)
        end
      end
    end
  end
  
  def shippings=(params)
    params.each do |s|
      if new_record?
        self.shippings.build(s[1])
      else
        if s['id'].present?
          shipping = self.shippings.all.detect { |sh| sh.trans_id == s['id'] }
          shippings.attributes = s
        else
          self.shippings.build(s)
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

# taxzone_id
# ustid
# currency_id

# discount
# taxincluded
# creditlimit
# customernumber
# cc
# bcc
# business_id
# taxnumber
# account_number
# bank_code
# bank
# language
# obsolete
# username
# user_password
# salesman_id
# c_vendor_id
# language_id
# payment_id
# geeting
# iban
# bic
# direct_debit
