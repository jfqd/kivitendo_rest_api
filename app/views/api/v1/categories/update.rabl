object @category

attributes :id
node(:errors) { |category| category.errors.full_messages.join(";") rescue "?" }
