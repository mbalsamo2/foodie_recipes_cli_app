class FoodieRecipes::Recipes
  attr_accessor :name, :ingredients, :instructions, :url

  @@all = []

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.new_from_scraper(recipe)
    self.new(recipe.css("h4").text, recipe.css("a").attribute("href").value)
  end

  def self.all
    @@all
  end

  def ingredients
    @ingredients ||= self.ingredient_info
  end

  def instructions
    @instructions ||= doc.css("div.instructions").text
  end

  def ingredient_info
    ingredients = doc.css("li.ingredient").map { |ingr| ingr.text}
    new_ingr = ingredients.join("\n")
    new_ingr
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def self.destroy_all
    @@all.clear
  end
end
