%tuProlog IDE v0.31.5

% Алгоритм Фибоначи за экспоненциональное время
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

% Алгоритм Фибоначи за линейное время

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

% Обратимые арифмитические вычисления
% inc(9, 10).
% inc(9, X).
% inc(X, 10).
inc(A, B) :- number(A), !, B is A + 1.
inc(A, B) :- number(B), !, A is B - 1.

% Получить количство элементов в списке
% count([1, 2, 3, 'hello'], R).
count([],0).
count([H|T], R):-count(T, TR), R is TR + 1.

% Генерация массива заполненным одинаковымми значениями
% repeat(10, 0, R).
repeat(0, _, []).
repeat(N, V, [H | T]) :- 
	N1 is N - 1,
	repeat(N1, V, T),
	H = V.
