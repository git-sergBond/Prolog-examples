% Алгоритм Фибоначи за экспоненциональное время
% N - позиция числа в ряде, R - значение числа на позиции N
% Как использовать:
% fib(90, X).
fib(1,1).
fib(2,1).
fib(N, R) :- fib_table(N, R), !. % берем результат из кэша
fib(N, R) :-
	N > 2,
	N1 is N - 1,
	N2 is N - 2,
	fib(N1, R1),
	fib(N2, R2),
	R is R1 + R2,
	assert(fib_table(N, R)). % Кэширование результата

% Алгоритм Фибоначи за линейное время.
% N - позиция числа в ряде, R - значение числа на позиции N
% fib_acc(N, R).
% Как использовать:
% fib_acc(90, X).
fib_acc(N, R) :- fib_acc(N, 1, 1, R).
fib_acc(1, A, _, A).
fib_acc(N, A, B, R) :-
	N > 0,
	N1 is N - 1,
	NB is A + B,
	fib_acc(N1, B, NB, R).

% Алгоритм быстрого возведения в степень
% power(2, 10, R). -> 1024

% Обратимые арифмитические вычисления. Инкремент
% A - значение, B - резульат операции инкремента
% inc(A, B).
% Как использовать:
% inc(9, 10).
% inc(9, X).
% inc(X, 10).
inc(A, B) :- number(A), !, B is A + 1.
inc(A, B) :- number(B), !, A is B - 1.

% Получить количство элементов (R) в списке (L)
% count(L, R).
% Аналог в стандартной библиотеке: length
% Как использовать:
% count([1, 2, 3, 'hello'], R).
count([],0).
count([H|T], R):-count(T, TR), R is TR + 1.

% Генерация массива (R) длины (N), заполненным одинаковымми значениями (V)
% repeat(N, V, R).
% repeat(10, 0, R).
repeat(0, _, []).
repeat(N, V, [H | T]) :- 
	N1 is N - 1,
	repeat(N1, V, T),
	H = V.

% Поиск элемента (V) в списке (R).
% contains(V, R).
% Аналог в стандартной библиотеке: member
% Как использовать:
% contains(1, [23,2,1,3]).
contains(V, []) :- fail. 	% return false
contains(V, [V]). 		% return true
contains(V, [V | _]). 		% return true
contains(V, [H | T]) :- V \= H, contains(V, T).

% Склеивание списка (A) со списком (B)
% concat(A, B, R).
% Как использовать:
% 1) concat([1,2], [3,4], X).
% 2) concat([1,2], X, [1, 2, 3, 4]).
% 3) concat(X, [3,4], [1, 2, 3, 4]).
concat([], B, B).
concat([H|T], B, [H | TR]) :- concat(T,B,TR).


% Функции высшего порядка. Пример с map.
% Ограничение: предикат F может быть только с 2мя аргументами.
% map(IN, F, OUT).
% Как использовать:
% 1) map([1,2,3,4], inc, X).
% 2) map(Y, inc, [2,3,4,5]).
map([], _, []).
map([H | T], F, [HR | TR]) :-
	G =.. [F, H, HR], 	% Подготовка цели G с аргументами H и HR
	call(G),		% Выполнение цели G
	map(T, F, TR).

% zip (AS, BS, (A, B)s)
% Как использовать:
% zip([1, 2, 3], [hello, world], R).
zip([], _, []).
zip(_, [], []).
zip([A|AS], [B|BS], [(A, B) | CS]) :- zip(AS, BS, CS).
