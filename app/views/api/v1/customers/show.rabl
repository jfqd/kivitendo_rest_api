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
           :currency_id

child :contacts do
  attributes :id, :title, :fist_name, :last_name, :gender, :position, :email, :phone, :fax, :mobile
end
