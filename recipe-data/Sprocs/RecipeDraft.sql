create or alter procedure dbo.RecipeDraft(
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

    begin
        update Recipe
        set
        DatePublished = null,
        DateArchived = null,
        DateDrafted = @DateDrafted
        where RecipeId = @RecipeId
    end
end 
go
