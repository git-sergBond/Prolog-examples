% Индивидуальное задание 2. Составить программу для вычисления функций 
% А = А(x, y, z) и В = В(x, y, z)

predicates
a(real, real, real, real)
b(real, real, real)
asin(real, real)

clauses
% asin(x)=atan(x/sqrt(1-x^2)), где sqrt(x) - квадратный корень.
asin(X,R) :- 
	X2 = X * X,
 	T = 1 - X2 ,
 	S = sqrt(T),
 	A = X / S,
 	R = arctan(A).
 	
a(X, Y, Z, R) :-
	X <= Z,
	Y3 = Y + 3,
	XY = X * Y3,
	C = cos(XY),
	R = C * C * C.

b(X, Z, R) :- 
	X > Z, 
	asin(Z, A),
	R = X + A.

goal 
% Ответ:
% b(8.367, 0.001, R).
% a(-1.251, 0.827, 0.001, R).
