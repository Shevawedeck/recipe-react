create or alter procedure dbo.CookbookDelete(
	@CookbookId int = 0,
	@Message varchar(500) = ''  output
)
as
begin
	declare @return int = 0

	select @CookbookId = isnull(@CookbookId, 0)

	if exists(select * from CookbookRecipe cr left join Cookbook c on c.CookbookId = cr.CookbookId where c.CookbookId = @CookbookId or cr.CookbookId = @CookbookId)
	begin
        select @return = 1, @Message = 'Cannot delete cookbook that has related recipes.'
        goto finished
    end

	begin try 
		begin tran
    	delete CookbookRecipe where CookbookId = @CookbookId
		delete Cookbook where CookbookId = @CookbookId
		commit
	end try
	begin catch 
		rollback;
		throw
	end catch

	finished:
	return @return
end
go