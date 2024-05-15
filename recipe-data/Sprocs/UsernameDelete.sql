create or alter procedure dbo.UsernameDelete(
	@UsernameId int = 0,
	@Message varchar(500) = ''  output
)
as
begin
	declare @return int = 0

	select @UsernameId = isnull(@UsernameId,0)

    delete cr
    from CookbookRecipe cr
    join Recipe r
    on r.RecipeId = r.RecipeId
    where r.UsernameId = @UsernameId
    
    delete mcr
    from MealCourseRecipe mcr
    join Recipe r
    on r.RecipeId = r.RecipeId
    where r.UsernameId = @UsernameId
    
    delete mc 
    from MealCourse mc 
    join Meal m 
    on m.MealId = mc.MealId
    where m.UsernameId = @UsernameId
    
    delete ri 
    from RecipeIngredient ri 
    join Recipe r
    on r.RecipeId = r.RecipeId
    where r.UsernameId = @UsernameId
    
    delete c
    from Cookbook c
    where c.UsernameId = @UsernameId
    
    delete m 
    from Meal m 
    where m.UsernameId = @UsernameId
    
    delete d
    from Direction d
    join Recipe r
    on r.RecipeId = r.RecipeId
    where r.UsernameId = @UsernameId
    
    delete r
    from Recipe r
    where r.UsernameId = @UsernameId
    
    delete u
    from Username u
    where u.UsernameId = @UsernameId

    finished:
	return @return
end
go
