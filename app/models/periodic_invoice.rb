class PeriodicInvoice < ApplicationRecord
  self.table_name  = 'periodic_invoices_configs'
  self.primary_key = 'id'
  
  before_save :set_requirements

  belongs_to :order, foreign_key: :oe_id,
                     inverse_of:  :periodic_invoice,
                     optional:    true

  legacy_mapper [
    [:chart_id,  :ar_chart_id],
    [:extend_by, :extend_automatically_by]
  ]
  
  private
  
  def set_requirements
    self.order_value_periodicity = 'p' if self.order_value_periodicity.blank?
    self.direct_debit = false          if self.direct_debit.blank?
    self.start_date = Time.now         if self.start_date.blank?
  end
  
end