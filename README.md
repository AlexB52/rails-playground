# (Rails) Playground

Back-and-forths from your editor and your rails console is a thing of the past!

![CleanShot 2022-03-12 at 23 41 03](https://user-images.githubusercontent.com/7149034/158014859-47625c95-aa59-489a-9681-eb36e378dcba.gif)

Inspired by the Go playground and SQL Server Management Studio (SSMS) Query Editor, `rails-playground` is a rails engine that eases experiments with your application domain.

In addition to a web console, `rails-playground` comes with a script management feature to help your personal and team development. It allows you to:

* use and save gitignored scripts for personal use. 
* use and save version-controller scripts with your team. 

This way, shared scripts stay close to the code and more maintainable while your personal script do not pollute the git history.

## Usage

There are three ways to run ruby code in the console:

* Select your code in the editor and press cmd+Enter
* Put your cursor on any line (no selection) and press cmd+Enter
* Type your code straight in the terminal box just like in a rails console

## Installation

Playground is built on top of `web-console` gem. Just like `web-console`, it's only meant to be used in development. Every `web-console` information still holds true for `rails-playground`. Check `web-console` [repository for more information](https://github.com/rails/web-console)

Add this line to your application's Gemfile under the development group:

```ruby
group :development do
  gem "rails-playground", require: "playground"
end
```

_**Naming issue:** The gem was originally supposed to be called `playground` but it already exists in RubyGems... Thus the gem is now called `rails-playground` but the functionality remains under the `playground` namespace for now._

And then execute:
```bash
$ bundle
```

Finally mount the engine in your routes file and access the playground at `http://localhost:{PORT}/playground` on your local machine.

```ruby
Rails.application.routes.draw do
  mount Playground::Engine => "/playground"
  # ...
end
```

_You can choose any relative path and switch from `/playground` to `/rails/play` for example._

## Troubleshouting

### Session :id is no longer available in memory.

Example:
```
Session e96248aec85b3006488c276b9468a4d8 is no longer available in memory.

If you happen to run on a multi-process server (like Unicorn or Puma) the process
this request hit doesn't store e96248aec85b3006488c276b9468a4d8 in memory. Consider turning the number of
processes/workers to one (1) or using a different server in development.
```

This is a known `web-console` error which happened when you run a multi threaded server locally.
To solve this problem make sure to set the number of processes/worker to 1 on your local server.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
