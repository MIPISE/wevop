# Wevop
-------------
_**SUMMARY**_
* [Configuration](https://github.com/MIPISE/wevop#configuration)
-------------
## Configuration
```rb
require "wevop"

Wevop.configuration do |conf|
  conf.url_api = "url_api"
  conf.api_key = "secret api_key"
  conf.client_id = "client_id"
  conf.authorization_url = "authorization_server_url"
end
```

## Development
To run all tests :
`bundle exec rake test`
