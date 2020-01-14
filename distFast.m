function [d] = distFast(a,b)
% DISTFAST - computes Euclidean distance matrix 
%两个列向量的距离矩阵
% d = disFast(a,b)
%
%    a - (MxD) matrix 
%    b - (NxD) matrix (optional, if absent then b=a)
%
% d = disFast(a) runs d = disFast(a,a)
%
% Returns:
%    d - (MxN) Euclidean distances between vectors in A and B
%
%
% Description : 
%    This fully vectorized (VERY FAST!) m-file computes the 
%    Euclidean distance between two vectors by:
%
%                 ||A-B|| = sqrt ( ||A||^2 + ||B||^2 - 2*A.B )
%
% Example : 
%    A = rand(400,100); B = rand(400,200);
%    d = distFast(A,B);
%    distFast(A)=distFast(A,A);

% Author   : Roland Bunschoten
%            University of Amsterdam
%            Intelligent Autonomous Systems (IAS) group
%            Kruislaan 403  1098 SJ Amsterdam
%            tel.(+31)20-5257524
%            bunschot@wins.uva.nl
% Last Rev : Oct 19 12:16 2006 by Michael Aupetit


% Copyright notice: You are free to modify, extend and distribute 
%    this code granted that the author of the original code is 
%    mentioned as the original author of the code.

if (nargin == 1)
   b=a; 
elseif (nargin ~= 2)
   error('Not enough input arguments');
end

if (size(a,2) ~= size(b,2))
   error('A and B should be of same dimensionality');
end
d = single(pdist2(a,b));
