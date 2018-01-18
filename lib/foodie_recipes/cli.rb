class FoodieRecipes::CLI

  def call
    puts "Welcome to Foodie Recipes, where you will find recipes to inspire your inner chef!"
    puts "The Best Foodie Recipes:"
    list_recipes
    menu
    goodbye
  end

  def list_recipes
    @recipes = FoodieRecipes::Recipes.all
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number or name of the recipe you would like to cook, type recipes to see the list of recipes, or type exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Food A Ingredients and Instructions:"
      when "2"
        puts "Food B Ingredients and Instructions:"
      when "3"
        puts "Food A Ingredients and Instructions:"
      when "recipes"
        list_recipes
      else
        puts "Not an available option. Try again."
      end
    end
  end

  def goodbye
    puts "Happy cooking!"
  end

end
