class PeriodicInvoice < ApplicationRecord
  self.table_name  = 'periodic_invoices_configs'
  self.primary_key = 'id'

  belongs_to :order, foreign_key: :oe_id,
                     inverse_of:  :periodic_invoice,
                     optional:    true

  legacy_mapper [
    [:chart_id,  :ar_chart_id],
    [:extend_by, :extend_automatically_by]
  ]

  def order_value_periodicity=(v='p')
    self.order_value_periodicity = v
  end
  
  def direct_debit=(v=false)
    self.direct_debit = v
  end
  
end