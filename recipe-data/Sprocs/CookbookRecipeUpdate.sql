create or alter procedure dbo.CookbookRecipeUpdate(
	@CookbookRecipeId int  output,
	@CookbookId int,
	@RecipeId int,
    @SequenceNum int,
	@Message varchar(500) = ''  output
)
as
begin
	declare @return int = 0

	select @CookbookRecipeId = isnull(@CookbookRecipeId,0)

	if @CookbookRecipeId = 0
	begin
		insert CookbookRecipe(CookbookId, RecipeId, SequenceNum)
		values(@CookbookId, @RecipeId, @SequenceNum)

		select @CookbookRecipeId= scope_identity()
	end
	else
	begin
		update CookbookRecipe
		set
			CookbookId = @CookbookId, 
			RecipeId = @RecipeId,
            SequenceNum = @SequenceNum
		where CookbookRecipeId = @CookbookRecipeId
	end

	return @return
end
go