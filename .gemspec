
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "foodie_recipes/version"

Gem::Specification.new do |spec|
  spec.name          = "foodie_recipes_cli_app"
  spec.version       = FoodieRecipes::VERSION
  spec.authors       = ["'Maria Balsamo'"]
  spec.email         = ["'mia.balsamo@gmail.com'"]

  spec.summary       = %q{Recipes to make}
  spec.description   = %q{Recipes to make}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
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


  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
