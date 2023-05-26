domains
имя = string

predicates
nondeterm parent(имя, имя)
nondeterm man(имя)
nondeterm woman(имя)
nondeterm mother(имя,имя)
nondeterm father(имя,имя)

clauses
parent("Саша", "Света").
parent("Маша", "Света").
parent("Саша", "Таня").
parent("Маша", "Таня").
parent("Петя", "Юра").
parent("Света", "Юра").
parent("Таня", "Катя").
parent("Ваня", "Катя").

man("Саша").
man("Петя").
man("Ваня").
man("Юра").

woman("Света").
woman("Маша").
woman("Таня").
woman("Катя").

mother(X,Y):- parent(X,Y),woman(X).
father(X,Y):- parent(X,Y),man(X).

goal
% Ответ:

% 1) mother(X,Y).
% X=Маша, Y=Света
% X=Маша, Y=Таня
% X=Света, Y=Юра
% X=Таня, Y=Катя
% 4 Solutions

% 1) father(X,Y).
% X=Саша, Y=Света
% X=Саша, Y=Таня
% X=Петя, Y=Юра
% X=Ваня, Y=Катя
% 4 Solutions
