create or alter procedure dbo.RecipeDelete(
    @RecipeId int,
    @Message varchar(500) = '' output
)
as
begin
    declare @return int = 0
    
    --if exists(select * from MealCourseRecipe m left join CookbookRecipe cr on cr.RecipeId = m.RecipeId where m.RecipeId = @RecipeId or cr.RecipeId = @RecipeId)
    --begin
    --    select @return = 1, @Message = 'Cannot delete recipe that is part of a meal or cookbook.'
    --    goto finished
    --end
    
    if exists(select * from Recipe r where r.RecipeId = @RecipeId and (datediff(day, r.DateArchived, current_timestamp) <= 30 or r.RecipeStatus = 'published'))
    begin
        select @return = 1, @Message = 'Can only delete recipe that is archived for more than 30 days or is currently drafted.'
        goto finished
    end 
   
    begin try
        begin tran
        --delete CookbookRecipe where RecipeId = @RecipeId
        --delete MealCourseRecipe where RecipeId = @RecipeId
        delete RecipeIngredient where RecipeId = @RecipeId
        delete Direction where RecipeId = @RecipeId
        delete Recipe where RecipeId = @RecipeId
        commit
    end try
    begin catch
        rollback;
        throw
    end catch

    finished:
    return @return
end
go

--select * from Recipe r join MealCourseRecipe m on m.RecipeId = r.RecipeId join CookbookRecipe cr on cr.RecipeId = r.RecipeId where m.RecipeId = @RecipeId or cr.RecipeId = @RecipeId