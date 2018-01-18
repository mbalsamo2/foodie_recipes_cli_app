class FoodieRecipes::Recipes
  attr_accessor :name, :ingredients, :instructions, :url

  def self.all
    puts <<-DOC
    1. Food A
    2. Food B
    3. Food C
    DOC

    doc = Nokogiri::HTML(open("https://www.browneyedbaker.com/category/recipes/main-dish-recipes/chicken-recipes/"))
    binding.pry
    doc.css("div.archive-post").each do |recipe|
      name = css("h4").text
      url = css("a").attribute("href").value
    end

    recipe_1 = self.new
    recipe_1.name = "Crispy Baked Chicken Wings"
    recipe_1.ingredients = "list of stuff"
    recipe_1.instructions = "list of directions"
    recipe_1.url = "url"

  end

  def self.scrape_recipes

  end

end
