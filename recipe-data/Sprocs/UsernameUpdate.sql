create or alter procedure dbo.UsernameUpdate(
    @UsernameId int output,
    @UsernameName varchar(100) = '',
    @LastName varchar(30) = '',
    @FirstName varchar(30) = '',
    @Message varchar(500) = '' output
)
as 
begin 
    declare @return int = 0 
    select @UsernameId = isnull(@UsernameId, 0)

    if @UsernameId = 0
	begin
		insert Username(UsernameName, LastName, FirstName)
		values(@UsernameName, @LastName, @FirstName)

		select @UsernameId= scope_identity()
	end
	else
	begin
		update Username
		set
			UsernameName = @UsernameName,
            FirstName = @FirstName,
            LastName = @LastName
		where UsernameId = @UsernameId
	end

	return @return
end
go
