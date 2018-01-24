class FoodieRecipes::Scraper

  def get_website
    Nokogiri::HTML(open("https://www.browneyedbaker.com/category/recipes/main-dish-recipes/chicken-recipes/"))
  end

  def scrape_recipe_index
    self.get_website.css("div.archive-post")[0..11]
  end

  def scrape_recipe_info
    scrape_recipe_index.each do |recipe|
      FoodieRecipes::Recipes.new_from_scraper(recipe)
    end
  end

end

# recipe_info = Nokogiri::HTML(open("#{url}"))
# each_ingredients = recipe_info.css("li.ingredient").map { |ingr| ingr.text}
# new_ingr = each_ingredients.join("\n")
# ingredients = new_ingr
# instructions = recipe_info.css("div.instructions").text
