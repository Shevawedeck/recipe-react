create or alter procedure dbo.IngredientDelete(
	@IngredientId int = 0,
	@Message varchar(500) = ''  output
)
as
begin
	declare @return int = 0

	select @IngredientId = isnull(@IngredientId,0)

	delete RecipeIngredient where IngredientId = @IngredientId
	delete Ingredient where IngredientId = @IngredientId

	return @return
end
go