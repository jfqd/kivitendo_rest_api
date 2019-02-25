class Orderitem < ApplicationRecord
  self.table_name  = 'orderitems'
  self.primary_key = 'id'
  
  belongs_to :order, foreign_key: :trans_id,
                     inverse_of:  :orderitems,
                     optional:    true
  
  # map usable to legacy fields-names
  legacy_mapper [
    [:product_id,    :parts_id],
    [:price,         :sellprice],
    [:delivery_date, :reqdate],
    [:order_date,    :transdate],
    [:created_at,    :itime],
    [:updated_at,    :mtime]
  ]
end
