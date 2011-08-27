require "rake/gempackagetask"

spec = Gem::Specification.new do |s| 
  s.name = "lstrip-on-steroids"
  s.version = "0.9.5"
  s.authors = ["Caius Durling", "Ash Moran"]
  s.email = %w[dev@caius.name ash.moran@patchspace.co.uk]
  s.homepage = "http://github.com/caius/lstrip-on-steroids"
  s.platform = Gem::Platform::RUBY
  s.summary = "Intelligently strips leading whitespace from a multiline string"
  s.files = FileList["lib/**/*.rb", "spec/**/*.rb", "[A-Z]*"].to_a
  s.has_rdoc = false
end
 
Rake::GemPackageTask.new(spec) do |pkg| 
  pkg.need_tar = true 
end 
