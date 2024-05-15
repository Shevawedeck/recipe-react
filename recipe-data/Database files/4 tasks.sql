-- SM Excellent! 100% See comment, no need to resubmit.
--Note: some of these scripts are needed for specific items, when the instructions say "specific" pick one item in your data and specify it in the where clause using a unique value that identifies it, do not use the primary key.

--1) Sometimes when a staff member is fired. We need to eradicate everything from that user in our system. Write the SQL to delete a specific user and all the user's related records.

delete cr
from CookbookRecipe cr
join Recipe r
on r.RecipeId = cr.RecipeId
join Username u 
on u.UsernameId = r.UsernameId
where u.UsernameName = 'ssuss'

delete cr
from CookbookRecipe cr
join Cookbook c
on cr.CookbookId = c.CookbookId
join Username u 
on u.UsernameId = c.UsernameId
where u.UsernameName = 'ssuss'

delete mcr
from MealCourseRecipe mcr
join Recipe r
on r.RecipeId = mcr.RecipeId
join Username u 
on u.UsernameId = r.UsernameId
where u.UsernameName = 'ssuss'

delete mcr 
from MealCourseRecipe mcr
join MealCourse mc 
on mc.MealCourseId = mcr.MealCourseId
join Meal m
on mc.MealId = m.MealId
join Username u 
on u.UsernameId = m.UsernameId
where u.UsernameName = 'ssuss'

delete mc 
from MealCourse mc 
join Meal m 
on m.MealId = mc.MealId
join Username u 
on m.UsernameId = u.UsernameId
where u.UsernameName = 'ssuss'

delete ri 
from RecipeIngredient ri 
join Recipe r
on r.RecipeId = r.RecipeId
join Username u 
on u.UsernameId = r.UsernameId
where u.UsernameName = 'ssuss'

delete c
from Cookbook c
join Username u 
on c.UsernameId = u.UsernameId
where u.UsernameName = 'ssuss'

delete m 
from Meal m 
join Username u 
on m.UsernameId = u.UsernameId
where u.UsernameName = 'ssuss'

delete d
from Direction d
join Recipe r
on r.RecipeId = r.RecipeId
join Username u 
on u.UsernameId = r.UsernameId
where u.UsernameName = 'ssuss'

delete r
from Recipe r
join Username u 
on u.UsernameId = r.UsernameId
where u.UsernameName = 'ssuss'

delete u
from Username u
where u.UsernameName = 'ssuss'
--2) Sometimes we want to clone a recipe as a starting point and then edit it. For example we have a complex recipe (steps and ingredients) and want to make a modified version. 
--Write the SQL that clones a specific recipe, add " - clone" to its name.
;with x as(
	select r.RecipeName
	from Recipe r 
	where r.RecipeName = 'Arugula Salad'
)
insert Recipe(UsernameId, CuisineId, RecipeName, Calories, DateDrafted, DatePublished, DateArchived)
select (select r.UsernameId from Recipe r where r.RecipeName = x.RecipeName), (select r.CuisineId from Recipe r where r.RecipeName = x.RecipeName), concat((x.RecipeName), ' - clone'), (select r.Calories from Recipe r where r.RecipeName = x.RecipeName), (select r.DateDrafted from Recipe r where r.RecipeName = x.RecipeName), (select r.DatePublished from Recipe r where r.RecipeName = x.RecipeName), (select r.DateArchived from Recipe r where r.RecipeName = x.RecipeName)
from x

;with x as(
	select r.RecipeName
	from Recipe r 
	where r.RecipeName = 'Arugula Salad'
)
insert RecipeIngredient(RecipeId, IngredientId, MeasurementTypeId, Amount, SequenceNum)
select (select r.RecipeId from Recipe r where r.RecipeName = concat(x.RecipeName, ' - clone')), i.IngredientId, ri.MeasurementTypeId, ri.Amount, ri.SequenceNum
from x
join Recipe r
on x.RecipeName = r.RecipeName
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId 
join Ingredient i
on i.IngredientId = ri.IngredientId

;with x as(
	select r.RecipeName
	from Recipe r 
	where r.RecipeName = 'Arugula Salad'
)
insert Direction(RecipeId, SequenceNum, DirectionDesc)
select (select r.RecipeId from Recipe r where r.RecipeName = concat(x.RecipeName, ' - clone')), d.SequenceNum, d.DirectionDesc
from x
join Recipe r 
on x.RecipeName = r.RecipeName
join Direction d 
on d.RecipeId = r.RecipeId  
/*
3) We offer users an option to auto-create a recipe book containing all of their recipes. 
Write a SQL script that creates the book for a specific user and fills it with their recipes.
The name of the book should be Recipes by Firstname Lastname. 
The price should be the number of recipes multiplied by $1.33
Sequence the book by recipe name.

Tip: To get a unique sequential number for each row in the result set use the ROW_NUMBER() function. See Microsoft Docs.
	 The following can be a column in your select statement: Sequence = ROW_NUMBER() over (order by colum name) , replace column name with the name of the column that the row number should be sorted
*/
;with x as(
	select NumOfRecipes = count(r.RecipeName)
	from Recipe r 
	join Username u
	on u.UsernameId = r.UsernameId
	where u.UsernameName = 'ssuss'
)
insert Cookbook(UsernameId, CookbookName, Price, IsActive, DateCreated)
select u.UsernameId, concat('Recipes by ', u.FirstName, ' ', u.LastName), x.NumOfRecipes *1.33, 1, '5/12/23'  
from Username u
cross join x
where u.UsernameName = 'ssuss'

insert CookbookRecipe(CookbookId, RecipeId, SequenceNum)
select c.CookbookId, r.RecipeId, ROW_NUMBER() over (order by r.RecipeName)
from Recipe r
join Cookbook c
on c.UsernameId = r.UsernameId
join Username u
on u.UsernameId = r.UsernameId
where c.CookbookName = 'Recipes by Sara Sussman'
and u.UsernameName = 'ssuss'
/*
4) Sometimes the calorie count of of an ingredient changes and we need to change the calorie total for all recipes that use that ingredient.
Our staff nutritionist will specify the amount to change per measurement type, and of course multiply the amount by the quantity of the ingredient.
For example, the calorie count for butter went down by 2 per ounce, and 10 per stick of butter. 
Write an update statement that changes the number of calories of a recipe for a specific ingredient. 
The statement should include at least two measurement types, like the example above. 
*/
update r
set Calories = 
	case 
	when i.IngredientName = 'shredded cheese' and mt.MeasurementTypeName = 'cup'
	then r.Calories + (ri.Amount*10)
	when i.IngredientName = 'shredded cheese' and mt.MeasurementTypeName = 'ounce'
	then r.Calories + (ri.amount *2)
	end
from Recipe r
join RecipeIngredient ri
on r.RecipeId = ri.RecipeId
join Ingredient i
on i.IngredientId = ri.IngredientId
join MeasurementType mt
on mt.MeasurementTypeId = ri.MeasurementTypeId

/*
5) We need to send out alerts to users that have recipes sitting in draft longer the average amount of time that recipes have taken to be published.
Produce a result set that has 4 columns (Data values in brackets should be replaced with actual data)
	User First Name, 
	User Last Name, 
	email address (first initial + lastname@heartyhearth.com),
	Alert: 
		Your recipe [recipe name] is sitting in draft for [X] hours.
		That is [Z] hours more than the average [Y] hours all other recipes took to be published.
*/
;
with x as(
	select AvgHoursInDraft = avg(datediff(hour, r.DateDrafted, r.DatePublished))
	from Recipe r
)
select u.FirstName, u.LastName, EmailAddress = lower(concat(substring(u.FirstName, 1, 1), u.LastName, '@heartyhearth.com')), 
	Alert = concat('Your recipe ', r.RecipeName, ' is sitting in draft for ', datediff(hour, r.DateDrafted, getdate()), ' hours. That is ', 
	datediff(hour, r.DateDrafted, getdate()) - x.AvgHoursInDraft, ' hours more than the average ', x.AvgHoursInDraft, ' hours all other recipes took to be published.' )
from x
cross join Recipe r
join Username u
on r.UsernameId = u.UsernameId
-- SM Tip: Instead of doing calculations. Use datediff() > avg
where (datediff(hour, r.DateDrafted, getdate()) - x.AvgHoursInDraft) > 0
and r.RecipeStatus = 'drafted'
group by u.FirstName, u.LastName, r.RecipeName, r.DateDrafted, x.AvgHoursInDraft
/*
6) We want to send out marketing emails for books. Produce a result set with one row and one column "Email Body" as specified below.
The email should have a unique guid link to follow, which should be shown in the format specified. 

Email Body:
Order cookbooks from HeartyHearth.com! We have [X] books for sale, average price is [Y]. You can order them all and recieve a 25% discount, for a total of [Z].
Click <a href = "www.heartyhearth.com/order/[GUID]">here</a> to order.
*/
select concat('Order cookbooks from HeartyHearth.com! We have ', count(c.CookbookId), ' books for sale, average price is $', format(avg(c.Price),'N2'), '. You can order them all and recieve a 25% discount, for a total of $', 
	sum(c.price), '. Click <a href = "www.heartyhearth.com/order/', newid(), '">here</a> to order.') as EmailBody
from Cookbook c
