create or alter procedure dbo.CookbookUpdate(
    @CookbookId int output,
    @UsernameId int,
    @CookbookName varchar(70),
    @Price decimal(6,2),
    @DateCreated date
    --@IsActive bit = 0
)
as
begin

    select @CookbookId = isnull(@CookbookId, 0) --, @IsActive = isnull(@IsActive, 0)

    if @CookbookId = 0
    begin
        insert Cookbook(UsernameId, CookbookName, Price, DateCreated)
        values(@UsernameId, @CookbookName, @Price, GETDATE())

        select @CookbookId = SCOPE_IDENTITY()
    end
    else
    begin
        update Cookbook
        set
        UsernameId = @UsernameId,
        CookbookName = @CookbookName,
        Price = @Price,
        --IsActive = @IsActive, 
        DateCreated = @DateCreated
        where CookbookId = @CookbookId
    end
end 
go
