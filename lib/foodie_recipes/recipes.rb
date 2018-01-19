class FoodieRecipes::Recipes
  attr_accessor :name, :ingredients, :instructions, :url

  def self.all
    puts <<-DOC
    1. Food A
    2. Food B
    3. Food C
    DOC

    links = doc.css("div.archive-post a").map do |i|
      i.attribute("href").value
    end

    links.map do |recipe_url|
      recipe_info = Nokogiri::HTML(open("#{recipe_url}"))
      binding.pry
        # recipe_info.each do |details|

          details.css("div.recipe div.ingredients ul").text
          details.css("div.instructions").text
        # end
    end

    # recipe_1 = self.new
    # recipe_1.name = "Crispy Baked Chicken Wings"
    # recipe_1.ingredients = "list of stuff"
    # recipe_1.instructions = "list of directions"
    # recipe_1.url = "url"
  end

  def self.scrape_recipes
    doc = Nokogiri::HTML(open("https://www.browneyedbaker.com/category/recipes/main-dish-recipes/chicken-recipes/"))

    recipe = self.new

    doc.css("div.archive-post").each do |recipe|
        recipes.name = recipe.css("h4").text
        recipes.url = recipe.css("a").attribute("href").value
    end

    links = doc.css("div.archive-post a").map do |i|
      i.attribute("href").value
    end

    links.map do |recipe_url|
      recipe_info = Nokogiri::HTML(open("#{recipe_url}"))
        recipes.ingredients = details.css("div.recipe div.ingredients ul").text
        recipes.instructions = details.css("div.instructions").text
    end
  end

  def self.scrape_recipe_details

    doc = Nokogiri::HTML(open("https://www.browneyedbaker.com/category/recipes/main-dish-recipes/chicken-recipes/"))
    links = doc.css("div.archive-post a").map do |i|
      i.attribute("href").value
    end

    links.map do |recipe_url|
      recipe_info = Nokogiri::HTML(open("#{recipe_url}"))
        recipe_info.each do |details|
          details.css("div.recipe div.ingredients ul").text
          details.css("div.instructions").text
        end
    end
    # recipe_info.css("div.recipe div.ingredients ul").text.split(" ,")
    # recipe_info.css("div.instructions").text.split(" ,")
  end

end
