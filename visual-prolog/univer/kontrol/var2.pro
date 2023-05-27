% Вариант 2
% Шифры родственных отношений: А2, Б8, С8

domains
имя = string

predicates
% Базовые отношения
nondeterm parent(имя, имя) 	% РОДИТЕЛЬ
nondeterm man(имя) 		% МУЖЧИНА
nondeterm woman(имя) 		% ЖЕНЩИНА
nondeterm married(имя, имя) 	% СУПРУГИ
nondeterm father(имя,имя)
% А) близкие кровные родственники;
% 2. мать (mother)
nondeterm mother(имя,имя)
% Б) неблизкие кровные родственники;
% 8. троюродная сестра (second_coustin_sister)
% С) родственники по закону (англ.: in law).
% 8. свояченица [сестра жены] (wifes_sister)

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

married(X, Y):-parent(X,C),woman(X),parent(Y,C),man(Y).
married(X, Y):-parent(X,C),man(X),parent(Y,C),woman(Y).

mother(X,Y):- parent(X,Y),woman(X).
father(X,Y):- parent(X,Y),man(X).

goal
% Ответ:
married(X,Y).
