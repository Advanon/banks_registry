# BanksRegistry

A little Ruby gem to retrieve bank information by BIC/SWIFT/IBAN

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'banks_registry'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:
```
$ gem install banks_registry
```

## Usage

### Retrieving bank information by BIC/SWIFT number

```ruby
require 'banks_registry'

BanksRegistry.find_by_bic('WIREDEMMXXX')
#=> BanksRegistry::Bank
```

### Retrieving bank information by IBAN

**NOTE** that this feature is only available for Switzerland and Germany!

```ruby
require 'banks_registry'

BanksRegistry.find_by_iban('DE61 5123 0800 0000 0111 11')
#=> BanksRegistry::Bank
```

## Sources
International bank details:
```
https://transferwise.com
```

Swiss national bank numbers:
```
https://www.six-group.com/interbank-clearing/de/home/bank-master-data/download-bc-bank-master.html
```

German national bank numbers:
```
https://www.bundesbank.de/de/aufgaben/unbarer-zahlungsverkehr/serviceangebot/bankleitzahlen/download---bankleitzahlen-602592
```

Official IBAN registry:
```
https://www.swift.com/sites/default/files/resources/swift_standards_ibanregistry.pdf
```

## Contributing

Bug reports and pull requests are welcome.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
