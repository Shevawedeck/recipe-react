create or alter procedure dbo.CourseGet(@CourseId int = 0, @All bit = 0, @CourseType varchar(15) = '')
as
begin
    select c.CourseId, c.SequenceNum, c.CourseType
    from Course c
    where c.CourseId = @CourseId
    or @All = 1
    or (@CourseType <> '' and c.CourseType like '%' + @CourseType + '%')
end
go