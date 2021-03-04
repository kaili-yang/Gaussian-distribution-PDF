# Author: Yang kaili
# Date: 2021-3-4
# Gaussian distribution PDF, along with its first and second derivatives 

import numpy as np
from matplotlib import pyplot as plt
from scipy.stats import norm
from scipy.misc import derivative

domain = np.linspace(-5, 5, 1000)

def f(domain):
    return norm.pdf(domain, 0, 1)

d0 = norm.pdf(domain, 0, 1)
d1 = derivative(f, domain, dx=1e-6)
d2 = derivative(f, domain, dx=1e-6, n=2)

plt.plot(domain, d0, 'b', label='Standard PDF')
plt.plot(domain, d1, 'r', label='The Derivative of PDF')
plt.plot(domain, d2, 'g', label='Second Derivative of PDF')
plt.title('Standard pdf and its the derivative, second derivative')
plt.xlabel('Value')
plt.ylabel('Density')
plt.plot([-5, 5], [0, 0], 'k')

plt.legend()
plt.show()
