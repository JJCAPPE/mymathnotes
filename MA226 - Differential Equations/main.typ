#import "lib.typ": *

#show: template.with(
  title: [MA226: Differential Equations],
  short_title: "MA226",
  description: [
    Lecture notes for Differential Equations
  ],
  date: datetime.today(),
  authors: (
    (
      name: "Giacomo Cappelletto",
      // link: "https://your-website.com", // Uncomment and add your link if desired
    ),
  ),
  
  lof: true,  // Uncomment for list of figures
  // lot: true,  // Uncomment for list of tables  
  // lol: true,  // Uncomment for list of listings
  paper_size: "a4",
  // landscape: true,  // Uncomment for landscape orientation
  cols: 1,
  text_font: "STIX Two Text",
  code_font: "Cascadia Mono",
  accent: "#DC143C", // Crimson red - change to your preferred color
  // Use chapters as the top-level unit
  h1-prefix: "Chapter",
  colortab: false,
)

= First-Order Differential Equations

First-order differential equations involve derivatives up to the first derivative only. These form the foundation for understanding more complex differential equations and are ubiquitous in mathematical modeling.

== Three Approaches to Solving Differential Equations

There are three fundamental approaches to tackling differential equations, each with its own strengths:

#definition[Three Solution Approaches][
  1. *Analytic* → Formula or equation (exact solutions)
  2. *Qualitative* → Sketches, describe behavior (understanding without solving)  
  3. *Numerical* → Computing (approximate solutions using algorithms)
]

#note[Choosing the Right Approach][
  - Use *analytic* methods when exact solutions are needed and the equation is solvable
  - Use *qualitative* methods to understand long-term behavior and stability
  - Use *numerical* methods when analytic solutions are impossible or impractical
]

== Modeling

Mathematical modeling with differential equations follows a systematic approach to translate real-world phenomena into mathematical language.

=== Types of Models

- *Simple models*: Easy to analyze; describe the dominant interactions
- *Complex models*: Capture behavior over a wider domain; less general

=== Model Building Process

Model building typically follows three steps:
1. *State assumptions* clearly (with units for all quantities)
2. *Define variables and parameters* WITH UNITS
3. *Use assumptions* to derive equations relating the variables

#example[Population Modeling][
  *Target*: Population of rabbits $P(t)$ as a function of time $t$ (years).
  
  *Key Assumption*: The rate of change of population is proportional to the current population size.
  
  *Mathematical Model*:
  $ frac(upright(d)P,upright(d)t) = k P $
  
  where $k$ is the growth coefficient (constant parameter).
]

== Fundamental Definitions

#definition[Solution and General Solution][
  A function is a *solution* of a differential equation on an interval if, when substituted into the equation, it satisfies the equality for every point in that interval. 
  
  A *general solution* contains an arbitrary constant (or constants). Determining the constant(s) from given data yields a *particular solution*.
]

#definition[Initial Value Problem (IVP)][
  A differential equation together with an initial condition such as $P(t_0) = P_0$. 
  
  Solving the IVP means finding the unique solution that satisfies both the equation and the initial condition on an interval.
]

== Exponential Growth and Decay

=== Solving the Basic Growth Model

Consider the differential equation $frac(upright(d)P,upright(d)t) = k P$.

*Solution Strategy*: Guess that $P(t) = C e^{k t}$ for some constant $C$.

*Verification*: 
$ frac(upright(d),upright(d)t)(C e^{k t}) = C dot k e^{k t} = k (C e^{k t}) = k P $

Therefore, $P(t) = C e^{k t}$ is indeed a solution to our differential equation.

#note[General Solution][
  Since $C$ is arbitrary, $P(t) = C e^{k t}$ represents the *general solution* to $frac(upright(d)P,upright(d)t) = k P$.
  
  The sign of $k$ determines the behavior:
  - If $k > 0$: exponential growth
  - If $k < 0$: exponential decay
]

=== Finding Particular Solutions

#example[Complete Solution Process][
  *Problem*: Solve $P' = k P$ with initial conditions $P(0) = 32$ and $P(3) = 47$.
  
  *Step 1*: Start with general solution $P(t) = C e^{k t}$
  
  *Step 2*: Apply first condition $P(0) = 32$
  $ P(0) = C e^{k dot 0} = C e^0 = C = 32 $
  
  So $C = 32$, giving us $P(t) = 32 e^{k t}$.
  
  *Step 3*: Apply second condition $P(3) = 47$
  $ P(3) = 32 e^{3k} = 47 $
  $ e^{3k} = frac(47,32) $
  $ 3k = ln(frac(47,32)) $
  $ k = frac(1,3) ln(frac(47,32)) $
  
  *Final Answer*: $P(t) = 32 e^{frac(1,3) ln(47/32) dot t}$
]

#note[Growth vs. Decay Analysis][
  - If $k > 0$, then $P$ increases exponentially
  - If $k < 0$, then $P$ decreases exponentially  
  - The time constant $1/|k|$ sets the natural timescale of change
  
  For our example: $k = frac(1,3) ln(frac(47,32)) ≈ 0.121 > 0$, so we have exponential growth.
]

== Equilibrium Solutions

#definition[Equilibrium Solution][
  A constant solution $y(t) equiv y_*$ such that $y'(t) = 0$ for all $t$ in an interval. 
  
  Equilibria correspond to values of $y$ where the right-hand side of $y' = f(t,y)$ is zero for all $t$.
]

#example[Finding Equilibrium Solutions][
  Consider the differential equation:
  $ y' = frac((y+2)(y-3)(t-5),(y+7)) $
  
  For an equilibrium solution $y(t) equiv y_*$, we need the right-hand side to be zero for all $t$.
  
  *Analysis*: The right-hand side equals zero when the numerator is zero (and the denominator is non-zero).
  
  The numerator $(y+2)(y-3)(t-5) = 0$ when:
  - $y + 2 = 0 arrow.r y = -2$
  - $y - 3 = 0 arrow.r y = 3$  
  - $t - 5 = 0$ (but this depends on $t$, so doesn't give a constant solution)
  
  *Verification*: Both $y = -2$ and $y = 3$ make the denominator $y + 7$ non-zero.
  
  *Answer*: $y equiv -2$ and $y equiv 3$ are equilibrium solutions.
]

#attention[Important Note][
  $y equiv -7$ is NOT a solution because it makes the right-hand side undefined (division by zero).
]

== Key Insights and Intuition

#note[Why Exponential Solutions Work][
  The exponential function $e^{k t}$ has the special property that its derivative is proportional to itself:
  $ frac(upright(d),upright(d)t) e^{k t} = k e^{k t} $
  
  This makes it the natural solution to equations of the form $y' = k y$.
]

#note[Physical Interpretation][
  - *Population growth*: When resources are abundant, growth rate $tilde$ current population
  - *Radioactive decay*: Decay rate $tilde$ current amount of material  
  - *Bank interest*: Continuous compounding gives exponential growth
  - *Cooling*: Newton's law of cooling (with modifications)
]

