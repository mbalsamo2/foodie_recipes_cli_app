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
    @recipes = FoodieRecipes::Recipes.scrape_recipes
    puts "1. #{@recipes.name}"
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the recipe you would like to cook, type recipes to see the list of recipes, or type exit:"
      input = gets.strip.downcase

      if input.to_i == 1
        puts ""
        puts "----------- #{@recipes.name} -----------"
        puts "Recipe URL: #{@recipes.url}"
        puts ""
        puts "Recipe Ingredients:"
        puts "#{@recipes.ingredients}"
        puts ""
        puts "Recipe Instructions:"
        puts "#{@recipes.instructions}"
        puts ""
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
