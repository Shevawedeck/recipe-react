
;
with x as(
select 'Arugula Salad' as RecipeName,
    1 as Vegan
union all select 'Chocolate Chip Cookies', 0
union all select 'Apple Yogurt Smoothie', 0
union all select 'Cheese Omelet', 0
union all select 'Cheese Bread', 0
union all select 'Butter Muffins', 0
union all select 'Avacado Toast', 1
)
update r 
set r.Vegan = x.Vegan
from Recipe r
join x 
on x.RecipeName = r.RecipeName


;
with x as(
    select 'Treats for Two' as CookbookName,
        2 as SkillLevel
union all select 'Meaningful Tastes', 1
union all select 'The Chef''s Go To', 3
union all select 'So Sweet', 3
)
update c 
set c.SkillLevel = x.SkillLevel
from Cookbook c 
join x 
on x.CookbookName = c.CookbookName