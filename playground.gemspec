require_relative "lib/playground/version"

Gem::Specification.new do |spec|
  spec.name        = "rails-playground"
  spec.version     = Playground::VERSION
  spec.authors     = ["Alexandre Barret"]
  spec.email       = ["barret.alx@gmail.com"]
  spec.homepage    = "https://github.com/AlexB52/rails-playground"
  spec.summary     = "A local playground for Rails applications."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/AlexB52/rails-playground"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "web-console"
  spec.add_dependency "turbo-rails"
end
