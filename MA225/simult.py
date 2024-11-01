from sympy import symbols, Eq, solve

# Define the variables
l,w  = symbols('l w')

# Define the equations based on partial derivatives
equation1 = Eq(l -216*(w**-2), 0)
equation2 = Eq(w -216*(l**-2), 0)

# Solve the system of equations
solutions = solve((equation1, equation2), (l, w))
print(solutions)