class Shipping < ApplicationRecord
  self.table_name  = 'shipto'
  self.primary_key = 'shipto_id'

  before_save :set_module

  belongs_to :customer, foreign_key: :id,
                        inverse_of:  :shippings,
                        optional:    true

  # map usable to legacy fields-names
  legacy_mapper [
    [:id,          :shipto_id],
    [:customer_id, :trans_id],
    [:company,     :shiptoname],
    [:contact,     :shiptocontact],
    [:gender,      :shiptocp_gender],
    [:street,      :shiptostreet],
    [:zipcode,     :shiptozipcode],
    [:city,        :shiptocity],
    [:country,     :shiptocountry],
    [:email,       :shiptoemail]
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
  
  private
  
  def set_module
    self.module = "CT"
  end
end

