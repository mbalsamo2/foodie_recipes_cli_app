class FoodieRecipes::CLI

  def call
    puts "Welcome to Foodie Recipes, where you will find recipes to inspire your inner chef!"
    list_recipes
    puts ""
    menu
  end

  def list_recipes
    puts "The Best Foodie Recipes:"
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

      if input.to_i > 0 && input.to_i < 13
        the_recipe = @recipes[input.to_i - 1]
        puts ""
        puts "----------- #{the_recipe.name} -----------"
        puts "Recipe URL: #{the_recipe.url}"
        puts ""
        puts "Recipe Ingredients:"
        puts "#{the_recipe.ingredients}"
        puts ""
        puts "Recipe Instructions:"
        puts "#{the_recipe.instructions}"
        puts ""
        puts ""
        puts "Type recipes to return to the list of recipes, or type exit:"
        FoodieRecipes::Recipes.destroy_all
      elsif input == "recipes"
        list_recipes
      elsif input == "exit"
        goodbye
      else
        puts "Not an available option. Try again."
      end
    end
  end

  def goodbye
    puts ""
    puts "Happy cooking!"
    puts ""
  end

end


# last working

# class FoodieRecipes::CLI
#
#   def call
#     puts "Welcome to Foodie Recipes, where you will find recipes to inspire your inner chef!"
#     list_recipes
#     puts ""
#     menu
#   end
#
#   def list_recipes
#     puts "The Best Foodie Recipes:"
#     puts ""
#     @recipes = FoodieRecipes::Recipes.scrape_recipes
#     @recipes.each.with_index(1) do |recipe, i|
#       puts "#{i}. #{recipe.name}"
#     end
#
#   end
#
#   def menu
#     input = nil
#     while input != "exit"
#       puts "Enter the number of the recipe you would like to cook, type recipes to see the list of recipes, or type exit:"
#       input = gets.strip.downcase
#
#       if input.to_i > 0
#         the_recipe = @recipes[input.to_i - 1]
#         puts ""
#         puts "----------- #{the_recipe.name} -----------"
#         puts "Recipe URL: #{the_recipe.url}"
#         puts "Recipe Ingredients: #{the_recipe.ingredients}"
#         puts "Recipe Instructions: #{the_recipe.instructions}"
#         puts ""
#       elsif input == "recipes"
#         list_recipes
#       elsif input == "exit"
#         goodbye
#       else
#         puts "Not an available option. Try again."
#       end
#     end
#   end
#
#   def goodbye
#     puts ""
#     puts "Happy cooking!"
#     puts ""
#   end
#
# end
