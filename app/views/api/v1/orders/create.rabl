object @order

attributes :id
node(:errors) { |order| order.errors.full_messages.join(";") rescue "?" }
