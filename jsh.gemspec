require File.expand_path("../lib/jsh/version", __FILE__)

Gem::Specification.new "jsh", JSH::VERSION do |s|
  s.description = "Interactive shell for JavaScript which is written in Ruby."
  s.summary     = "Interactive shell for JavaScript"
  s.author      = "namusyaka"
  s.email       = "namusyaka@gmail.com"
  s.homepage    = "https://github.com/namusyaka/jsh"
  s.executables = ["jsh"]
  s.files       = `git ls-files`.split("\n") - %w(.gitignore)
  s.test_files  = s.files.select { |path| path =~ /^spec\/.*_spec\.rb/ }
  s.license     = "MIT"

  s.add_dependency "therubyracer"
end
