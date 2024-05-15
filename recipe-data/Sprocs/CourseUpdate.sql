create or alter procedure dbo.CourseUpdate(
	@CourseId int  output,
    @SequenceNum int,
    @CourseType varchar(400),
	@Message varchar(500) = ''  output
)
as
begin
	declare @return int = 0

	select @CourseId = isnull(@CourseId,0)

	if @CourseId = 0
	begin
		insert Course(SequenceNum, CourseType)
		values(@SequenceNum, @CourseType)

		select @CourseId = scope_identity()
	end
	else
	begin
		update Course
		set
            SequenceNum = @SequenceNum,
            CourseType = @CourseType
		where CourseId = @CourseId
	end

	return @return
end
go