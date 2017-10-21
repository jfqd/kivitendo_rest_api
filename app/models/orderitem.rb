class Orderitem < ApplicationRecord
  self.table_name  = 'orderitems'
  self.primary_key = 'id'
  
  belongs_to :order, foreign_key: :trans_id,
                     inverse_of: :orderitems,
                     optional: true
  
  # map legacy fields-names to usable ones
  legacy_mapper [
    [:product_id, :parts_id], [:net_price, :sellprice],
    [:delivery_date, :reqdate], [:order_date, :transdate],
    [:created_at, :itime], [:updated_at, :mtime]
  ]
end
