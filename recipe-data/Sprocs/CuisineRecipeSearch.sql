create or alter procedure dbo.CuisineRecipeSearch(
    @CuisineId int = 0,
    @CuisineType varchar(100) = '',
    @RecipeName varchar(100) = '',
    @Message varchar(1000) = '' output
)
as
begin
    declare @return int = 0, @count int = 0
    declare @t table(recipeid int)

    select @RecipeName = isnull(@RecipeName, ''), @CuisineType = isnull(@CuisineType, ''), @CuisineId = isnull(@CuisineId, 0)

    insert @t(recipeid)
    select r.RecipeId
    from Recipe r
    join Cuisine c
    on c.CuisineId = r.CuisineId
	where (c.CuisineType like '%' + @CuisineType + '%' or @CuisineType = '')
    and (c.CuisineId = @CuisineId or @CuisineId = 0)

	select r.RecipeId, r.UsernameId, r.CuisineId, r.RecipeName, r.Calories, r.DateDrafted, r.DatePublished, r.DateArchived, Vegan = case when r.Vegan = 0 then 'No' else 'Yes' end, NumIngredients = count(ri.IngredientId), r.RecipeImage
    from @t t
    join Recipe r
    on t.Recipeid = r.RecipeId
    join RecipeIngredient ri
    on r.RecipeId = ri.RecipeId
    group by r.RecipeId, r.UsernameId, r.CuisineId, r.RecipeName, r.Calories, r.DateDrafted, r.DatePublished, r.DateArchived, r.Vegan, r.RecipeImage
	order by r.RecipeName

    finished:
    return @return
end
go

--exec CuisineRecipeSearch @CuisineType = 'English'
--exec CuisineRecipeSearch @CuisineId = 1
--select * from Recipe r join Cuisine c on c.CuisineId = r.CuisineId