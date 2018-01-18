
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

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
