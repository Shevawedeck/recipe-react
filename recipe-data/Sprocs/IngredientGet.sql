create or alter procedure dbo.IngredientGet(
    @IngredientId int = 0,
    @All bit = 0,
    @IngredientName varchar(50) = '', 
    @IncludeBlank bit = 0
)
as
begin 
    declare @return int = 0 
    select @All = isnull(@All, 0), @IngredientId = isnull(@IngredientId, 0), @IngredientName = nullif(@IngredientName, ''), @IncludeBlank = isnull(@IncludeBlank, 0)

    select i.IngredientId, i.IngredientName, i.IngredientImage
    from Ingredient i
    where i.IngredientId = @IngredientId
    or @All = 1 
    or i.IngredientName = '%' + @IngredientName + '%'
    union select 0, '', ''
	where @IncludeBlank = 1
    order by i.IngredientName

    return @return
end
go
--select * from ingredient