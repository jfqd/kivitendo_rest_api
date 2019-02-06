collection @customer

attributes :id,
           :customernumber,
           :name,
           :street,
           :zipcode,
           :city,
           :country,
           :phone,
           :fax,
           :homepage,
           :email,
           :notes,
           :ustid,
           :taxzone_id,
           :currency_id,
           :created_at,
           :updated_at

child :contacts do
  attributes :id, :title, :fist_name, :last_name, :gender, :position, :email, :phone, :fax, :mobile, :created_at, :updated_at
end
child :shippings do
  attributes :id, :customer_id, :company, :contact, :gender, :email, :street, :zipcode, :city, :country, :created_at, :updated_at
end
