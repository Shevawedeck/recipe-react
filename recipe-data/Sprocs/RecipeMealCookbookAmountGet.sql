create or alter procedure dbo.RecipeMealCookbookAmountGet(@All bit = 0)
as
begin
    select Type = 'Recipes', Number = count(r.RecipeName) 
    from Recipe r
    where @All = 1
    union select 'Meals', count(m.MealName)
    from Meal m
    where @All = 1
    union select 'Cookbook', count(c.CookbookName)
    from Cookbook c
    where @All = 1
    order by [Type] desc
end
go

--exec RecipeMealCookbookAmountGet @All = 1