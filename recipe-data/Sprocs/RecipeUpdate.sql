create or alter procedure dbo.RecipeUpdate(
    @RecipeId int = 0 output,
    @UsernameId int,
    @CuisineId int,
    @RecipeName varchar(70),
    @Calories int,
    @DateDrafted date = null output,
    @DatePublished date = null output,
    @DateArchived date = null output,
    @RecipeStatus varchar(10) = '' output,
    @RecipeImage varchar(150) = '' output
)
as
begin
    select @RecipeId = isnull(@RecipeId, 0)

    if @RecipeId = 0
    begin
        insert Recipe(UsernameId, CuisineId, RecipeName, Calories)
        values(@UsernameId, @CuisineId, @RecipeName, @Calories)

        select @RecipeId = SCOPE_IDENTITY()
    end
    else
    begin
        update Recipe
        set
        UsernameId = @UsernameId,
        CuisineId = @CuisineId,
        RecipeName = @RecipeName,
        Calories = @Calories,
        DateDrafted = @DateDrafted,
        DatePublished = @DatePublished,
        DateArchived = @DateArchived
        where RecipeId = @RecipeId
    end
end 
go
