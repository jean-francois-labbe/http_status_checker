
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "http_status_checker/version"

Gem::Specification.new do |spec|
  spec.name          = "http_status_checker"
  spec.version       = HttpStatusChecker::VERSION
  spec.authors       = ["Jean-Francois Labbe"]
  spec.email         = ["jefff35@gmail.com"]

  spec.summary       = %q{Performs http status check on configured urls}
  spec.description   = %q{Checks urls http status}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "vcr", "~> 3.0.3"
  spec.add_development_dependency "webmock", "~> 3.1.0"
  spec.add_dependency "faraday", "~> 0.13.1"
  spec.add_dependency "typhoeus", "~> 1.3.0"
end
