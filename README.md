# strongDM SDK for Ruby

This is the official [strongDM](https://www.strongdm.com/) SDK for the Ruby programming language.

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
* Examples: [GitHub - strongdm/strongdm-sdk-ruby-examples](https://github.com/strongdm/strongdm-sdk-ruby-examples)

## License

[Apache 2](https://github.com/strongdm/strongdm-sdk-ruby/blob/master/LICENSE)

## Contributing 

Currently, strongDM does not accept pull requests for this repository. Please submit any feedback to <support@strongdm.com>.