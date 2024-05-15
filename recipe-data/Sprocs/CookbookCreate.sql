create or alter procedure dbo.CookbookCreate(@All bit = 0, @UsernameName varchar(50) = '', @UsernameId int = 0)
as 
begin
    ;with x as(
    	select NumOfRecipes = count(r.RecipeName)
    	from Recipe r 
    	join Username u
    	on u.UsernameId = r.UsernameId
    	where u.UsernameName = @UsernameName
        or u.UsernameId = @UsernameId
    )
    insert Cookbook(UsernameId, CookbookName, Price, IsActive, DateCreated)
    select u.UsernameId, concat('Recipes by ', u.FirstName, ' ', u.LastName), x.NumOfRecipes *1.33, 1, '5/12/23'  
    from Username u
    cross join x
    where u.UsernameName = @UsernameName
    or u.UsernameId = @UsernameId

    declare @newcookbookid int

      select @newcookbookid = CookbookId from Cookbook c
      where CookbookId = SCOPE_IDENTITY()

    insert CookbookRecipe(CookbookId, RecipeId, SequenceNum)
    select c.CookbookId, r.RecipeId, ROW_NUMBER() over (order by r.RecipeName)
    from Recipe r
    join Cookbook c
    on c.UsernameId = r.UsernameId
    join Username u
    on u.UsernameId = r.UsernameId
    where c.CookbookName like 'Recipes by %'
    and (u.UsernameName = @UsernameName
    or u.UsernameId = @UsernameId)

    select * from Cookbook c
    join CookbookRecipe cr 
    on cr.CookbookId = c.CookbookId
    join Username u
    on c.UsernameId = u.UsernameId
    where c.CookbookId = @newcookbookid

end 
go
--exec CookbookCreate @UsernameId = 8
--select * from Cookbook