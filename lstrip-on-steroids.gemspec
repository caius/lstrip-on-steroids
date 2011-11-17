# -*- encoding: utf-8 -*-
require File.expand_path("../lib/lstrip_on_steroids/version", __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Caius Durling", "Ash Moran"]
  gem.email         = %w[dev@caius.name ash.moran@patchspace.co.uk]
  gem.description   = %q{Sane indent-aware multiline strings}
  gem.summary       = "Intelligently strips leading whitespace from a multiline string"
  gem.homepage      = "http://github.com/caius/lstrip-on-steroids"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "lstrip-on-steroids"
  gem.require_paths = ["lib"]
  gem.version       = LStripOnSteroids::VERSION
  gem.has_rdoc      = false
end
