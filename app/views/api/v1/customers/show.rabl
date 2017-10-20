collection @customer

attributes :id,
           :name,
           :street,
           :zipcode,
           :city,
           :country,
           :phone,
           :fax,
           :homepage,
           :email,
           :notes

child :contacts do
  attributes :id, :title, :fist_name, :last_name
end
