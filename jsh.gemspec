require File.expand_path("../lib/jsh/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "jsh"
  gem.version       = JSH::VERSION
  gem.description   = "Interactive shell for JavaScript which is written in Ruby."
  gem.summary       = "Interactive shell for JavaScript"
  gem.author        = "namusyaka"
  gem.email         = "namusyaka@gmail.com"
  gem.homepage      = "https://github.com/namusyaka/jsh"
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.license       = "MIT"

  gem.add_dependency "therubyracer"
  gem.add_development_dependency "rspec"
end
