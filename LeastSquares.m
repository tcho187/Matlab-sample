function [ c,err ] = LeastSquares( Nchoice, x ,y )
narginchk(3,3)
%checks that Nchoice is a positive integer between 1&3
if Nchoice==1 | Nchoice==2 | Nchoice==3
else
    error('Nchoice must be between 1&3')
end

% Checks if x & y have same length
n=length(x);
m=length(y);
if n~=m
    error('x and y must have same length')
end

% Checks if x contains positive integers & y contains non-negative integers
   if x~= round(x) | x<=0
       error('x must contain only positive integers')
   end
   if y~=round(y) | x<0
       error('y must contain only non-negative integers')
   end
   
1 = c0 + c1x + c2 sin( (pi/10)(2x + 5))
2= y = c0 + c1x + c2x 2 + c3x
3


end

