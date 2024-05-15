create or alter procedure dbo.RecipeSearch(
    @RecipeId int = 0,
    @RecipeName varchar(100) = '',
    @Message varchar(1000) = '' output
)
as
begin
    declare @return int = 0, @count int = 0
    declare @t table(recipeid int)

    select @RecipeName = isnull(@RecipeName, ''), @RecipeId = isnull(@RecipeId, 0)

    insert @t(recipeid)
    select r.RecipeId
    from Recipe r
    where (r.RecipeName like '%' + @RecipeName + '%' or @RecipeName = '')
    and (r.RecipeId = @RecipeId or @RecipeId = 0)

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

--exec RecipeSearch @RecipeName = 'toast'
--exec RecipeSearch @CookbookId = 1013
--select * from CookbookRecipe