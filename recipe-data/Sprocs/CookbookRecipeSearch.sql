create or alter procedure dbo.CookbookRecipeSearch(
    @CookbookId int = 0,
    @CookbookName varchar(100) = '',
    @RecipeName varchar(100) = '',
    @Message varchar(1000) = '' output
)
as
begin
    declare @return int = 0, @count int = 0
    declare @t table(recipeid int)

    select @RecipeName = isnull(@RecipeName, ''), @CookbookName = isnull(@CookbookName, ''), @CookbookId = isnull(@CookbookId, 0)

    insert @t(recipeid)
    select r.RecipeId
    from Recipe r
    join CookbookRecipe cr 
    on cr.RecipeId = r.RecipeId
    join Cookbook c
    on c.CookbookId = cr.CookbookId
	where (c.CookbookName like '%' + @CookbookName + '%' or @CookbookName = '')
    and (cr.CookbookId = @CookbookId or @CookbookId = 0)

	select r.RecipeId, r.UsernameId, r.CuisineId, r.RecipeName, r.Calories, r.DateDrafted, r.DatePublished, r.DateArchived, Vegan = case when r.Vegan = 0 then 'No' else 'Yes' end, NumIngredients = count(ri.IngredientId)
    from @t t
    join Recipe r
    on t.Recipeid = r.RecipeId
    join RecipeIngredient ri
    on r.RecipeId = ri.RecipeId
    group by r.RecipeId, r.UsernameId, r.CuisineId, r.RecipeName, r.Calories, r.DateDrafted, r.DatePublished, r.DateArchived, r.Vegan
	order by r.RecipeName

    finished:
    return @return
end
go

--exec CookbookRecipeSearch @CookbookName = 'So Sweet'
--exec RecipeSearch @CookbookId = 1013
--select * from CookbookRecipe