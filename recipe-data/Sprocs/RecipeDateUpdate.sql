create or alter procedure dbo.RecipeDateUpdate(
    @RecipeId int output,
    @DateDrafted date output,
    @DatePublished date null output,
    @DateArchived date null output,
    @RecipeStatus varchar(10) 
)
as
begin
    select @RecipeId = isnull(@RecipeId, 0), @DatePublished = nullif(@DatePublished, ''), @DateArchived = nullif(@DateArchived, '')

    if @RecipeId = 0
    begin
        insert Recipe(DateDrafted, DateArchived, DatePublished)
        values(@DateDrafted, @DateArchived, @DatePublished)
    end
    else

    if @RecipeStatus = 'archived'
    begin 
        update Recipe
        set
        DateDrafted = @DateDrafted,
        DatePublished = @DatePublished,
        DateArchived = null
        where RecipeId = @RecipeId
    end 

    else
    begin
        update Recipe
        set
        DateDrafted = @DateDrafted,
        DatePublished = @DatePublished,
        DateArchived = @DateArchived
        where RecipeId = @RecipeId
    end

end 
go

--exec RecipeDateUpdate @RecipeID = 1026, @DateDrafted = '2/19/2024', @DatePublished = null, @DateArchived = null
