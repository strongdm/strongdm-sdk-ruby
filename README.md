# strongDM SDK for Ruby

The official strongDM SDK for the Ruby programming language.

## Quick Start

First, install the gem:

```bash
$ gem install strongdm
```

Next, go to https://app.strongdm.com and create an API key. Set the `SDM_API_ACCESS_KEY` and `SDM_API_SECRET_KEY` environment variables.

```bash
$ export SDM_API_ACCESS_KEY=<YOUR ACCESS KEY>
$ export SDM_API_SECRET_KEY=<YOUR SECRET KEY>
```

Run some example code.

```ruby
require "strongdm"

client = SDM::Client.new(ENV['SDM_API_ACCESS_KEY'], ENV['SDM_API_SECRET_KEY'])
users = client.accounts.list('')
users.each do |user|
	p user
end
```