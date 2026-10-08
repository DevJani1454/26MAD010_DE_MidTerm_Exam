import numpy as np

x = np.array([[2, 10], [4, 20], [6, 30]])

column_min = np.min(x, axis=0)
column_max = np.max(x, axis=0)
normalized = (x - column_min) / (column_max - column_min)

print(normalized)


# output:
# (base) PS C:\Users\devjj\OneDrive\Desktop\DE_Midsem exam> python B2.py
# [[0.  0. ]
#  [0.5 0.5]
#  [1.  1. ]]