-- delete recipe
insert Recipe(UsernameId, CuisineId, RecipeName, Calories, DateDrafted, DatePublished, DateArchived, Vegan)
select (select u.UsernameId from Username u where u.UsernameName = 'eliyair'), (select c.CuisineId from Cuisine c where c.CuisineType = 'English'), 'Schnitzel', 400, '2/2/17', '3/3/18', '2/2/19', 0
union select (select u.UsernameId from Username u where u.UsernameName = 'maga'), (select c.CuisineId from Cuisine c where c.CuisineType = 'American'), 'Smores Bars', 400, '2/2/15', '3/3/17', null, 0
union select (select u.UsernameId from Username u where u.UsernameName = 'ctepfer'), (select c.CuisineId from Cuisine c where c.CuisineType = 'English'), 'Zuchinni Soup', 100, '2/2/18', '3/3/19', '8/20/23', 1
union select (select u.UsernameId from Username u where u.UsernameName = 'ssuss'),  (select c.CuisineId from Cuisine c where c.CuisineType = 'French'), 'Peanut Chews', 300, '2/2/16', null, null, 1
union select (select u.UsernameId from Username u where u.UsernameName = 'maga'),  (select c.CuisineId from Cuisine c where c.CuisineType = 'English'), 'Babka', 400, '4/2/18', '7/3/18', '7/3/20', 0
--select * from ingredient
--select * from recipe where RecipeStatus = 'archived'