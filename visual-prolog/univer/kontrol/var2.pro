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
nondeterm second_coustin_sister(имя,имя)
% С) родственники по закону (англ.: in law).
% 8. свояченица [сестра жены] (wifes_sister)
nondeterm wifes_sister(имя,имя)

clauses

parent("Отец", "Я").
parent("Дед", "Отец").
parent("Прадед", "Дед").
parent("двоюродный дядя", "троюродная сестра").
parent("двоюродный Дед", "двоюродный дядя").
parent("Прадед", "двоюродный Дед").

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
woman("троюродная сестра").

married(X, Y):-parent(X,C),woman(X),parent(Y,C),man(Y).
married(X, Y):-parent(X,C),man(X),parent(Y,C),woman(Y).

mother(X,Y):- parent(X,Y),woman(X).
father(X,Y):- parent(X,Y),man(X).

wifes_sister(W,S):-mother(W,_),woman(S),parent(P,S),parent(P,W), W<>S.

second_coustin_sister(I,S):-
	parent(P1i,I),parent(P2i,P1i), parent(P3,P2i),
	parent(P1s,S),parent(P2s,P1s), parent(P3,P2s),
	P1i <> P1s, P2i <> P2s,
	P1i <> P2s, P1s <> P2i.

goal
% Ответ:

% А) близкие кровные родственники;
% 2. мать (mother)
% mother(M,I).

% Б) неблизкие кровные родственники;
% 8. троюродная сестра
% second_coustin_sister(I,S).

% С) 8. свояченица [сестра жены]
% wifes_sister(W,S).
