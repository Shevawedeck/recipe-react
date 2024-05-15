-- SM Excellent! All good. See tips. And create database.

/*
Cuisine
    CuisineId pk
    CuisineType varchar unique

MeasurementType
    MeasurementTypeId
    MeasurementTypeName

Ingredient
    IngredientId pk
    IngredientName varchar unique
    Image as concat('Ingredient-', replace(IngredientName, ' ', '-'), '.jpg')

Direction
    DirectionId pk
    RecipeId fk
-- SM Name should be sequencenum
    Num int not null
-- SM Don't like the name "DirectionName", it's not a name column
    DirectionName varchar (150)

Recipe
-- SM Add user reference
    RecipeId pk
    RecipeName varchar unique
    Calories int
    DateDrafted date not null
    DatePublished date null
    DateArchived date null
-- SM Tip: Easiest way to do this is by doing nested case like: case when... then case when... else... end else... end. Like that you only check once each condition.
    Status as case when DatePublished is null and DateArchived is null then 'draft'
                    when DatePublished is not null and DateArchived is null then 'published'
                    else 'archived'
    Image as concat('Recipe-', replace(RecipeName, ' ', '-'), '.jpg')

Course
    CourseId
-- SM Name should be sequencenum
    Num int
    CourseType varchar

Meal
-- SM Add active column
    MealId
    MealName varchar unique
    DateCreated date
    Image as concat('Meal-', replace(MealName, ' ', '-'), '.jpg')

CookBook
    CookBookId
    CookBookName varchar unique
    Price decimal
-- SM Foreign key columns should come before other columns
    UserId fk
    IsActive bit
    DateCreated date
    Image as concat('CookBook-', replace(CookBookName, ' ', '-'), '.jpg')

User
    UserId
    LastName varchar(30)
    FirstName varchar(30)
    UserName varchar(60) unique

RecipeIngredient
    RecipeingredientId pk
    RecipeId fk not null
    IngredientId fk not null
    MeasurementTypeId fk null
    Amount int not null
-- SM Name should be sequencenum
    Num int not null 
    unique recipeId, ingredientId
    unique RecipeId, Num

MealCourse
    MealCourseId
    MealId
    CourseId
    unique mealId, courseId

MealCourseRecipe
    MealCourseRecipeId pk
    MealCourseId fk
    RecipeId fk
    IsMainDish bit 
    unique RecipeId, MealCourseId
    

    CookBookRecipe
    CookBookRecipeId pk
    CookBookId fk
    RecipeId fk
-- SM Name should be sequencenum
    Num int not null
    unique cookbookid, recipeid
    unique CookBookId, Num
*/
