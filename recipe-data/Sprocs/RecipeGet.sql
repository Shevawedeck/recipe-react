create or alter procedure dbo.RecipeGet(@RecipeId int = 0, @All bit = 0, @RecipeName varchar(50) = '', @IncludeBlank bit = 0)
as
begin
    select @RecipeName = nullif(@RecipeName, ''), @IncludeBlank = isnull(@IncludeBlank, 0)
    select r.RecipeId, r.UsernameId, r.CuisineId, c.CuisineType, r.RecipeName,  r.RecipeStatus, u.UsernameName, r.Calories, r.DateDrafted, r.DatePublished, r.DateArchived, r.RecipeImage, NumIngredients = isnull(count(ri.IngredientId), 0), Vegan = case when r.Vegan = 0 then 'No' else 'Yes' end
    from Recipe r
    join Username u
    on u.UsernameId = r.UsernameId
    left join RecipeIngredient ri
    on r.RecipeId = ri.RecipeId
    left join Cuisine c 
    on r.CuisineId = c.CuisineId
    where r.RecipeId = @RecipeId
    or @All = 1
    or r.RecipeName = @RecipeName
    group by r.RecipeId, r.UsernameId, r.CuisineId, c.CuisineType, r.RecipeName,  r.RecipeStatus, u.UsernameName, r.Calories, r.DateDrafted, r.DatePublished, r.DateArchived, r.RecipeImage, r.Vegan
    union select 0, 0, 0, '', '', '', '', 0, '', '', '', '',0, ''
    where @IncludeBlank = 1
    order by r.RecipeStatus desc
    
end
go

--exec RecipeGet

--exec RecipeGet @All = 1, @IncludeBlank = 1

--exec RecipeGet @RecipeName = 'Avacado Toast'

--declare @id int
--select top 1 @id = r.RecipeId
--from Recipe r
--exec RecipeGet @RecipeId = 1028