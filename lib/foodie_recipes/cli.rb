class FoodieRecipes::CLI

  def call
    puts "Welcome to Foodie Recipes, where you will find recipes to inspire your inner chef!"
    list_recipes
    menu
  end

  def list_recipes
    puts "The Best Foodie Recipes:"
    @recipes = FoodieRecipes::Recipes.all

  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number or name of the recipe you would like to cook, type recipes to see the list of recipes, or type exit:"
      input = gets.strip.downcase

      # if input.to_i > 0
      #   puts @recipes[input.to_i - 1]
      # elsif input == "recipes"
      #   list_recipes
      # else
      #   puts "Not an available option. Try again."
      # end
      case input
      when "1"
        puts "Food A instructions and ingredients:"
      when "2"
        puts "Food B instructions and ingredients:"
      when "3"
        puts "Food C instructions and ingredients:"
      when "recipes"
        list_recipes
      when "exit"
        goodbye
      else
        puts "Not an available option. Try again."
      end
    end
  end

  def goodbye
    puts "Happy cooking!"
  end

end
