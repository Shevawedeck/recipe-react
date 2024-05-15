create or alter procedure dbo.MeasurementGet(@MeasurementTypeId int = 0, @All bit = 0, @MeasurementTypeName varchar(15) = '')
as
begin
    select m.MeasurementTypeId, m.MeasurementTypeName
    from MeasurementType m
    where m.MeasurementTypeId = @MeasurementTypeId
    or @All = 1
    or (@MeasurementTypeName <> '' and m.MeasurementTypeName like '%' + @MeasurementTypeName + '%')
end
go