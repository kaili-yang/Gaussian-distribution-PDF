% Author: Yang kaili
% Date: 2021-3-4
% Gaussian distribution PDF, along with its first and second derivatives 

pkg load statistics;
clear all;
close all;
clc;

% calculate by package statistics
% line1 = stdnormal_pdf(x);
% calculate manually
% Normal Distribution PDF Mathematica Code: 1/(sigma*sqrt(2*pi))*e^(-(x-mu)^2/(2*sigma^2))
% sigma = 1, mu=0
function line1 = gaussian(x)
  line1 = 1/(sqrt(2*pi))*exp(-x.^2/2)
endfunction

function line2 = ndpdfFirstDerivative(x)
  line2 = gaussian(x)*(-x)
endfunction

function line3 = ndpdfSecondDerivative(x)
  line3 = ((x^2) - 1)*gaussian(x)
endfunction

data1 = []
data2 = []
data3 = []

x = -5:0.1:5;
for i = x
  line1 = gaussian(i)
  data1 = [data1, line1]
  
  line2 = ndpdfFirstDerivative(i)
  data2 = [data2, line2]
  
  line3 = ndpdfSecondDerivative(i)
  data3 = [data3, line3]
endfor

grid on;
axis equal;
xlabel ('p');
ylabel ('Q(p)');
axis([-5 5 -5 5]);
title('Gaussian distribution PDF');
plot(x, data1, 'r', x, data2, 'g', x, data3, 'b');
legend('Gaussian', 'ndpdfFirstDerivative', 'ndpdfSecondDerivative');
print -dpng 'Gaussian distribution PDF.png'
