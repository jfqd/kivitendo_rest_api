class Customer < ApplicationRecord
  self.table_name  = 'customer'
  self.primary_key = 'id'
  
  has_many :contacts, foreign_key: :cp_cv_id
  
  accepts_nested_attributes_for :contacts, allow_destroy: true,
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
