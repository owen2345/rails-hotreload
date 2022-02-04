# Hotreload

This gem adds hot reloading feature to Rails applications that contains hotwire. The application is automatically reloaded when:
- Any file has changed (added, updated or deleted) in `app/assets/builds`
- Any app view was changed (added, updated or deleted) in `app/views`

## Dependencies
- This Gem depends on (turbo-rails)[https://github.com/hotwired/turbo-rails] to automatically stream reload message when file changes were detected
- This Gem depends on (listen)[https://github.com/guard/listen] to detect file changes

## Installation
- Add this line to your application's Gemfile:
```ruby
group :development, :test do
  gem "hotreload"
end
```
- And then execute:
```bash
$ bundle
```
- Include this template in your layout
```ruby
= render '/hotreload/stream'
```

- Start the file watcher
```
bin/rails hotreload:start
```
Note: If your project is using Procfile.dev (Foreman), then you can add:
```
hotreload: bin/rails hotreload:start
```
- Start your rails application and 

## Configuration
- This gem by default is watching changes in: `app/assets/builds,app/views/`. This can be customized as the following: 
```
bin/rails hotreload:start app/javascripts,app/stylesheets,app/views/
```
- The hot reloader UI can be customized as the following:
```
= render '/hotreload/stream', custom_style: 'right: 20px; top: 20px;'
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/owen2345/pub_sub_model_sync. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.    
You can run the tests with: `docker-compose run test bash`

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## **Code of Conduct**

Everyone interacting in the PubSubModelSync project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/pub_sub_model_sync/blob/master/CODE_OF_CONDUCT.md).