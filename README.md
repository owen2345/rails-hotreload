# RailsHotreload

This gem adds hot reloading feature to Rails applications that contains hotwire. The application is automatically reloaded when:
- Any file has changed (added, updated or deleted) in `app/assets/builds`
- Any app view has changed (added, updated or deleted) in `app/views`

## Dependencies
- This Gem depends on (turbo-rails)[https://github.com/hotwired/turbo-rails] to automatically stream reload message when file changes were detected
- This Gem depends on (listen)[https://github.com/guard/listen] to detect file changes

## Installation
- Add this line to your application's Gemfile:
```ruby
group :development do
  gem "rails_hotreload"
end
```
- And then execute:
```bash
$ bundle install
```
- Include this template in your layout
```ruby
= render '/rails_hotreload/stream' if Rails.env.development?
```

- Start the file watcher (Rake task)
```
bin/rails rails_hotreload:start
```
Note: If your project is using Procfile.dev (Foreman), then you can add:
```
rails_hotreload: bin/rails rails_hotreload:start
```
- Start your rails application and try editing your views or stylesheets or js files to see immediate changes in your browser

## Configuration
- Make sure your Turbo settings are well configured. See https://github.com/hotwired/turbo-rails#installation (Specially #4)
- This gem by default is watching changes in: `app/assets/builds,app/views/`. This can be customized as the following: 
```
bin/rails rails_hotreload:start app/javascripts,app/stylesheets,app/views/
```
- The hot reloader UI can be customized as the following:
```
= render '/rails_hotreload/stream', custom_style: 'left: 20px; bottom: 20px;'
```

## Contributing
Bug reports and pull requests are welcome on https://github.com/owen2345/rails-hotreload. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.    

To ensure your contribution changes, run the tests with: `docker-compose run test`

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
