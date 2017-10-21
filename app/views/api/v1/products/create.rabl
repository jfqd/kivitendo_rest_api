object @product

attributes :id
node(:errors) { |product| product.errors.full_messages.join(";") rescue "?" }
