class FoodieRecipes::Recipes
  attr_accessor :name, :ingredients, :instructions, :url

  def self.scrape_recipes
    recipes = []

    recipes << self.scrape_recipe_info

    recipes
  end

  def self.scrape_recipe_info
    doc = Nokogiri::HTML(open("https://www.browneyedbaker.com/category/recipes/main-dish-recipes/chicken-recipes/"))

    recipe = self.new

    recipe_attr = doc.css("div.archive-post").first

        recipe.name = recipe_attr.css("h4").text
        recipe.url = recipe_attr.css("a").attribute("href").value

    recipe_info = Nokogiri::HTML(open("#{recipe.url}"))


    ingredients = recipe_info.css("li.ingredient").map { |ingr| ingr.text}
    new_ingr = ingredients.join("\n")
    recipe.ingredients = new_ingr
    recipe.instructions = recipe_info.css("div.instructions").text

    binding.pry
    recipe
  end

end


# def self.scrape_recipe_info
#   doc = Nokogiri::HTML(open("https://www.browneyedbaker.com/category/recipes/main-dish-recipes/chicken-recipes/"))
#
#   recipe = self.new
#
#   doc.css("div.archive-post").each do |recipe_attr|
#
#       recipe.name = recipe_attr.css("h4").text
#       recipe.url = recipe_attr.css("a").attribute("href").value
#   end
#
#   recipe_info = Nokogiri::HTML(open("#{recipe.url}"))
#   # binding.pry
#   recipe.ingredients = recipe_info.css("div.recipe div.ingredients ul").text.scan(/[^\d]*\d/)
#   recipe.instructions = recipe_info.css("div.instructions").text
#
#   # links = doc.css("div.archive-post a").map do |i|
#   #   i.attribute("href").value
#   # end
#   #
#   # links.each do |recipe_url|
#   #   # binding.pry
#   #   recipe_info = Nokogiri::HTML(open("#{recipe_url}"))
#   #     recipe.ingredients = recipe_info.css("div.recipe div.ingredients ul").text.scan(/[^\d]*\d/)
#   #     recipe.instructions = recipe_info.css("div.instructions").text
#   # end
#   recipe
# end
