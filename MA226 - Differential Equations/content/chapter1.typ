// Chapter 1 — First-Order Differential Equations

== First-Order Differential Equations

In this chapter we begin with basic modeling ideas, the exponential growth/decay model, and the notion of equilibrium solutions. The goal is to set up a clean workflow for solving and interpreting simple first‑order differential equations.

=== Modeling

- Simple models: easy to analyze; describe the dominant interactions.
- Complex models: capture behavior over a wider domain; less general.

Model building typically follows three steps:
1. State assumptions clearly (with units for all quantities).
2. Define variables and parameters.
3. Use the assumptions to derive equations relating the variables.

Example modeling target: population of rabbits P(t) as a function of time t (years). A common first assumption is that the rate of change of population is proportional to the current population size.

$\frac{dP}{dt} = k\,P$ where k is the growth coefficient (constant parameter).

#definition[Solution and general solution]
  A function is a solution of a differential equation on an interval if, when substituted into the equation, it satisfies the equality for every point in that interval. A general solution contains an arbitrary constant (or constants). Determining the constant(s) from given data yields a particular solution.

#definition[Initial value problem (IVP)]
  A differential equation together with an initial condition such as $P(t_0)=P_0$. Solving the IVP means finding the unique solution that satisfies both the equation and the initial condition on an interval.

=== Exponential Growth/Decay

Consider the DE $\dfrac{dP}{dt} = kP$. Guess $P(t)=C e^{kt}$. Then

$\dfrac{d}{dt}\big(C e^{kt}\big) = k C e^{kt} = k P,$

so $P(t)=C e^{kt}$ is indeed a solution. Because C is arbitrary, this is the general solution. The sign of k determines behavior: k>0 gives exponential growth, k<0 gives exponential decay.

#note[Growth vs. decay]
  If $k>0$, then $P$ increases exponentially; if $k<0$, then $P$ decreases exponentially. The time constant $1/|k|$ sets the natural timescale of change.

#example[Finding a particular solution]
  Solve $P' = kP$ subject to $P(0)=32$ and $P(3)=47$.

  General solution: $P(t)=C e^{kt}$. From $P(0)=32$ we get $C=32$.
  Using $P(3)=47$:
  $47 = 32 e^{3k} \;\Rightarrow\; k = \tfrac{1}{3}\ln\!\left(\tfrac{47}{32}\right)$.

  Therefore the particular solution is
  $P(t) = 32\, e^{\left(\tfrac{1}{3}\ln(47/32)\right) t}$.

=== Equilibrium Solutions

#definition[Equilibrium solution]
  A constant solution $y(t)\equiv y_*$ such that $y'(t)=0$ for all $t$ in an interval. Equilibria correspond to values of $y$ where the right‑hand side of $y'=f(t,y)$ is zero for all $t$.

#example[Identifying equilibria]
  For
  $y' = \dfrac{(y+2)(y-3)(t-5)}{(y+7)}$,
  any constant solution must make the right‑hand side identically zero for all $t$. This occurs when the $y$‑dependent factor in the numerator vanishes: $y=-2$ or $y=3$. Thus $y\equiv-2$ and $y\equiv3$ are equilibrium solutions. (Note that $y\equiv-7$ is not a solution because the right‑hand side is undefined.)

// End Chapter 1

