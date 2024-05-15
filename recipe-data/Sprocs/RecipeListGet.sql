create or alter procedure dbo.RecipeListGet(@All bit = 0)
as
begin
    select r.RecipeId, r.RecipeName, r.RecipeStatus, u.UsernameName, r.Calories, NumIngredients = count(ri.IngredientId)
    from Recipe r
    join Username u
    on u.UsernameId = r.UsernameId
    join RecipeIngredient ri
    on r.RecipeId = ri.RecipeId
    where @All = 1
    group by r.RecipeId, r.RecipeName, r.RecipeStatus, u.UsernameName, r.Calories
    order by r.RecipeStatus desc
end
go

exec RecipeListGet @All = 1