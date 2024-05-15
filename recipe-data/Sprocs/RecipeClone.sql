create or alter procedure dbo.RecipeClone(@RecipeId int = 0, @All bit = 0, @RecipeName varchar(100) = '')
as
begin
    ;with x as(
	    select r.RecipeName
	    from Recipe r 
	    where r.RecipeName = @RecipeName
        or r.RecipeId = @RecipeId
    )
    insert Recipe(UsernameId, CuisineId, RecipeName, Calories, DateDrafted, DatePublished, DateArchived)
    select (select r.UsernameId from Recipe r where r.RecipeName = x.RecipeName), (select r.CuisineId from Recipe r where r.RecipeName = x.RecipeName), concat((x.RecipeName), ' - clone'), (select r.Calories from Recipe r where r.RecipeName = x.RecipeName), (select r.DateDrafted from Recipe r where r.RecipeName = x.RecipeName), (select r.DatePublished from Recipe r where r.RecipeName = x.RecipeName), (select r.DateArchived from Recipe r where r.RecipeName = x.RecipeName)
    from x
    
    declare @newrecipeid int = 0
    select @newrecipeid = scope_identity()

    ;with x as(
    	select r.RecipeName
    	from Recipe r 
    	where r.RecipeName = @RecipeName
        or r.RecipeId = @RecipeId
    )
    insert RecipeIngredient(RecipeId, IngredientId, MeasurementTypeId, Amount, SequenceNum)
    select (select r.RecipeId from Recipe r where r.RecipeName = concat(x.RecipeName, ' - clone')), i.IngredientId, ri.MeasurementTypeId, ri.Amount, ri.SequenceNum
    from x
    join Recipe r
    on x.RecipeName = r.RecipeName
    join RecipeIngredient ri 
    on r.RecipeId = ri.RecipeId 
    join Ingredient i
    on i.IngredientId = ri.IngredientId

    ;with x as(
    	select r.RecipeName
    	from Recipe r 
    	where r.RecipeName = @RecipeName
        or r.RecipeId = @RecipeId
    )
    insert Direction(RecipeId, SequenceNum, DirectionDesc)
    select (select r.RecipeId from Recipe r where r.RecipeName = concat(x.RecipeName, ' - clone')), d.SequenceNum, d.DirectionDesc
    from x
    join Recipe r 
    on x.RecipeName = r.RecipeName
    join Direction d 
    on d.RecipeId = r.RecipeId  

   
    select * from recipe where recipeid = @newrecipeid
end
go

--exec RecipeClone @RecipeId = 16