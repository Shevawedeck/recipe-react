create or alter procedure dbo.RecipeIngredientUpdate(
	@RecipeIngredientId int  output,
	@RecipeId int,
	@IngredientId int,
    @MeasurementTypeId int,
    @Amount decimal,
    @SequenceNum int,
	@Message varchar(500) = ''  output
)
as
begin
	declare @return int = 0

	select @RecipeIngredientId = isnull(@RecipeIngredientId,0)

	if @RecipeIngredientId = 0
	begin
		insert RecipeIngredient(RecipeId, IngredientId, MeasurementTypeId, Amount, SequenceNum)
		values(@RecipeId, @IngredientId, @MeasurementTypeId, @Amount, @SequenceNum)

		select @RecipeIngredientId = scope_identity()
	end
	else
	begin
		update RecipeIngredient
		set
			RecipeId = @RecipeId, 
			IngredientId = @IngredientId,
            MeasurementTypeId = @MeasurementTypeId,
            Amount = @Amount,
            SequenceNum = @SequenceNum
		where RecipeIngredientId = @RecipeIngredientId
	end

	return @return
end
go
