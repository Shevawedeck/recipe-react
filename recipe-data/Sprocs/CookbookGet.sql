create or alter procedure dbo.CookbookGet(@All bit = 0, @CookbookId int = 0, @IncludeBlank bit = 0)
as 
begin
    declare @return int = 0

    select @All = isnull(@All, 0), @CookbookId = isnull(@CookbookId, 0)

    select c.CookbookId, c.UsernameId, c.CookbookName, Author = concat(u.FirstName, ' ', u.LastName) , NumRecipes = isnull(count(cr.RecipeId),0), c.Price, c.IsActive, c.DateCreated, c.SkillDesc, c.CookbookImage
    from Cookbook c
    left join CookbookRecipe cr 
    on cr.CookbookId = c.CookbookId
    join Username u
    on c.UsernameId = u.UsernameId
    where @All = 1
    or c.CookbookId = @CookbookId
    group by c.CookbookName, c.Price, u.FirstName, u.LastName, c.UsernameId, c.IsActive, c.DateCreated, c.CookbookId, c.SkillDesc
    union select 0, 0, '', '', 0, 0, '', '', '', ''
    where @IncludeBlank = 1
    return @return
end
go

--exec CookbookGet @All = 1
--select * from cookbook