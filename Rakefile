require "rake/gempackagetask"

spec = Gem::Specification.new do |s| 
  s.name = "lstrip-on-steroids"
  s.version = "0.1"
  s.author = "Caius Durling"
  s.email = "dev@caius.name"
  s.homepage = "http://github.com/caius/lstrip-on-steroids"
  s.platform = Gem::Platform::RUBY
  s.summary = "Intelligently strips leading whitespace from a multiline string"
  s.files = FileList["lib/**/*.rb", "[A-Z]*"].to_a
  s.has_rdoc = false
end
 
Rake::GemPackageTask.new(spec) do |pkg| 
  pkg.need_tar = true 
end 
