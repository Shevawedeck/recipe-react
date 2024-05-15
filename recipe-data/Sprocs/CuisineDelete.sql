create or alter procedure dbo.CuisineDelete(
	@CuisineId int = 0,
	@Message varchar(500) = ''  output
)
as
begin
	declare @return int = 0

	select @CuisineId = isnull(@CuisineId,0)

	
	delete cr from CookbookRecipe cr join Recipe r on r.RecipeId = cr.RecipeId where r.CuisineId = @CuisineId
	delete mcr from MealCourseRecipe mcr join Recipe r on r.RecipeId = mcr.RecipeId where r.CuisineId = @CuisineId
	delete ri from RecipeIngredient ri join Recipe r on r.RecipeId = ri.RecipeId where r.CuisineId = @CuisineId
	delete d from Direction d join Recipe r on r.RecipeId = d.RecipeId where r.CuisineId = @CuisineId
	delete Recipe where CuisineId = @CuisineId
	delete Cuisine where CuisineId = @CuisineId

	return @return
end
go
