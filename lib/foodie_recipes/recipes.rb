class FoodieRecipes::Recipes
  attr_accessor :name, :ingredients, :instructions, :url

  def self.all
    puts <<-DOC
    1. Food A
    2. Food B
    3. Food C
    DOC

    recipe_1 = self.new
    recipe_1.name = "Crispy Baked Chicken Wings"
    recipe_1.ingredients = "list of stuff"
    recipe_1.instructions = "list of directions"
    recipe_1.url = "url"
  end

  def self.scrape_recipes
    recipes = []
    doc = Nokogiri::HTML(open("https://www.browneyedbaker.com/category/recipes/main-dish-recipes/chicken-recipes/"))
    doc.css("div.archive-post").each do |recipe|
      name = css("h4").text
      url = css("a").attribute("href").value
    end
  end

  def self.scrape_recipe_details

    doc = Nokogiri::HTML(open("https://www.browneyedbaker.com/category/recipes/main-dish-recipes/chicken-recipes/"))
    links = doc.css("div.archive-post a").map do |i|
      i.attribute("href").value
    end

    links.map do |recipe_url|
      recipe_info = Nokogiri::HTML(open("#{recipe_url}"))
      recipe_info.css("div.recipe div.ingredients ul").text.split(" ,")
      recipe_info.css("div.instructions").text.split(" ,")
    end

  end

end
