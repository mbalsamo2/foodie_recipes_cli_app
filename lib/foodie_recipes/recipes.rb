class FoodieRecipes::Recipes
  attr_accessor :name, :ingredients, :instructions, :url

  def self.all
    puts <<-DOC
    1. Food A
    2. Food B
    3. Food C
    DOC
    # recipe_1 = self.new
    # recipe_1.name = "Crispy Baked Chicken Wings"
    # recipe_1.ingredients = "list of stuff"
    # recipe_1.instructions = "list of directions"
    # recipe_1.url = "url"
  end

  def self.scrape_recipes
    recipes = []

    recipes << self.scrape_recipe_info

    recipes
  end

  def self.scrape_recipe_info
    doc = Nokogiri::HTML(open("https://www.browneyedbaker.com/category/recipes/main-dish-recipes/chicken-recipes/"))

    recipe = self.new

    doc.css("div.archive-post").each do |recipe_attr|
        recipe.name = recipe_attr.css("h4").text
        recipe.url = recipe_attr.css("a").attribute("href").value
    end

    links = doc.css("div.archive-post a").map do |i|
      i.attribute("href").value
    end

    links.map do |recipe_url|
      recipe_info = Nokogiri::HTML(open("#{recipe_url}"))
        recipe.ingredients = recipe_info.css("div.recipe div.ingredients ul").text
        recipe.instructions = recipe_info.css("div.instructions").text
    end
    recipe
  end

end
