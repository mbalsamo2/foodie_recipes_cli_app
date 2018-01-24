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
