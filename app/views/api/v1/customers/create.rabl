object @customer

attributes :id
node(:errors) { |customer| customer.errors.full_messages.join(";") rescue "?" }
