create or alter procedure dbo.CookbookRecipeGet(
    @CookbookRecipeId int = 0,
    @CookbookId int = 0,
    @RecipeId int = 0,
    @All bit = 0
)
as 
begin 
    declare @return int = 0
    select @All = isnull(@All, 0), @CookbookRecipeId = isnull(@CookbookRecipeId, 0), @CookbookId = isnull(@CookbookId, 0), @RecipeId = isnull(@RecipeId, 0)
    
    select cr.CookbookRecipeId, cr.CookbookId, cr.RecipeId, cr.SequenceNum
    from CookbookRecipe cr 
    where cr.CookbookRecipeId = @CookbookRecipeId
    or @All = 1 
    or cr.CookbookId = @CookbookId
    or cr.RecipeId = @RecipeId
    order by cr.SequenceNum

    return @return
end 
go
--select * from cookbookrecipe