# (Rails) Playground

Back-and-forths from your editor and your rails console is a thing of the past!

![playground-demo](https://user-images.githubusercontent.com/7149034/158045230-3129bf4e-8eeb-4096-9293-04a8c6003bed.gif)

## Features

### Query Editor

Inspired by the Go playground and SQL Server Management Studio (SSMS) Query Editor, `rails-playground` is a rails engine that eases experiments with your application domain.

### Script Management

The gem also comes with a script management tool to help share useful scripts with your teammates. Shared scripts stay close to the code and become more maintainable while personal scripts are git ignored and don't pollute the git history.

## Usage

### Query Editor

There are three ways to run ruby code in the console:

* Select your code in the editor and press cmd+Enter
* Put your cursor on any line (no selection) and press cmd+Enter
* Type your code straight in the terminal box just like in a rails console

### Script Management

Any files under `lib/playground` folder will appear in the sidebar. You can filter them by name from the search input.

See [Ignoring personal scripts](#ignoring-personal-scripts) to share scripts with your team while ignoring personal scripts.

## Installation

### Query Editor

Playground is built on top of `web-console` gem. Just like `web-console`, it's only meant to be used in development. Every `web-console` information still holds for `rails-playground`. Check `web-console` [repository for more information](https://github.com/rails/web-console)

Add this line to your application's Gemfile under the development group:

```ruby
group :development do
  gem "rails-playground", require: "playground"
end
```

_**Naming issue:** The gem was originally called `playground` but it already exists in RubyGems... Thus the gem is now called `rails-playground` but the functionality remains under the `playground` namespace for now._

And then execute:
```bash
$ bundle
```

Finally, mount the engine in your routes file and access the web playground at `/playground` on your localhost.

```ruby
Rails.application.routes.draw do
  mount Playground::Engine => "/playground" if Rails.env.development?
  # ...
end
```

_Nothing stops you from choosing any relative path. For example, you could switch from `/playground` to `/rails/play`._

### Ignoring personal scripts

Any changes made to ignored scripts won't be recorded in your git history.
Adding a folder from lib/playground in `.gitignore` will, however, still show in the sidebar.
**Decide on a convention** with your teammates and commit the path to your `.gitignore`.

**Example**

Here is an example of file structure

* scripts version controlled
  * lib/playground/shared_script_a.rb
  * lib/playground/shared_script_b.rb
  * lib/playground/namespace/shared_script_c.rb
* scripts ignored
  * lib/playground/my_scripts/my_script_a.rb
  * lib/playground/my_scripts/my_script_b.rb

```
.gitignore

/lib/playground/my_scripts/
```

```
my_app/
├─ app/
├─ bin/
├─ config/
├─ db/
├─ lib/
│  ├─ playground/
│  │  ├─ namespace/
│  │  │  ├─ shared_script_c.rb
│  │  ├─ my_scripts/
│  │  │  ├─ my_script_a.rb
│  │  │  ├─ my_script_b.rb
│  │  ├─ shared_script_a.rb
│  │  ├─ shared_script_b.rb
├─ .gitignore
```

## Troubleshooting

### Session :id is no longer available in memory.

Example:
```
Session e96248aec85b3006488c276b9468a4d8 is no longer available in memory.

If you happen to run on a multi-process server (like Unicorn or Puma) the process
this request hit doesn't store e96248aec85b3006488c276b9468a4d8 in memory. Consider turning the number of
processes/workers to one (1) or using a different server in development.
```

This is a known `web-console` error that happens when you run a multi-threaded server locally.
To solve this problem make sure to set the number of processes/worker to 1 on your local server.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
