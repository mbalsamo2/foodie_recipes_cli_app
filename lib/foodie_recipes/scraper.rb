class FoodieRecipes::Scraper

  def get_website
    Nokogiri::HTML(open("https://www.browneyedbaker.com/category/recipes/main-dish-recipes/chicken-recipes/"))
  end

  def scrape_the_recipes
    self.get_website.css("div.archive-post")
  end

  def create_recipes
    scrape_the_recipes.each do |recipe|
      #initialize recipe within recipe.rb
    end
  end

end
