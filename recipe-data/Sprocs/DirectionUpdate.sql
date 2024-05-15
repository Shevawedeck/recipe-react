create or alter procedure dbo.DirectionUpdate(
	@DirectionId int  output,
	@RecipeId int,
    @SequenceNum int,
    @DirectionDesc varchar(400),
	@Message varchar(500) = ''  output
)
as
begin
	declare @return int = 0

	select @DirectionId = isnull(@DirectionId,0)

	if @DirectionId = 0
	begin
		insert Direction(RecipeId, SequenceNum, DirectionDesc)
		values(@RecipeId, @SequenceNum, @DirectionDesc)

		select @DirectionId = scope_identity()
	end
	else
	begin
		update Direction
		set
			RecipeId = @RecipeId,
            SequenceNum = @SequenceNum,
            DirectionDesc = @DirectionDesc
		where DirectionId = @DirectionId
	end

	return @return
end
go