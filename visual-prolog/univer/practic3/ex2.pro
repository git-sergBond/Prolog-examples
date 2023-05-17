% Индивидуальное задание 2. Составить программу для вычисления функций 
% А = А(x, y, z) и В = В(x, y, z)

predicates
a(real, real, real)
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
 	
a(X, Y, R) :- R = X+Y.
b(X, Z, R) :- 
	X > Z, 
	asin(Z, A),
	R = X + A.

goal 
b(8.367, 0.001, R).
