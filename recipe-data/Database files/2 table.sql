-- SM Excellent! Really good! 100% See comments, no need to resubmit.
use HeartyHearthDB
go
drop table if exists CookbookRecipe
drop table if exists MealCourseRecipe
drop table if exists MealCourse
drop table if exists RecipeIngredient
drop table if exists CookBook
drop table if exists Meal
drop table if exists Course
drop table if exists Direction
drop table if exists Recipe
drop table if exists Username
drop table if exists Ingredient
drop table if exists MeasurementType
drop table if exists Cuisine
go

create table dbo.Cuisine(
    CuisineId int not null identity primary key,
    CuisineType varchar(50) not null 
        constraint u_Cuisine_type unique 
        constraint ck_Cuisine_type_cannot_be_blank check(CuisineType <> '')
)

create table dbo.MeasurementType(
    MeasurementTypeId int not null identity primary key,
    MeasurementTypeName varchar(20) not null 
        constraint u_Measurement_Type_name unique 
        constraint ck_Measurement_Type_name_cannot_be_blank check(MeasurementTypeName <> '')
)

create table dbo.Ingredient(
    IngredientId int not null identity primary key,
    IngredientName varchar(50) not null 
        constraint u_Ingredient_name unique 
        constraint ck_Ingredient_name_cannot_be_blank check(IngredientName <> ''),
    IngredientImage as concat('Ingredient_', replace(IngredientName, ' ', '_'), '.jpg') persisted
)

-- SM Table name should be "users" or "staff" because column "UsernameName" is a bit...
create table dbo.Username(
    UsernameId int not null identity primary key,
    UsernameName varchar(60) not null 
        constraint u_Username_name unique 
        constraint ck_Username_name_cannot_be_blank check(UsernameName <> ''),
    LastName varchar(30) not null constraint ck_Username_last_name_cannot_be_blank check(LastName <> ''),
    FirstName varchar(30) not null constraint ck_Username_first_name_cannot_be_blank check(FirstName <> '')
)

create table dbo.Recipe(
    RecipeId int not null identity primary key,
    UsernameId int not null constraint f_Recipe_user_id foreign key references Username(UsernameId),
    CuisineId int not null constraint f_Recipe_cuisine_id foreign key references Cuisine(CuisineId),
    RecipeName varchar(70) not null 
        constraint u_Recipe_name unique 
        constraint ck_Recipe_name_cannot_be_blank check(RecipeName <> ''),
    Calories int not null 
        constraint ck_Recipe_calories_must_be_greater_then_zero check(Calories > 0),
    DateDrafted date not null default convert(date, getdate()),
         constraint ck_Recipe_date_drafted_must_be_after_1950 check(year(DateDrafted) > 1950), 
    DatePublished date null,
    DateArchived date null,
    RecipeStatus as case when DatePublished is null and DateArchived is null then 'drafted'
                    when DatePublished is not null and DateArchived is null then 'published'
                    else 'archived'
                    end,
    RecipeImage as concat('Recipe_', replace(RecipeName, ' ', '_'), '.jpg'),
    constraint ck_Recipe_date_archived_must_be_after_date_drafted check(DateArchived >= DateDrafted),
    constraint ck_Recipe_date_published_must_be_after_date_drafted check(DatePublished >= DateDrafted),
    constraint ck_Recipe_date_published_must_be_before_date_archived check(DatePublished <= DateArchived)
)

create table dbo.Direction(
    DirectionId int not null identity primary key,
    RecipeId int not null constraint f_Direction_recipe_id foreign key references Recipe(RecipeId),
    SequenceNum int not null constraint ck_Direction_sequence_num_must_be_greater_than_zero check(SequenceNum > 0),
    DirectionDesc varchar(500) not null constraint ck_Direction_desc_cannot_be_blank check(DirectionDesc <> ''), 
    constraint u_SequenceNum_RecipeId unique(RecipeId, SequenceNum)
)

create table dbo.Course(
    CourseId int not null identity primary key,
    SequenceNum int not null 
        constraint ck_Course_sequence_num_must_be_greater_than_zero check(SequenceNum > 0)
        constraint u_Course_sequencenum unique,
    CourseType varchar(20) not null 
        constraint ck_Course_type_cannot_be_blank check(CourseType <> '') 
        constraint u_Course_type unique
)

create table dbo.Meal(
    MealId int not null identity primary key,
    UsernameId int not null constraint f_Meal_user_id foreign key references Username(UsernameId),
    MealName varchar(70) not null 
        constraint ck_Meal_name_cannot_be_blank check(MealName <> '') 
        constraint u_Meal_name unique,
    DateCreated date not null constraint ck_Meal_date_created_must_be_after_1950_and_cannot_be_a_future_date check(year(DateCreated) between 1950 and getdate()),
    IsActive bit not null default 1,
    MealImage as concat('Meal_', replace(MealName, ' ', '_'), '.jpg')
)

create table dbo.Cookbook(
    CookbookId int not null identity primary key,
    UsernameId int not null constraint f_Cookbook_user_id foreign key references Username(UsernameId),
    CookbookName varchar(90) 
        constraint u_Cookbook_name unique 
        constraint ck_Cookbook_name_cannot_be_blank check(CookbookName <> ''),
    Price decimal(6,2) not null constraint ck_Cookbook_price_cannot_be_negative check(Price >= 0),
    IsActive bit not null default 1,
    DateCreated date constraint ck_Cookbook_date_created_must_be_after_1950_and_cannot_be_a_future_date check(year(DateCreated) between 1950 and getdate() ),
    CookbookImage as concat('CookBook_', replace(CookbookName, ' ', '_'), '.jpg')
)

create table dbo.RecipeIngredient(
    RecipeIngredientId int not null identity primary key,
    RecipeId int not null constraint f_RecipeIngredient_recipe_id foreign key references Recipe(RecipeId),
    IngredientId int not null constraint f_RecipeIngredient_ingredient_id foreign key references Ingredient(IngredientId),
    MeasurementTypeId int null constraint f_RecipeIngredient_measurement_type_id foreign key references MeasurementType(MeasurementTypeId),
    Amount decimal(4,2) not null constraint ck_Recipe_Ingredient_amount_must_be_greater_than_zero check(Amount > 0),
    SequenceNum int not null constraint ck_RecipeIngredient_sequence_num_must_be_greater_than_zero check(SequenceNum > 0),
    constraint u_RecipeIngredient_recipeId_ingredientId unique(RecipeId, IngredientId), 
    constraint u_RecipeIngredient_recipeId_sequencenum unique(RecipeId, SequenceNum)
)

create table dbo.MealCourse(
    MealCourseId int not null identity primary key,
    MealId int not null constraint f_MealCourse_meal_id foreign key references Meal(MealId),
    CourseId int not null constraint f_MealCourse_course_id foreign key references Course(CourseId),
    constraint u_MealCourse_mealId_courseId unique(MealId, CourseId)
)
  
create table dbo.MealCourseRecipe(
    MealCourseRecipeId int not null identity primary key,
    MealCourseId int not null constraint f_MealCourseRecipe_meal_course_id foreign key references MealCourse(MealCourseId),
    RecipeId int not null constraint f_MealCourseRecipe_recipe_id foreign key references Recipe(RecipeId),
    IsMainDish bit not null, 
    constraint u_MealCourseRecipe_recipeId_mealcourseId unique(RecipeId, MealCourseId)    
)

create table dbo.CookbookRecipe(
    CookbookRecipeId int not null identity primary key,
    CookbookId int not null constraint f_CookbookRecipe_cookbook_id foreign key references Cookbook(CookbookId),
    RecipeId int not null constraint f_CookbookRecipe_recipe_id foreign key references Recipe(RecipeId),
    SequenceNum int not null constraint ck_CookbookRecipe_sequence_num_must_be_greater_than_zero check(SequenceNum > 0),
    constraint u_CookbookRecipe_cookbook_id_recipe_id unique(CookbookId, RecipeId),
    constraint u_CookBookRecipe_ccokbook_id_sequence_num unique(CookBookId, SequenceNum)
)
