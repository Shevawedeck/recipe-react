create or alter procedure dbo.DirectionGet(
    @DirectionId int = 0,
    @RecipeId int = 0,
    @All bit = 0,
    @Message varchar(500) = '' output
)
as
begin 
    declare @return int = 0 
    select @All = isnull(@All, 0), @DirectionId = isnull(@DirectionId, 0), @RecipeId = isnull(@RecipeId, 0)

    select d.DirectionId, d.RecipeId, d.SequenceNum, d.DirectionDesc
    from Direction d
    where d.DirectionId = @DirectionId
    or @All = 1 
    or d.RecipeId = @RecipeId
    return @return
end
go