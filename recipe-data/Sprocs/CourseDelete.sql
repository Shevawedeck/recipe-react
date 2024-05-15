create or alter procedure dbo.CourseDelete(
	@CourseId int = 0,
	@Message varchar(500) = ''  output
)
as
begin
	declare @return int = 0

	select @CourseId = isnull(@CourseId,0)

    delete MealCourse where CourseId = @CourseId
	delete Course where CourseId = @CourseId

	return @return
end
go