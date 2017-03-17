# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rae_stringer/version'

Gem::Specification.new do |spec|
  spec.name          = "rae_stringer"
  spec.version       = Stringer::VERSION
  spec.authors       = ["rae_rudie"]
  spec.email         = ["rae.rudie@gmail.com"]

  spec.summary       = %q{This is a simple gem to help extend the functionality of strings}
  spec.description   = %q{How much more can one say about strings?}
  spec.homepage      = "https://github.com/rudietuesdays/gem_demo"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  # gem "rae_stringer", :git => "git://github.com/oscarvazquez/rae_stringer.git"
end
