# coding: utf-8
Gem::Specification.new do |spec|
  spec.name = "infrataster-plugin-mongodb"
  spec.version = '0.2.0'
  spec.authors = ["Rahul Khengare"]
  spec.email = ["rahulk1306@gmail.com"]
  spec.summary = %q{Mongodb plugin for Infrataster}
  spec.description = %q{Plugin for Infrataster to test behavior of mongo database}
  spec.homepage = "https://github.com/rahulkhengare/infrataster-plugin-mongodb/"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/}) 
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "infrataster", "~> 0.3"
  spec.add_runtime_dependency "mongo", "~> 2.3.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
