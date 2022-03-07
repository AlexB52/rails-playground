require_relative "lib/playground/version"

Gem::Specification.new do |spec|
  spec.name        = "playground"
  spec.version     = Playground::VERSION
  spec.authors     = ["Alexandre Barret"]
  spec.email       = ["barret.alx@gmail.com"]
  spec.homepage    = "https://github.com/AlexB52/playground"
  spec.summary     = "A playground web console for Rails applications."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/AlexB52/playground"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.2.2"
  spec.add_dependency "web-console"
  spec.add_dependency "turbo-rails"
end
