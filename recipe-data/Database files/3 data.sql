-- SM Excellent! 100% But I would really love if you'd use CTE.
Use HeartyHearthDB
go
delete CookbookRecipe
delete MealCourseRecipe
delete MealCourse
delete RecipeIngredient
delete Cookbook
delete Meal
delete Course
delete Direction
delete Recipe
delete Username
delete Ingredient
delete MeasurementType
delete Cuisine

insert Cuisine(CuisineType)
select 'American'
union select 'French'
union select 'English'

insert MeasurementType(MeasurementTypeName)
select 'cup'
union select 'teaspoon'
union select 'tablespoon'
union select 'ounce' 
union select 'stick'
union select 'slice'
union select 'pinch'

insert Ingredient(IngredientName)
select 'butter'
union select 'egg'
union select 'flour'
union select 'sugar'
union select 'club bread'
union select 'shredded cheese'
union select 'garlic clove'
union select 'black pepper'
union select 'salt'
union select 'granny smith apples'
union select 'vanilla yogurt'
union select 'orange juice'
union select 'honey'
union select 'ice cube'
union select 'sour cream cheese'
union select 'whipped cream cheese'
union select 'baking powder'
union select 'avacado'
union select 'butter'
union select 'mozzerella cheese'
union select 'tomato'
union select 'whole wheat bread'
union select 'mango'
union select 'cucumber'
union select 'arugula'
union select 'chocolate chip'
union select 'baking soda'
union select 'baking powder'
union select 'oil'
union select 'vanilla sugar'
union select 'granny smith apple'
union select 'salt'
union select 'vanilla pudding'

insert Username(UsernameName, LastName, FirstName)
select 'maga', 'Wedeck', 'Diane'
union select 'eliyair', 'Wedeck', 'Eli'
union select 'ssuss', 'Sussman', 'Sara'
union select 'ctepfer', 'Tepfer', 'Chaya'

insert Recipe(UsernameId, CuisineId, RecipeName, Calories, DateDrafted, DatePublished, DateArchived)
select (select u.UsernameId from Username u where u.UsernameName = 'eliyair'), (select c.CuisineId from Cuisine c where c.CuisineType = 'English'), 'Arugula Salad', 100, '2/2/18', '3/3/18', null
union select (select u.UsernameId from Username u where u.UsernameName = 'maga'), (select c.CuisineId from Cuisine c where c.CuisineType = 'American'), 'Chocolate Chip Cookies', 300, '2/2/16', '3/3/17', null
union select (select u.UsernameId from Username u where u.UsernameName = 'ctepfer'), (select c.CuisineId from Cuisine c where c.CuisineType = 'English'), 'Apple Yogurt Smoothie', 100, '2/2/18', '3/3/18', null
union select (select u.UsernameId from Username u where u.UsernameName = 'ssuss'),  (select c.CuisineId from Cuisine c where c.CuisineType = 'French'), 'Cheese Bread', 200, '2/2/18', '3/3/18', null
union select (select u.UsernameId from Username u where u.UsernameName = 'maga'),  (select c.CuisineId from Cuisine c where c.CuisineType = 'English'), 'Butter Muffins', 300, '4/2/18', '7/3/18', null
union select (select u.UsernameId from Username u where u.UsernameName = 'ssuss'),  (select c.CuisineId from Cuisine c where c.CuisineType = 'American'), 'Cheese Omelet', 100, '1/2/18', '3/3/18', null
union select (select u.UsernameId from Username u where u.UsernameName = 'eliyair'),  (select c.CuisineId from Cuisine c where c.CuisineType = 'American'), 'Avacado Toast', 257, '1/2/17', '2/3/17', null
union select (select u.UsernameId from Username u where u.UsernameName = 'ssuss'),  (select c.CuisineId from Cuisine c where c.CuisineType = 'American'), 'Pargiyot', 100, '1/2/18', '3/3/18', '3/23/18'
union select (select u.UsernameId from Username u where u.UsernameName = 'ssuss'),  (select c.CuisineId from Cuisine c where c.CuisineType = 'American'), 'Lemon Pie', 100, '1/2/18', null, '3/23/19'
union select (select u.UsernameId from Username u where u.UsernameName = 'ctepfer'),  (select c.CuisineId from Cuisine c where c.CuisineType = 'American'), 'Apple Pie', 100, '1/2/16', null, null

insert Direction(RecipeId, SequenceNum, DirectionDesc)
select (select r.RecipeId from Recipe r where r.RecipeName = 'Arugula Salad'), 1, 'Dice all ingredients (except the arugula)'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Arugula Salad'), 2, 'Combine all ingredients'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 1, 'Combine sugar, oil and eggs in a bowl'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 2, 'Mix well'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 3, 'Add flour, vanilla sugar, baking powder and baking soda'  
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 4, 'Beat for 5 minutes'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 5, 'Add chocolate chips'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 6, 'Freeze for 1-2 hours'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 7, 'Roll into balls and place spread out on a cookie sheet'                 
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 8, 'Bake on 350 for 10 minutes'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 1, 'Peel and dice the apples'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 2, 'Combine all ingredients in bowl except for apples and ice cubes'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 3, 'Mix until smooth'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 4, 'Add apples and ice cubes'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 5, 'Pour into glasses'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 1, 'Slit bread every 3/4 inch'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 2, 'Combine all ingredients in bowl'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 3, 'fill slits with cheese mixture'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 4, 'wrap bread into a foil and bake for 30 minutes'                
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 1, 'Cream butter with sugars'  
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 2, 'Add eggs and mix well'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 3, 'Slowly add rest of ingredients and mix well'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 4, 'fill muffin pans 3/4 full and bake for 30 minutes'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Omelet'), 1, 'whip two eggs together in a bowl'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Omelet'), 2, 'heat skillet with butter'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Omelet'), 3, 'pour egg mixture into pan'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Omelet'), 4, 'add cheese when egg is mostly cooked'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Avacado Toast'), 1, 'toast the bread'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Avacado Toast'), 2, 'mash the avacado'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Avacado Toast'), 3, 'slice tomatoes'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Avacado Toast'), 4, 'spread avacado on the toast'
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Avacado Toast'), 5, 'put tomato slices on top'

insert Course(SequenceNum, CourseType)
select 1, 'appetizer'
union select 2, 'main course'
union select 3, 'dessert'

insert Meal(UsernameId, MealName, DateCreated, IsActive)
select (select u.UsernameId from Username u where u.UsernameName = 'ssuss'), 'Summer Brunch', '6/5/20', 1
union select (select u.UsernameId from Username u where u.UsernameName = 'ctepfer'), 'A Royal Lunch', '8/2/19', 1
union select (select u.UsernameId from Username u where u.UsernameName = 'maga'), 'Special Breakfast', '5/7/18', 1
union select (select u.UsernameId from Username u where u.UsernameName = 'eliyair'), 'Breakfast Bash', '5/4/20', 1

insert Cookbook(UsernameId, CookbookName, Price, IsActive, DateCreated)
select (select u.UsernameId from Username u where u.UsernameName = 'ctepfer'), 'Treats for Two', 30, 1, '5/12/23'
union select (select u.UsernameId from Username u where u.UsernameName = 'ssuss'), 'Meaningful Tastes', 20, 1, '5/12/23'
union select (select u.UsernameId from Username u where u.UsernameName = 'maga'), 'The Chef''s Go To', 30, 1, '5/12/23'
union select (select u.UsernameId from Username u where u.UsernameName = 'eliyair'), 'So Sweet', 30, 1, '5/12/23'

insert RecipeIngredient(RecipeId, IngredientId, MeasurementTypeId, Amount, SequenceNum)
select (select r.RecipeId from Recipe r where r.RecipeName = 'Arugula Salad'), (select i.IngredientId from Ingredient i where i.IngredientName = 'Arugula'), 
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'ounce'), 12, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Arugula Salad'), (select i.IngredientId from Ingredient i where i.IngredientName = 'Mango'),
    null, 1, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Arugula Salad'), (select i.IngredientId from Ingredient i where i.IngredientName = 'Cucumber'),
    null, 1, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Arugula Salad'), (select i.IngredientId from Ingredient i where i.IngredientName = 'avacado'),
    null, 0.5, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sugar'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'cup'), 1, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'oil'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'cup'), 0.5, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'egg'),
    null, 3, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'flour'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'cup'), 2, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'vanilla sugar'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'teaspoon'), 1, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'baking powder'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'teaspoon'), 2, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'baking soda'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'teaspoon'), 0.5, 7
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'chocolate chip'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'cup'), 1, 8
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), (select i.IngredientId from Ingredient i where i.IngredientName = 'granny smith apple'),
    null, 3, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), (select i.IngredientId from Ingredient i where i.IngredientName = 'vanilla yogurt'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'cup'), 1, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sugar'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'teaspoon'), 2, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), (select i.IngredientId from Ingredient i where i.IngredientName = 'orange juice'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'cup'), 0.5, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), (select i.IngredientId from Ingredient i where i.IngredientName = 'honey'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'tablespoon'), 2, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), (select i.IngredientId from Ingredient i where i.IngredientName = 'ice cube'),
    null, 5, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), (select i.IngredientId from Ingredient i where i.IngredientName = 'club bread'),
    null, 1, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), (select i.IngredientId from Ingredient i where i.IngredientName = 'butter'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'ounce'), 4, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), (select i.IngredientId from Ingredient i where i.IngredientName = 'shredded cheese'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'ounce'), 8, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), (select i.IngredientId from Ingredient i where i.IngredientName = 'garlic clove'),
    null, 2, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), (select i.IngredientId from Ingredient i where i.IngredientName = 'black pepper'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'teaspoon'), 0.25, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), (select i.IngredientId from Ingredient i where i.IngredientName = 'salt'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'pinch'), 1, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), (select i.IngredientId from Ingredient i where i.IngredientName = 'butter'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'stick'), 1, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sugar'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'cup'), 3, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), (select i.IngredientId from Ingredient i where i.IngredientName = 'vanilla pudding'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'tablespoon'), 2, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), (select i.IngredientId from Ingredient i where i.IngredientName = 'egg'),
    null, 4, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), (select i.IngredientId from Ingredient i where i.IngredientName = 'whipped cream cheese'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'ounce'), 8, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sour cream cheese'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'ounce'), 8, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), (select i.IngredientId from Ingredient i where i.IngredientName = 'flour'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'cup'), 1, 7
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), (select i.IngredientId from Ingredient i where i.IngredientName = 'baking powder'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'teaspoon'), 2, 8
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Omelet'), (select i.IngredientId from Ingredient i where i.IngredientName = 'egg'),
    null, 2, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Omelet'), (select i.IngredientId from Ingredient i where i.IngredientName = 'shredded cheese'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'cup'), 1, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Omelet'), (select i.IngredientId from Ingredient i where i.IngredientName = 'butter'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'ounce'), 1, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Avacado Toast'), (select i.IngredientId from Ingredient i where i.IngredientName = 'whole wheat bread'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'slice'), 2, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Avacado Toast'), (select i.IngredientId from Ingredient i where i.IngredientName = 'avacado'),
    null, 0.5, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Avacado Toast'), (select i.IngredientId from Ingredient i where i.IngredientName = 'tomato'),
    null, 0.5, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pargiyot'), (select i.IngredientId from Ingredient i where i.IngredientName = 'garlic clove'),
    null, 3, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pargiyot'), (select i.IngredientId from Ingredient i where i.IngredientName = 'black pepper'),
    (select m.MeasurementTypeId from MeasurementType m where m.MeasurementTypeName = 'teaspoon'), 0.25, 2

insert MealCourse(MealId, CourseId)
select (select m.MealId from Meal m where m.MealName = 'Summer Brunch'), (select c.CourseId from Course c where c.CourseType = 'appetizer')
union select (select m.MealId from Meal m where m.MealName = 'Summer Brunch'), (select c.CourseId from Course c where c.CourseType = 'main course')
union select (select m.MealId from Meal m where m.MealName = 'A Royal Lunch'), (select c.CourseId from Course c where c.CourseType = 'main course')
union select (select m.MealId from Meal m where m.MealName = 'A Royal Lunch'), (select c.CourseId from Course c where c.CourseType = 'appetizer')
union select (select m.MealId from Meal m where m.MealName = 'Special Breakfast'), (select c.CourseId from Course c where c.CourseType = 'main course')
union select (select m.MealId from Meal m where m.MealName = 'Special Breakfast'), (select c.CourseId from Course c where c.CourseType = 'appetizer')
union select (select m.MealId from Meal m where m.MealName = 'Breakfast Bash'), (select c.CourseId from Course c where c.CourseType = 'main course')
union select (select m.MealId from Meal m where m.MealName = 'Breakfast Bash'), (select c.CourseId from Course c where c.CourseType = 'appetizer')

insert MealCourseRecipe(MealCourseId, RecipeId, IsMainDish)
select (select mc.MealCourseId from MealCourse mc join Meal m on mc.MealId = m.MealId join Course c on c.CourseId = mc.CourseId where m.MealName = 'Summer Brunch' and c.CourseType = 'appetizer'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 1
union select (select mc.MealCourseId from MealCourse mc join Meal m on mc.MealId = m.MealId join Course c on c.CourseId = mc.CourseId where m.MealName = 'Summer Brunch' and c.CourseType = 'main course'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Arugula Salad'), 0
union select (select mc.MealCourseId from MealCourse mc join Meal m on mc.MealId = m.MealId join Course c on c.CourseId = mc.CourseId where m.MealName = 'Summer Brunch' and c.CourseType = 'main course'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Omelet'), 1
union select (select mc.MealCourseId from MealCourse mc join Meal m on mc.MealId = m.MealId join Course c on c.CourseId = mc.CourseId where m.MealName = 'A Royal Lunch' and c.CourseType = 'appetizer'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Avacado Toast'), 1
union select (select mc.MealCourseId from MealCourse mc join Meal m on mc.MealId = m.MealId join Course c on c.CourseId = mc.CourseId where m.MealName = 'A Royal Lunch' and c.CourseType = 'main course'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 1
union select (select mc.MealCourseId from MealCourse mc join Meal m on mc.MealId = m.MealId join Course c on c.CourseId = mc.CourseId where m.MealName = 'A Royal Lunch' and c.CourseType = 'main course'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Arugula Salad'), 0
union select (select mc.MealCourseId from MealCourse mc join Meal m on mc.MealId = m.MealId join Course c on c.CourseId = mc.CourseId where m.MealName = 'Breakfast Bash' and c.CourseType = 'appetizer'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 1 
union select (select mc.MealCourseId from MealCourse mc join Meal m on mc.MealId = m.MealId join Course c on c.CourseId = mc.CourseId where m.MealName = 'Breakfast Bash' and c.CourseType = 'main course'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 1 
union select (select mc.MealCourseId from MealCourse mc join Meal m on mc.MealId = m.MealId join Course c on c.CourseId = mc.CourseId where m.MealName = 'Breakfast Bash' and c.CourseType = 'main course'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 0
union select (select mc.MealCourseId from MealCourse mc join Meal m on mc.MealId = m.MealId join Course c on c.CourseId = mc.CourseId where m.MealName = 'Special Breakfast' and c.CourseType = 'appetizer'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 1
union select (select mc.MealCourseId from MealCourse mc join Meal m on mc.MealId = m.MealId join Course c on c.CourseId = mc.CourseId where m.MealName = 'Special Breakfast' and c.CourseType = 'main course'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Omelet'), 1
union select (select mc.MealCourseId from MealCourse mc join Meal m on mc.MealId = m.MealId join Course c on c.CourseId = mc.CourseId where m.MealName = 'Special Breakfast' and c.CourseType = 'main course'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 0

insert CookbookRecipe(CookbookId, RecipeId, SequenceNum)
select (select CookbookId from Cookbook c where c.CookbookName = 'So Sweet'), (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 1
union select (select CookbookId from Cookbook c where c.CookbookName = 'So Sweet'), (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 2
union select (select CookbookId from Cookbook c where c.CookbookName = 'So Sweet'), (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 3
union select (select CookbookId from Cookbook c where c.CookbookName = 'Treats for Two'), (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 1
union select (select CookbookId from Cookbook c where c.CookbookName = 'Treats for Two'), (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 2
union select (select CookbookId from Cookbook c where c.CookbookName = 'Treats for Two'), (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 3
union select (select CookbookId from Cookbook c where c.CookbookName = 'Treats for Two'), (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 4
union select (select CookbookId from Cookbook c where c.CookbookName = 'The Chef''s Go To'), (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 1
union select (select CookbookId from Cookbook c where c.CookbookName = 'The Chef''s Go To'), (select r.RecipeId from Recipe r where r.RecipeName = 'Arugula Salad'), 2
union select (select CookbookId from Cookbook c where c.CookbookName = 'The Chef''s Go To'), (select r.RecipeId from Recipe r where r.RecipeName = 'Avacado Toast'), 3
union select (select CookbookId from Cookbook c where c.CookbookName = 'The Chef''s Go To'), (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Omelet'), 4
union select (select CookbookId from Cookbook c where c.CookbookName = 'Meaningful Tastes'), (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 1
union select (select CookbookId from Cookbook c where c.CookbookName = 'Meaningful Tastes'), (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 2
union select (select CookbookId from Cookbook c where c.CookbookName = 'Meaningful Tastes'), (select r.RecipeId from Recipe r where r.RecipeName = 'Arugula Salad'), 3
union select (select CookbookId from Cookbook c where c.CookbookName = 'Meaningful Tastes'), (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 4