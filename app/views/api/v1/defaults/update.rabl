object @default

attributes :id
node(:errors) { |default| default.errors.full_messages.join(";") rescue "?" }
