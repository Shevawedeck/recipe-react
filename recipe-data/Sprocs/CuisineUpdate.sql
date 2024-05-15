create or alter procedure dbo.CuisineUpdate(
	@CuisineId int  output,
    @CuisineType varchar(400),
	@Message varchar(500) = ''  output
)
as
begin
	declare @return int = 0

	select @CuisineId = isnull(@CuisineId,0)

	if @CuisineId = 0
	begin
		insert Cuisine(CuisineType)
		values(@CuisineType)

		select @CuisineId = scope_identity()
	end
	else
	begin
		update Cuisine
		set
            CuisineType = @CuisineType
		where CuisineId = @CuisineId
	end

	return @return
end
go

