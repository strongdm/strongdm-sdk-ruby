# strongDM SDK for Ruby

This is the official [strongDM](https://www.strongdm.com/) SDK for the Ruby programming language.

Learn more with our [📚strongDM API docs](https://www.strongdm.com/docs/api/) or [📓browse the SDK reference](https://www.rubydoc.info/gems/strongdm).


## Installation

```bash
$ gem install strongdm
```

## Authentication

If you don't already have them you will need to generate a set of API keys, instructions are here: [API Credentials](https://www.strongdm.com/docs/admin-guide/api-credentials/)

Add the keys as environment variables; the SDK will need to access these keys for every request.
```bash
$ export SDM_API_ACCESS_KEY=<YOUR ACCESS KEY>
$ export SDM_API_SECRET_KEY=<YOUR SECRET KEY>
```

## List Users
The following code lists all registered users:

```ruby
require "strongdm"

client = SDM::Client.new(ENV['SDM_API_ACCESS_KEY'], ENV['SDM_API_SECRET_KEY'])
users = client.accounts.list('')
users.each do |user|
	p user
end
```

## Useful Links

* Documentation:  [strongdm gem](https://www.rubydoc.info/gems/strongdm)
* [Migrating from Role Grants to Access Rules](https://github.com/strongdm/strongdm-sdk-ruby/wiki/Migrating-from-Role-Grants-to-Access-Rules)
* Examples: [GitHub - strongdm/strongdm-sdk-ruby-examples](https://github.com/strongdm/strongdm-sdk-ruby-examples)
	1. [Managing Resources](https://github.com/strongdm/strongdm-sdk-ruby-examples/tree/master/1_managing_resources)
	2. [Managing Accounts](https://github.com/strongdm/strongdm-sdk-ruby-examples/tree/master/2_managing_accounts)
	3. [Managing Roles](https://github.com/strongdm/strongdm-sdk-ruby-examples/tree/master/3_managing_roles)
	4. [Managing Gateways](https://github.com/strongdm/strongdm-sdk-ruby-examples/tree/master/4_managing_gateways)
   
## License

[Apache 2](https://github.com/strongdm/strongdm-sdk-ruby/blob/master/LICENSE)

## Contributing 

Currently, we are not accepting pull requests directly to this repository, but our users are some of the most resourceful and ambitious folks out there. So, if you have something to contribute, find a bug, or just want to give us some feedback, please email <support@strongdm.com>.