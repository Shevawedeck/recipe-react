create or alter procedure dbo.MeasurementUpdate(
    @MeasurementTypeId int output,
    @MeasurementTypeName varchar(100),
    @Message varchar(500) = '' output
)
as 
begin 
    declare @return int = 0 
    select @MeasurementTypeId = isnull(@MeasurementTypeId, 0)

    if @MeasurementTypeId = 0
	begin
		insert MeasurementType(MeasurementTypeName)
		values(@MeasurementTypeName)

		select @MeasurementTypeId= scope_identity()
	end
	else
	begin
		update MeasurementType
		set
			MeasurementTypeName = @MeasurementTypeName
		where MeasurementTypeId = @MeasurementTypeId
	end

	return @return
end
go
