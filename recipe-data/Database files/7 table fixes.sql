alter table recipe add Vegan bit not null default 0

alter table cookbook add SkillLevel int not null default 1

alter table cookbook add SkillDesc as 
    case 
    when SkillLevel = 1 
    then 'Beginner'
    when  SkillLevel = 2 
    then 'Intermediate'
    when SkillLevel = 3 
    then 'Advanced'
    end

alter table meal add MealDesc as concat(MealName, ', Created on: ', DateCreated)
