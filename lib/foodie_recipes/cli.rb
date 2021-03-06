class FoodieRecipes::CLI

  def call
    puts "Welcome to Foodie Recipes, where you will find recipes to inspire your inner chef!"
    list_recipes
    puts ""
    menu
  end

  def list_recipes
    puts ""
    puts "The Best Foodie Recipes:"
    puts "------------------------"
    puts ""
    FoodieRecipes::Scraper.new.scrape_recipe_info
    @recipes = FoodieRecipes::Recipes.all
    @recipes.each.with_index(1) do |recipe, i|
      puts "#{i}. #{recipe.name}"
    end
  end

  def menu
    input = nil
    puts "Enter the number of the recipe you would like to cook, type recipes to see the list of recipes, or type exit:"
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @recipes.size
        the_recipe = @recipes[input.to_i - 1]
        puts ""
        puts "----------- #{the_recipe.name} -----------"
        puts "Recipe URL: #{the_recipe.url}"
        puts ""
        puts "Recipe Ingredients:"
        puts "-------------------"
        puts "#{the_recipe.ingredients}"
        puts ""
        puts "Recipe Instructions:"
        puts "--------------------"
        puts "#{the_recipe.instructions}"
        puts ""
        puts ""
        puts "Type recipes to return to the list of recipes, or type exit:"
        FoodieRecipes::Recipes.destroy_all
      elsif input == "recipes"
        list_recipes
        puts ""
        puts "Enter the number of the recipe you would like to cook, type recipes to see the list of recipes, or type exit:"
      elsif input == "exit"
        goodbye
      else
        puts "Not an available option. Type recipes to see the list of recipes, or type exit."
        FoodieRecipes::Recipes.destroy_all
      end
    end
  end

  def goodbye
    puts ""
    puts "Happy cooking!"
    puts ""
  end

end
