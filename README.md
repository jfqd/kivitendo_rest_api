# REST-API for kivitendo

This project aims to add a http-basic protected REST-API to kivitendo.

The following models are included:

| rest_api model     | kivitendo database tables |
|--------------------|---------------------------|
| customer           | customer                  |
| contact            | contacts                  |
| tax_zone           | tax_zones                 |
| currency           | currencies                |
| order              | oe                        |
| orderitem          | orderitems                |
| product            | parts                     |
| category           | partsgroup                |

## Requirements

* kivitendo ~> 3.4.1
* Ruby ~> 2.4.2
* Bundler ~> 1.15.4
* Passenger >= 5.1.11

## Installation

Make sure that you have the latest ruby 2.4.x version installed for your system.
On a Mac, Linux, Solaris or any other Unix systems we highly recommend you to use rvm,
the ruby version manager. With rvm upgrading a ruby version is without pain!
To learn more about rvm please visit: http://rvm.io.

```
rvm install ruby-2.4.3
rvm use ruby-2.4.3@kivitendo-rest-api --create
rvm @global do gem install bundler
```

To get the application started run the following commands in a console:

```
  git clone https://github.com/jfqd/kivitendo_rest_api.git
  cd kivitendo_rest_api
  export RAILS_ENV=production
  bundle install
```

Before starting the webserver we need to create a secret, set the http-basic credentials
and the database-url.

```
  # remove secrets-files
  rm config/secrets.yml.enc
  rm config/secrets.yml.key
  
  # create a secret for the application
  rails secret

  # and copy it into the secret.yml.enc
  # together with the http-basic
  # credentials and the database-url
  # see secrets.yml.bak for reference
  rails secrets:setup
  rails secrets:edit

  # start the webserver
  passenger start
```

## Usage

The api is protected by http-basic. Do not forget to protect these secrets by using https! To do so remove the comments and change the value for the hostname in `config/initializers/application_controller_renderer.rb`

The default in- and output is in xml-format, but you can use json too. Just add `.json` to the end of the path.

All following samples will use xml as the exchange-format.

### Get a list of all customers

```
curl -s -u "user:password" 127.0.0.1:3000/api/v1/customers
```

### Get one customer

```
curl -s -u "user:password" 127.0.0.1:3000/api/v1/customers/1
```

### Change customer

```
curl -s \
     -u "user:password" \
     -X PUT \
     -H 'Content-Type: application/xml' \
     127.0.0.1:3000/api/v1/customers/1 \
     -d '
<customer>
 <notes>a new note</notes>
</customer>
'
```

### Create a new customer

```
curl -s \
     -u "user:password" \
     -X POST \
     -H 'Content-Type: application/xml' \
     127.0.0.1:3000/api/v1/customers \
     -d '
<customer>
  <name>New Company</name>
  <street>Teststraße 42</street>
  <zipcode>1000</zipcode>
  <city>Berlin</city>
  <country>Deutschland</country>
  <phone>030 42424242</phone>
  <fax>030 43434343</fax>
  <homepage>http://example.com</homepage>
  <email>piet@example.com</email>
  <ustid></ustid>
  <taxzone-id>4</taxzone-id>
  <currency-id>1</currency-id>
  <contacts>
    <contact>
      <gender>m</gender>
      <title>Dr.</title>
      <fist-name>Piet</fist-name>
      <last-name>Mustermann</last-name>
    </contact>
  </contacts>
</customer>
'
```

### Delete a customer

```
curl -s \
     -u "user:password" \
     -X DELETE \
     127.0.0.1:3000/api/v1/customers/1
```

### Get a list of all tax-zones

```
curl -s -u "user:password" 127.0.0.1:3000/api/v1/tax_zones
```

### Get a list of all currencies

```
curl -s -u "user:password" 127.0.0.1:3000/api/v1/currencies
```

### Get a list of all orders

```
curl -s -u "user:password" 127.0.0.1:3000/api/v1/orders
```

### Get one order

```
curl -s -u "user:password" 127.0.0.1:3000/api/v1/orders/1
```

### Create a new order

```
curl -s \
     -u "user:password" \
     -X POST \
     -H 'Content-Type: application/xml' \
     127.0.0.1:3000/api/v1/orders \
     -d '
<order>
  <customer-id>1</customer-id>
  <contact-id>1</contact-id>
  <gross-total>49.0</gross-total>
  <net-total>41.18</net-total>
  <taxincluded>false</taxincluded>
  <order-date>2017-10-21</order-date>
  <delivery-date>2017-10-21</delivery-date>
  <notes>&lt;p&gt;Leistungsdatum entspricht Lieferdatum.&lt;/p&gt;</notes>
  <payment-id>1</payment-id>
  <taxzone-id>4</taxzone-id>
  <currency-id>1</currency-id>
  <closed>false</closed>
  <orderitems>
    <orderitem>
      <position>1</position>
      <product-id>1</product-id>
      <description>Free cookies</description>
      <net-price>0.0</net-price>
      <discount>0.0</discount>
      <qty>1.0</qty>
      <unit>Stck</unit>
      <base-qty>1.0</base-qty>
    </orderitem>
    <orderitem>
      <position>2</position>
      <product-id>2</product-id>
      <description>wedding-cake</description>
      <net-price>41.18</net-price>
      <discount>0.0</discount>
      <qty>1.0</qty>
      <unit>Stck</unit>
      <base-qty>1.0</base-qty>
    </orderitem>
  </orderitems>
</order>
'
```

### Get a list of all products

```
curl -s -u "user:password" 127.0.0.1:3000/api/v1/products
```

### Get one product

```
curl -s -u "user:password" 127.0.0.1:3000/api/v1/products/1
```

### Change product

```
curl -s \
     -u "user:password" \
     -X PUT \
     -H 'Content-Type: application/xml' \
     127.0.0.1:3000/api/v1/products/1 \
     -d '
<product>
 <description>Change description</description>
</product>
'
```

### Get a list of all categories

```
curl -s -u "user:password" 127.0.0.1:3000/api/v1/categories
```

### Get one category

```
curl -s -u "user:password" 127.0.0.1:3000/api/v1/categories/1
```

### Change category

```
curl -s \
     -u "user:password" \
     -X PUT \
     -H 'Content-Type: application/xml' \
     127.0.0.1:3000/api/v1/categories/1 \
     -d '
<category>
 <name>New name</name>
</category>
'
```

### Create a new category

```
curl -s \
     -u "user:password" \
     -X POST \
     -H 'Content-Type: application/xml' \
     127.0.0.1:3000/api/v1/categories \
     -d '
<category>
  <name>Housing</name>
</category>
'
```

### Delete a category

```
curl -s \
     -u "user:password" \
     -X DELETE \
     127.0.0.1:3000/api/v1/categories/1
```

You get the idea, right?

## Hosting

We use Phusion Passenger, but you can use thin, puma, unicorn or any other rack server as well.

## Todo

- add model validation
- add tests

## Useful links

* https://github.com/jfqd/kivitendo_rest_api
* https://github.com/nesquena/rabl
* http://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Basic.html
* https://pikender.github.io/rails4-upgrade-action-pack-xml-params-removed/
* https://github.com/rails/actionpack-xml_parser
* http://brandonhilkert.com/blog/using-rails-4-dot-1-secrets-for-configuration/
* https://github.com/nesquena/rabl/issues/687
* http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
* http://guides.rubyonrails.org/form_helpers.html#dealing-with-model-objects
* http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html
* https://stackoverflow.com/questions/38360271/rails-5-accepts-nested-attributes-not-working#44512631
* https://stackoverflow.com/questions/21163298/how-to-rename-alias-rabl-nodes

(c) 2017 Stefan Husch, qutic development