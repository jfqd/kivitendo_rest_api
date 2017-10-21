# REST-API for kivitendo

This project aims to add a http-basic protected REST-API to kivitendo.

## Requirements

* Ruby ~> 2.4.2
* Bundler ~> 1.15.4
* Passenger >= 5.1.11

## Installation

Make sure that you have the latest ruby 2.4.x version installed for your system.
On a Mac, Linux, Solaris or any other Unix systems we highly recommend you to use rvm,
the ruby version manager. With rvm upgrading a ruby version is without pain!
To learn more about rvm please visit: http://rvm.io.

```
rvm install ruby-2.4.2
```

To get the application started run the following commands in a console:

```
  cd /path/to/project-folder
  rvm use ruby-2.4.2@kivitendo-rest-api --create
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
  # and copy it into the secret.yml
  # together with the http-basic
  # credentials and the database-url
  # see secrets.yml.bak for reference
  rails secrets:edit
  # start the webserver
  passenger start
```

## Usage

The api is protected by http-basic. Do not forget to protect these secrets by using https!

The default in- and output is in xml-format, but you can use json too. Just add `.json` to the end of the path.

All following samples will use the xml as the exchange-format.

### Get a list of all customers

````
curl -s -u "user:password" 127.0.0.1:3000/api/v1/customers
````

### Get one customer

````
curl -s -u "user:password" 127.0.0.1:3000/api/v1/customers/1
````

### Change customer

````
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
````

### Create a new customer

```
curl -s \
     -u "user:password" \
     -X POST \
     -H 'Content-Type: application/xml' \
     127.0.0.1:3000/api/v1/customers \
     -d '
<?xml version="1.0" encoding="UTF-8"?>
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

### Delete a new customer

```
curl -s \
     -u "user:password" \
     -X DELETE \
     127.0.0.1:3000/api/v1/customers/1
```

## Todo

- add model validation
- add https

## Useful links

* http://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Basic.html
* https://pikender.github.io/rails4-upgrade-action-pack-xml-params-removed/
* https://github.com/rails/actionpack-xml_parser
* http://brandonhilkert.com/blog/using-rails-4-dot-1-secrets-for-configuration/
* https://github.com/nesquena/rabl/issues/687
* http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
* http://guides.rubyonrails.org/form_helpers.html#dealing-with-model-objects

(c) 2017 S. Husch | qutic.com