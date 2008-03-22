function J = imup(I)
% IMUP  Downsample an image 
%   J=IMUP(I) doubles the resolution of the image I by bilinear
%   interpolation.
%
%   See also:: IMDOWN(), HELP_VLFEAT().

% AUTORIGHTS
% Copyright 2007 (c) Andrea Vedaldi and Brian Fulkerson
% 
% This file is part of VLFeat, available in the terms of the GNU
% General Public License version 2.

[M,N,K] = size(I) ;

J = zeros(2*M,2*N,K) ;

J(1:2:end,1:2:end,:) = I ;

J(2:2:end,1:2:end,:) = 0.5*(I+[I(2:end,:,:);I(end,:,:)]) ;
J(1:2:end,2:2:end,:) = 0.5*(I+[I(:,2:end,:),I(:,end,:)]) ;
J(2:2:end,2:2:end,:) = ...
  0.25*(...
  J(2:2:end,1:2:end-1,:)+...
  J(1:2:end-1,2:2:end,:)+...
  [J(2:2:end,3:2:end,:),J(2:2:end,end-1,:)]+...
  [J(3:2:end,2:2:end,:);J(end-1,2:2:end,:)]) ;
