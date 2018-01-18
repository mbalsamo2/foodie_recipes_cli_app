class FoodieRecipes::CLI

  def call
    puts "Welcome to Foodie Recipes, where you will find recipes to inspire your inner chef!"
    puts "The Best Foodie Recipes:"
    list_recipes
    menu
  end

  def list_recipes
    puts <<-DOC
    1. Food A
    2. Food B
    3. Food C
    DOC
  end

  def menu
    puts "Enter the number or name of the recipe you would like to cook:"
    input = gets.strip

    case input
    when "1"
      puts "Food A Ingredients and Instructions:"
    when "2"
      puts "Food B Ingredients and Instructions:"
    when "3"
      puts "Food A Ingredients and Instructions:"
    end
  end

end
