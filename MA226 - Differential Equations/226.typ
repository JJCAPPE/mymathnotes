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

  lof: true, // Uncomment for list of figures
  // lot: true,  // Uncomment for list of tables
  // lol: true,  // Uncomment for list of listings
  paper_size: "a4",
  // landscape: true,  // Uncomment for landscape orientation
  cols: 1,
  text_font: "STIX Two Text",
  code_font: "Menlo",
  accent: "#DC143C", // Crimson red - change to your preferred color
  // Use chapters as the top-level unit
  h1-prefix: "Chapter",
  colortab: false,
)

= First-Order Differential Equations

First-order differential equations involve derivatives up to the first derivative only. These form the foundation for understanding more complex differential equations and are ubiquitous in mathematical modeling.

== Modeling and Basic Differential Equations

=== Three Approaches to Solving Differential Equations

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

=== Modeling

Mathematical modeling with differential equations follows a systematic approach to translate real-world phenomena into mathematical language.

==== Types of Models

- *Simple models*: Easy to analyze; describe the dominant interactions
- *Complex models*: Capture behavior over a wider domain; less general

==== Model Building Process

Model building typically follows three steps:
1. *State assumptions* clearly (with units for all quantities)
2. *Define variables and parameters* WITH UNITS
3. *Use assumptions* to derive equations relating the variables

#example[Population Modeling][
  *Target*: Population of rabbits $P(t)$ as a function of time $t$ (years).

  *Key Assumption*: The rate of change of population is proportional to the current population size.

  *Mathematical Model*:
  $ frac(upright(d)P, upright(d)t) = k P $

  where $k$ is the growth coefficient (constant parameter).
]

=== Fundamental Definitions

#definition[Solution and General Solution][
  A function is a *solution* of a differential equation on an interval if, when substituted into the equation, it satisfies the equality for every point in that interval.

  A *general solution* contains an arbitrary constant (or constants). Determining the constant(s) from given data yields a *particular solution*.
]

#definition[Initial Value Problem (IVP)][
  A differential equation together with an initial condition such as $P(t_0) = P_0$.

  Solving the IVP means finding the unique solution that satisfies both the equation and the initial condition on an interval.
]

=== Exponential Growth and Decay

==== Solving the Basic Growth Model

Consider the differential equation $frac(upright(d)P, upright(d)t) = k P$.

*Solution Strategy*: Guess that $P(t) = C e^{k t}$ for some constant $C$.

*Verification*:
$ frac(upright(d), upright(d)t)(C e^{k t}) = C dot k e^{k t} = k (C e^{k t}) = k P $

Therefore, $P(t) = C e^{k t}$ is indeed a solution to our differential equation.

#note[General Solution][
  Since $C$ is arbitrary, $P(t) = C e^{k t}$ represents the *general solution* to $frac(upright(d)P, upright(d)t) = k P$.

  The sign of $k$ determines the behavior:
  - If $k > 0$: exponential growth
  - If $k < 0$: exponential decay
]

==== Finding Particular Solutions

#example[Complete Solution Process][
  *Problem*: Solve $P' = k P$ with initial conditions $P(0) = 32$ and $P(3) = 47$.

  *Step 1*: Start with general solution $P(t) = C e^{k t}$

  *Step 2*: Apply first condition $P(0) = 32$
  $ P(0) = C e^{k dot 0} = C e^0 = C = 32 $

  So $C = 32$, giving us $P(t) = 32 e^{k t}$.

  *Step 3*: Apply second condition $P(3) = 47$
  $ P(3) = 32 e^{3k} = 47 $
  $ e^{3k} = frac(47, 32) $
  $ 3k = ln(frac(47, 32)) $
  $ k = frac(1, 3) ln(frac(47, 32)) $

  *Final Answer*: $P(t) = 32 e^{frac(1, 3) ln(47/32) dot t}$
]

#note[Growth vs. Decay Analysis][
  - If $k > 0$, then $P$ increases exponentially
  - If $k < 0$, then $P$ decreases exponentially
  - The time constant $1/|k|$ sets the natural timescale of change

  For our example: $k = frac(1, 3) ln(frac(47, 32)) ≈ 0.121 > 0$, so we have exponential growth.
]

=== The Logistic Population Model

The simple exponential model $P' = r P$ assumes unlimited resources, leading to unrealistic infinite growth. The **logistic model** accounts for resource limitations and carrying capacity.

#definition[Logistic Equation][
  $ frac(upright(d)P, upright(d)t) = r P (1 - frac(P, K)) $

  where:
  - $P(t)$: population size
  - $r > 0$: intrinsic growth rate
  - $K > 0$: carrying capacity (maximum sustainable population)
]

#note[Key Insights][
  *Per-capita growth rate*: $frac(1, P) frac(upright(d)P, upright(d)t) = r(1 - frac(P, K))$

  - When $P approx 0$: growth rate ≈ $r$ (nearly exponential)
  - When $P = K$: growth rate = 0 (no growth at capacity)
  - Growth decreases linearly with population density $P/K$
]

==== Solution and Behavior

#example[Logistic Solution][
  The closed-form solution with initial condition $P(0) = P_0 > 0$ is:

  $ P(t) = frac(K, 1 + (frac(K - P_0, P_0)) e^(-r t)) $

  This produces the characteristic **S-shaped (sigmoidal) curve**:
  1. *Initial phase*: Nearly exponential growth when $P << K$
  2. *Transition phase*: Growth slows as resources become limited
  3. *Saturation phase*: Population levels off at carrying capacity $K$
]

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    canvas(length: 0.6cm, {
      // Set up the plot area
      let width = 12
      let height = 8
      let x-min = 0
      let x-max = 6
      let y-min = 0
      let y-max = 110

      // Draw axes
      draw.line((0, 0), (width, 0), stroke: black)
      draw.line((0, 0), (0, height), stroke: black)

      // Function to convert data coordinates to canvas coordinates
      let to-canvas = (x, y) => (
        x * width / (x-max - x-min),
        y * height / (y-max - y-min),
      )

      // Parameters
      let K = 100.0
      let r = 1.2

      // Logistic function
      let logistic = (t, P0) => K / (1.0 + ((K - P0) / P0) * calc.exp(-r * t))

      // Generate points for curves
      let n-points = 50
      let t-step = x-max / n-points

      // Plot logistic curves for different initial conditions
      let initial-pops = (5, 15, 40, 85)
      let colors = (blue, green, orange, purple)

      for (i, P0) in initial-pops.enumerate() {
        let points = ()
        for j in range(n-points + 1) {
          let t = j * t-step
          let P = logistic(t, P0)
          points.push(to-canvas(t, P))
        }

        // Draw the curve
        for j in range(points.len() - 1) {
          draw.line(points.at(j), points.at(j + 1), stroke: (paint: colors.at(i), thickness: 2pt))
        }
      }

      // Draw carrying capacity line
      let K-line-start = to-canvas(0, K)
      let K-line-end = to-canvas(x-max, K)
      draw.line(K-line-start, K-line-end, stroke: (paint: red, thickness: 2pt, dash: "dashed"))

      // Draw exponential comparison (for first 3 time units)
      let exp-points = ()
      for j in range(26) {
        let t = j * 3.0 / 25
        let P = 5 * calc.exp(r * t)
        if P <= y-max {
          exp-points.push(to-canvas(t, P))
        }
      }
      for j in range(exp-points.len() - 1) {
        draw.line(exp-points.at(j), exp-points.at(j + 1), stroke: (paint: gray, thickness: 2pt, dash: "dotted"))
      }

      // Add axis labels and ticks
      for i in range(7) {
        let x-pos = i * width / 6
        draw.line((x-pos, -0.1), (x-pos, 0.1), stroke: black)
        draw.content((x-pos, -0.4), str(i), anchor: "center")
      }

      for i in range(6) {
        let y-val = i * 20
        let y-pos = i * height / 5
        draw.line((-0.1, y-pos), (0.1, y-pos), stroke: black)
        draw.content((-0.4, y-pos), str(y-val), anchor: "center")
      }

      // Labels
      draw.content((width / 2, -1), [Time $t$], anchor: "center")
      draw.content((-1.5, height / 2), [Population $P(t)$], anchor: "center", angle: 90deg)

      // Legend and annotations
      draw.content(
        (width - 2, height - 1),
        [$K = 100$ (carrying capacity)],
        anchor: "center",
        frame: "rect",
        fill: white,
        stroke: red,
      )

      draw.content((2, height - 1.5), [Exponential], anchor: "center", frame: "rect", fill: white, stroke: none)
      draw.content((2, height - 2), [(comparison)], anchor: "center", frame: "rect", fill: white, stroke: none)

      // Mark inflection point
      let t-inf = calc.ln(17) / r
      let P-inf = K / 2
      let inf-point = to-canvas(t-inf, P-inf)
      draw.circle(inf-point, radius: 3pt, fill: red, stroke: red)
      draw.content((inf-point.at(0) + 1, inf-point.at(1) - 0.5), [Inflection], anchor: "west")
      draw.content((inf-point.at(0) + 1, inf-point.at(1) - 0.9), [$P = K/2$], anchor: "west")

      // Legend for curves
      let legend-x = width - 3
      let legend-colors = (blue, green, orange, purple)
      let legend-labels = ("P₀ = 5", "P₀ = 15", "P₀ = 40", "P₀ = 85")

      for (i, label) in legend-labels.enumerate() {
        let y-pos = 2 + i * 0.6
        draw.line((legend-x - 0.5, y-pos), (legend-x - 0.1, y-pos), stroke: (
          paint: legend-colors.at(i),
          thickness: 2pt,
        ))
        draw.content((legend-x, y-pos), label, anchor: "west")
      }
    })
  },
  caption: [Logistic growth curves showing the characteristic S-shape for different initial populations. The red dashed line shows the carrying capacity K = 100. All logistic curves approach this limit, while the exponential curve (gray, dotted) grows without bound. The inflection point occurs at P = K/2.],
)

==== Harvesting Models

Real populations often face removal through harvesting, hunting, or fishing. We can modify the logistic model by subtracting a harvesting term $H(P)$ from the natural growth rate.

#example[Fish Population with Harvesting][
  *Base Model*: Consider a fish population with logistic growth:
  $ frac(upright(d)P, upright(d)t) = k(1 - frac(P, N))P $

  where $k$ is the growth rate and $N$ is the carrying capacity.

  *With Harvesting*: We subtract the harvest rate to get:
  $ frac(upright(d)P, upright(d)t) = k(1 - frac(P, N))P - H(P) $

  The form of $H(P)$ depends on the harvesting strategy:

  **(a) Constant Harvesting**: 100 fish removed per year

  This represents **constant-rate removal** that doesn't depend on population size.
  $ H(P) = 100 $
  $ frac(upright(d)P, upright(d)t) = k(1 - frac(P, N))P - 100 $

  *Why this form?* The ODE assumes **continuous removal** at a rate of 100 fish per year. If harvesting happened as a discrete once-per-year event, we would need an impulsive model instead.

  **(b) Proportional Harvesting**: One-third of population harvested annually

  This is a **rate proportional to** $P$, where the harvest rate increases with population size.
  $ H(P) = frac(1, 3)P $
  $ frac(upright(d)P, upright(d)t) = k(1 - frac(P, N))P - frac(P, 3) $

  *Why this form?* The coefficient $frac(1, 3)$ has units of $text("year")^(-1)$, making $H(P)$ have the correct dimensions of fish/year. This models scenarios where harvesting effort scales with population abundance.

  **(c) Square-Root Harvesting**: Harvest proportional to $sqrt(P)$

  This represents a **nonlinear harvest rate** that's less aggressive than proportional harvesting.
  $ H(P) = a sqrt(P) quad text("where") a > 0 $
  $ frac(upright(d)P, upright(d)t) = k(1 - frac(P, N))P - a sqrt(P) $

  *Why this form?* The parameter $a$ has units of $text("fish")^(1/2) / text("year")$ to ensure dimensional consistency. This might model situations where harvesting becomes less efficient at higher population densities, or where there are diminishing returns to fishing effort.
]

#note[Key Insights on Harvesting][
  *Dimensional Analysis*:
  - Each $H(P)$ term has units of fish/year, matching $frac(upright(d)P, upright(d)t)$
  - Case (a): $H = 100$ has units fish/year directly
  - Case (b): $frac(1, 3) text("year")^(-1) times P text("fish") = text("fish/year")$
  - Case (c): $a text("fish")^(1/2) / text("year") times sqrt(P) text("fish")^(1/2) = text("fish/year")$

  *Continuous vs. Discrete Models*:
  - Our ODEs assume **continuous removal** throughout the year
  - Real harvesting often occurs in discrete seasons (impulsive events)
  - The choice depends on the timescale of interest and harvesting patterns

  *Equilibrium Effects*:
  - **Constant-rate removal** can eliminate equilibria if harvest exceeds maximum growth rate
  - **Proportional harvesting** reduces effective growth rate: $k - frac(1, 3)$
  - **Nonlinear harvesting** creates complex equilibrium structures

  *Extinction Thresholds*: Excessive harvesting creates minimum viable population sizes below which extinction occurs.

  *Management Implications*: Different harvesting strategies require different sustainability criteria and have distinct economic trade-offs.
]

==== Predator-Prey Systems with Logistic Growth

The logistic model also appears in multi-species interactions. Predator-prey systems often incorporate logistic growth for the prey species to account for resource limitations.

#example[Predator-Prey System Analysis][
  Consider the system:
  $ frac(upright(d)x, upright(d)t) = alpha x - alpha frac(x^2, N) - beta x y $
  $ frac(upright(d)y, upright(d)t) = gamma y + delta x y $

  where all parameters $alpha, beta, gamma, delta, N > 0$.

  *Algebraic Simplification*: The prey equation can be rewritten as:
  $ frac(upright(d)x, upright(d)t) = alpha x - alpha frac(x^2, N) - beta x y = alpha x (1 - frac(x, N)) - beta x y $

  This shows the prey follows **logistic growth** when alone, modified by predation.

  *Species Identification*:

  **$x$ is the prey population**:
  - Natural growth: $+alpha x$ (exponential when small)
  - Self-limitation: $-alpha frac(x^2, N)$ (resource competition/crowding)
  - Predation loss: $-beta x y$ (removed by encounters with predators)

  **$y$ is the predator population**:
  - Benefits from encounters: $+delta x y$ (conversion of prey to predators)
  - Alternative food source: $+gamma y$ (growth independent of prey)
]

#note[Biological Interpretation][
  *Is prey growth limited by factors other than predators?*

  **Yes**. The term $-alpha frac(x^2, N)$ represents logistic self-limitation due to:
  - Finite resources (food, territory, nesting sites)
  - Carrying capacity $N$ for the environment
  - Competition among prey individuals

  Even with no predators ($y = 0$), prey follows: $frac(upright(d)x, upright(d)t) = alpha x(1 - frac(x, N))$

  *Do predators have other food sources?*

  **Yes**. The term $+gamma y$ means predators grow even without prey ($x = 0$):
  $ frac(upright(d)y, upright(d)t) = gamma y > 0 $

  This could represent:
  - Alternative food sources not modeled explicitly
  - Immigration from other regions
  - Baseline growth rate from other resources
]

#attention[Equilibria and Stability][
  Setting $frac(upright(d)P, upright(d)t) = 0$:

  - $P^* = 0$: *Unstable* equilibrium (any $P_0 > 0$ grows away from zero)
  - $P^* = K$: *Stable* equilibrium (all solutions approach carrying capacity)

  *Maximum growth* occurs at $P = K/2$ with rate $frac(r K, 4)$.
]

#note[Real-World Applications][
  - *Population ecology*: Animal populations in limited habitats
  - *Epidemiology*: Disease spread with finite susceptible population
  - *Technology adoption*: Market saturation models
  - *Resource management*: Sustainable harvesting strategies
]

=== Equilibrium Solutions

#definition[Equilibrium Solution][
  A constant solution $y(t) equiv y_*$ such that $y'(t) = 0$ for all $t$ in an interval.

  Equilibria correspond to values of $y$ where the right-hand side of $y' = f(t,y)$ is zero for all $t$.
]

#example[Finding Equilibrium Solutions][
  Consider the differential equation:
  $ y' = frac((y+2)(y-3)(t-5), (y+7)) $

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

=== Key Insights and Intuition

#note[Why Exponential Solutions Work][
  The exponential function $e^{k t}$ has the special property that its derivative is proportional to itself:
  $ frac(upright(d), upright(d)t) e^{k t} = k e^{k t} $

  This makes it the natural solution to equations of the form $y' = k y$.
]

#note[Physical Interpretation][
  - *Population growth*: When resources are abundant, growth rate $\sim$ current population
  - *Radioactive decay*: Decay rate $\sim$ current amount of material
  - *Bank interest*: Continuous compounding gives exponential growth
  - *Cooling*: Newton's law of cooling (with modifications)
]

== Separable Differential Equations

Separable differential equations are a special class of first-order differential equations that can be solved by separating variables and integrating both sides.

#definition[Separable Differential Equation][
  A first-order differential equation is *separable* if it can be written in the form:
  $ frac(upright(d)y, upright(d)t) = g(t) h(y) $

  where $g(t)$ is a function of $t$ only, and $h(y)$ is a function of $y$ only.
]

#note[Solution Strategy][
  To solve a separable equation $frac(upright(d)y, upright(d)t) = g(t) h(y)$:

  1. *Separate variables*: $frac(upright(d)y, h(y)) = g(t) upright(d)t$
  2. *Integrate both sides*: $integral frac(upright(d)y, h(y)) = integral g(t) upright(d)t$
  3. *Solve for y* (if possible)
  4. *Apply initial conditions* to find particular solutions
]

=== Basic Examples

#example[Simple Exponential Growth][
  *Problem*: Solve $y' = 2y$

  *Step 1*: Recognize this is separable with $g(t) = 2$ and $h(y) = y$

  *Step 2*: Separate variables
  $ frac(upright(d)y, y) = 2 upright(d)t $

  *Step 3*: Integrate both sides
  $ integral frac(upright(d)y, y) = integral 2 upright(d)t $
  $ ln|y| = 2t + C_1 $

  *Step 4*: Solve for $y$
  $ |y| = e^(2t + C_1) = e^(C_1) e^(2t) $

  Since $e^(C_1) > 0$, we can write $|y| = C e^(2t)$ where $C > 0$.

  *Step 5*: Consider both positive and negative solutions
  $ y = ± C e^(2t) $

  *Final Answer*: $y = C e^(2t)$ where $C$ can be any real constant (including negative values and zero).
]

#attention[Non-Separable Counter Example][
  *Problem*: Is $y' = t + y$ separable?

  *Analysis*: We need to write this as $frac(upright(d)y, upright(d)t) = g(t) h(y)$.

  We have $frac(upright(d)y, upright(d)t) = t + y$. For this to be separable, we need:
  $ t + y = g(t) dot h(y) $

  But $t + y$ cannot be factored into a product of a function of $t$ only and a function of $y$ only.

  *Conclusion*: This equation is NOT separable and requires different solution methods.
]

=== More Complex Examples

#example[Polynomial Growth Factor][
  *Problem*: Solve $y' = t^4 y$

  *Step 1*: This is separable with $g(t) = t^4$ and $h(y) = y$

  *Step 2*: Separate variables
  $ frac(upright(d)y, y) = t^4 upright(d)t $

  *Step 3*: Integrate both sides
  $ integral frac(upright(d)y, y) = integral t^4 upright(d)t $
  $ ln|y| = frac(t^5, 5) + C_1 $

  *Step 4*: Solve for $y$
  $ |y| = e^(frac(t^5, 5) + C_1) = e^(C_1) e^(frac(t^5, 5)) $

  *Final Answer*: $y = C e^(frac(t^5, 5))$ where $C$ is an arbitrary constant.

  *Note*: The growth becomes extremely rapid for large $|t|$ due to the $t^5$ term in the exponent.
]

#example[Linear Decay Model][
  *Problem*: Solve $y' = 2 - y$

  *Step 1*: Rewrite as $frac(upright(d)y, upright(d)t) = 2 - y = -(y - 2)$

  This is separable with $g(t) = -1$ and $h(y) = y - 2$.

  *Step 2*: Separate variables
  $ frac(upright(d)y, y - 2) = -upright(d)t $

  *Step 3*: Integrate both sides
  $ integral frac(upright(d)y, y - 2) = integral (-1) upright(d)t $
  $ ln|y - 2| = -t + C_1 $

  *Step 4*: Solve for $y$
  $ |y - 2| = e^(-t + C_1) = e^(C_1) e^(-t) $
  $ y - 2 = ± e^(C_1) e^(-t) = C e^(-t) $

  *Final Answer*: $y = C e^(-t) + 2$

  *Physical Interpretation*: This represents exponential approach to the equilibrium value $y = 2$.

  *Visualization*: The figure below shows several solution curves for different initial conditions, all approaching the equilibrium line $y = 2$.
]

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    canvas(length: 0.6cm, {
      // Set up the plot area
      let width = 10
      let height = 7
      let x-min = 0
      let x-max = 4
      let y-min = -1
      let y-max = 5

      // Draw axes
      draw.line((0, 0), (width, 0), stroke: black)
      draw.line((0, 0), (0, height), stroke: black)

      // Function to convert data coordinates to canvas coordinates
      let to-canvas = (x, y) => (
        x * width / (x-max - x-min),
        (y - y-min) * height / (y-max - y-min),
      )

      // Generate points for curves
      let n-points = 40
      let t-step = x-max / n-points

      // Equilibrium line y = 2
      let eq-start = to-canvas(0, 2)
      let eq-end = to-canvas(x-max, 2)
      draw.line(eq-start, eq-end, stroke: (paint: red, thickness: 2pt, dash: "dashed"))

      // Solution curves: y = Ce^(-t) + 2
      let C-values = (2, 1, -1, -3) // for y(0) = 4, 3, 1, -1

      for C in C-values {
        let points = ()
        for j in range(n-points + 1) {
          let t = j * t-step
          let y = C * calc.exp(-t) + 2
          points.push(to-canvas(t, y))
        }

        // Draw the curve
        for j in range(points.len() - 1) {
          draw.line(points.at(j), points.at(j + 1), stroke: (paint: blue, thickness: 1.5pt))
        }
      }

      // Add axis labels and ticks
      for i in range(5) {
        let x-pos = i * width / 4
        draw.line((x-pos, -0.1), (x-pos, 0.1), stroke: black)
        draw.content((x-pos, -0.3), str(i), anchor: "center")
      }

      for i in range(7) {
        let y-val = i - 1
        let y-pos = (y-val - y-min) * height / (y-max - y-min)
        draw.line((-0.1, y-pos), (0.1, y-pos), stroke: black)
        draw.content((-0.3, y-pos), str(y-val), anchor: "center")
      }

      // Labels
      draw.content((width / 2, -0.8), [$t$], anchor: "center")
      draw.content((-0.8, height / 2), [$y$], anchor: "center", angle: 90deg)

      // Annotations
      draw.content(
        (width - 1, height - 0.5),
        [Solutions approach],
        anchor: "center",
        frame: "rect",
        fill: white,
        stroke: none,
      )
      draw.content(
        (width - 1, height - 0.9),
        [$y = 2$ equilibrium],
        anchor: "center",
        frame: "rect",
        fill: white,
        stroke: none,
      )

      // Arrow pointing to equilibrium line
      let arrow-start = to-canvas(3, 3.5)
      let arrow-end = to-canvas(3, 2.3)
      draw.line(arrow-start, arrow-end, mark: (end: ">"), stroke: red)
    })
  },
  caption: [Solution curves for $y' = 2-y$ with different initial conditions. All solutions exponentially approach the equilibrium $y = 2$ (red dashed line). Initial conditions: $y(0) = 4, 3, 1, -1$ respectively.],
)

=== Advanced Techniques

#example[Arctangent Integration][
  *Problem*: Solve $y' = 1 + x^2$ (treating $x$ as the independent variable)

  *Step 1*: This is separable: $frac(upright(d)y, upright(d)x) = 1 + x^2$

  *Step 2*: Since there's no $y$ dependence, we can integrate directly
  $ y = integral (1 + x^2) upright(d)x $
  $ y = x + frac(x^3, 3) + C $

  *Alternative form using arctangent*:
  If we had $frac(upright(d)y, upright(d)x) = frac(1, 1 + x^2)$, then:
  $ y = integral frac(upright(d)x, 1 + x^2) = arctan(x) + C $
]

#example[Partial Fractions Method][
  *Problem*: Solve $y' = 12 + 3x^2$ with more complex rational functions

  Consider the related problem: $frac(upright(d)y, upright(d)x) = frac(1, (2+x)(2-x)) = frac(1, 4-x^2)$

  *Step 1*: Use partial fractions decomposition
  $ frac(1, (2+x)(2-x)) = frac(A, 2+x) + frac(B, 2-x) $

  *Step 2*: Find constants $A$ and $B$
  $ 1 = A(2-x) + B(2+x) = 2A - A x + 2B + B x = (2A + 2B) + (-A + B)x $

  Comparing coefficients:
  - Constant term: $2A + 2B = 1$
  - Coefficient of $x$: $-A + B = 0$, so $A = B$

  From $A = B$ and $2A + 2B = 1$: $4A = 1$, so $A = B = frac(1, 4)$

  *Step 3*: Integrate
  $ y = integral (frac(1, 4) frac(1, 2+x) + frac(1, 4) frac(1, 2-x)) upright(d)x $
  $ y = frac(1, 4) ln|2+x| - frac(1, 4) ln|2-x| + C $
  $ y = frac(1, 4) ln|frac(2+x, 2-x)| + C $
]

#example[Initial Value Problem with Higher Powers][
  *Problem*: Solve $y' = t^2 y^3$ with $y(0) = 1$

  *Step 1*: Separate variables
  $ frac(upright(d)y, y^3) = t^2 upright(d)t $
  $ y^(-3) upright(d)y = t^2 upright(d)t $

  *Step 2*: Integrate both sides
  $ integral y^(-3) upright(d)y = integral t^2 upright(d)t $
  $ frac(y^(-2), -2) = frac(t^3, 3) + C_1 $
  $ -frac(1, 2y^2) = frac(t^3, 3) + C_1 $

  *Step 3*: Solve for $y$
  $ frac(1, 2y^2) = -frac(t^3, 3) - C_1 $
  $ frac(1, y^2) = -frac(2t^3, 3) - 2C_1 $

  Let $C = -2C_1$, then:
  $ frac(1, y^2) = -frac(2t^3, 3) + C $
  $ y^2 = frac(1, -frac(2t^3, 3) + C) $

  *Step 4*: Apply initial condition $y(0) = 1$
  $ 1^2 = frac(1, -frac(2(0)^3, 3) + C) = frac(1, C) $

  Therefore $C = 1$, and:
  $ y^2 = frac(1, 1 - frac(2t^3, 3)) = frac(3, 3 - 2t^3) $

  *Final Answer*: $y = ± sqrt(frac(3, 3 - 2t^3))$

  Since $y(0) = 1 > 0$, we take the positive square root:
  $ y = sqrt(frac(3, 3 - 2t^3)) $

  *Domain*: Solution is valid when $3 - 2t^3 > 0$, i.e., when $t^3 < frac(3, 2)$ or $t < root(3, frac(3, 2))$.
]

#note[Key Study Tips][
  1. *Always check separability first* - can you factor the right-hand side as $g(t)h(y)$?

  2. *Be careful with absolute values* in logarithmic integration - consider both positive and negative solutions

  3. *Watch the domain* - solutions may have restrictions based on denominators or square roots

  4. *Initial conditions determine the sign* and specific constant value

  5. *Partial fractions* are useful when $h(y)$ is a rational function with distinct linear factors
]

== Direction Fields (Slope Fields)

When we cannot solve a differential equation analytically, or when we want to understand the qualitative behavior of solutions without solving, **direction fields** (also called **slope fields**) provide invaluable geometric insight.

#definition[Direction Field][
  For a first-order differential equation $y' = f(t,y)$, the **direction field** is a visual representation where at each point $(t,y)$ in the plane, we draw a short line segment with slope $f(t,y)$.

  This field shows the **direction** in which solutions flow at every point, allowing us to sketch solution curves without solving the equation.
]

#note[Geometric Intuition][
  Think of the direction field as a "flow field" - if you were to place a particle at any point $(t,y)$, the direction field tells you which direction the particle would move. Solution curves are the paths particles would follow through this field.

  - **Positive slopes** (red): Solutions increasing
  - **Negative slopes** (blue): Solutions decreasing
  - **Zero slopes** (gray): Horizontal tangent lines, often indicating equilibria
]

=== Three Fundamental Types

Direction fields reveal different structural patterns depending on whether the differential equation depends on $t$, $y$, or both variables.

==== Type 1: $y' = f(t)$ - Time-Dependent Only

When the differential equation has the form $y' = f(t)$, the slope depends only on the independent variable $t$.

#example[Quadratic Time Dependence: $y' = t(t+2)$][
  Consider $y' = t(t+2) = t^2 + 2t$.

  *Key Observations*:
  - At $t = 0$: slope is $0(0+2) = 0$
  - At $t = -2$: slope is $(-2)(-2+2) = 0$
  - For $t < -2$ or $t > 0$: slope is positive
  - For $-2 < t < 0$: slope is negative

  *Direction Field Structure*: **Vertical bands**
  - All points with the same $t$-coordinate have identical slopes
  - Zero-slope occurs in vertical lines at $t = 0$ and $t = -2$
  - Solution curves are **independent** - they never intersect
]

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    // Colors & helpers from the original slope field code
    let col-pos = rgb(220, 50, 47) // red for positive slope
    let col-neg = rgb(38, 139, 210) // blue for negative slope
    let col-zero = gray.lighten(20%) // near-zero slopes
    let grid-col = gray.lighten(50%)
    let axis-col = black

    let lerp(a, b, u) = a + (b - a) * u
    let clamp(x, lo, hi) = if x < lo { lo } else if x > hi { hi } else { x }
    let sgn(x) = if x >= 0 { 1 } else { -1 }

    let slope_to_angle(m, limit: 6.0) = {
      if calc.abs(m) > limit { 90deg * sgn(m) } else { calc.atan(m) }
    }

    let seg((x, y), m, len: 0.45, paint: black, thick: 0.9pt) = {
      let a = slope_to_angle(m)
      let dx = (len / 2) * calc.cos(a)
      let dy = (len / 2) * calc.sin(a)
      draw.line((x - dx, y - dy), (x + dx, y + dy), stroke: (paint: paint, thickness: thick, cap: "round"))
    }

    let axes((xmin, xmax), (ymin, ymax), ticks: 1, show-grid: true) = {
      draw.stroke(grid-col + 0.5pt)
      if show-grid {
        draw.grid(
          (xmin, ymin),
          (xmax, ymax),
          help-lines: true,
        )
      }
      draw.stroke(axis-col + 1pt)
      draw.line((xmin, 0), (xmax, 0))
      draw.line((0, ymin), (0, ymax))
      draw.stroke(axis-col + 0.5pt)
      for x in range(calc.ceil(xmin), calc.floor(xmax) + 1) {
        draw.line((x, -0.07), (x, 0.07))
        if x != 0 { draw.content((x, -0.35), str(x), anchor: "north") }
      }
      for y in range(calc.ceil(ymin), calc.floor(ymax) + 1) {
        draw.line((-0.07, y), (0.07, y))
        if y != 0 { draw.content((-0.25, y), str(y), anchor: "west") }
      }
      draw.content((xmax, -0.45), $ t $, anchor: "north-east")
      draw.content((-0.45, ymax), $ y $, anchor: "north-west")
    }

    let slope_field(f, t-range: (-3, 3), y-range: (-3, 3), nx: 13, ny: 13) = {
      let (tmin, tmax) = t-range
      let (ymin, ymax) = y-range
      axes(t-range, y-range)
      for i in range(0, nx) {
        let u = i / (nx - 1)
        let t = lerp(tmin, tmax, u)
        for j in range(0, ny) {
          let v = j / (ny - 1)
          let y = lerp(ymin, ymax, v)
          let m = f(t, y)
          let paint = if calc.abs(m) < 0.08 { col-zero } else if m > 0 { col-pos } else { col-neg }
          seg((t, y), m, len: 0.42, paint: paint)
        }
      }
    }

    let v_dashed(x, ymin, ymax, paint: col-zero) = {
      draw.line((x, ymin), (x, ymax), stroke: (paint: paint, thickness: 0.8pt, dash: "dashed"))
    }

    canvas(length: 0.6cm, {
      // Direction field for y' = t(t+2)
      let f_t = t => t * (t + 2)
      slope_field((t, y) => f_t(t), t-range: (-3, 3), y-range: (-3, 3), nx: 21, ny: 17)

      // Show vertical zero-slope lines
      v_dashed(0, -3, 3)
      v_dashed(-2, -3, 3)

      // Labels
      draw.content((0, 3.2), [$t = 0$], anchor: "south")
      draw.content((-2, 3.2), [$t = -2$], anchor: "south")
      draw.content((2.5, -2.5), [Vertical bands of constant slope], anchor: "center", frame: "rect", fill: white)
    })
  },
  caption: [Direction field for $y' = t(t+2)$. Notice the vertical bands structure - all points with the same $t$-coordinate have identical slopes. Zero slopes occur at $t = 0$ and $t = -2$ (gray dashed lines).],
)

==== Type 2: $y' = f(y)$ - State-Dependent Only

When the equation has the form $y' = f(y)$, the slope depends only on the current value of the dependent variable.

#example[Quadratic Growth with Equilibria: $y' = y^2 - 3$][
  Consider $y' = y^2 - 3$.

  *Equilibrium Analysis*: Setting $y' = 0$:
  $ y^2 - 3 = 0 arrow.r y = ± sqrt(3) $

  *Sign Analysis*:
  - For $y > sqrt(3)$: $y^2 > 3$, so $y' > 0$ (growth)
  - For $-sqrt(3) < y < sqrt(3)$: $y^2 < 3$, so $y' < 0$ (decay)
  - For $y < -sqrt(3)$: $y^2 > 3$, so $y' > 0$ (growth away from equilibrium)

  *Direction Field Structure*: **Horizontal bands**
  - All points with the same $y$-coordinate have identical slopes
  - Zero-slope occurs in horizontal lines at $y = ± sqrt(3)$
  - Solutions **cannot cross** these equilibrium lines
]

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    let col-pos = rgb(220, 50, 47)
    let col-neg = rgb(38, 139, 210)
    let col-zero = gray.lighten(20%)
    let grid-col = gray.lighten(50%)
    let axis-col = black

    let lerp(a, b, u) = a + (b - a) * u
    let sgn(x) = if x >= 0 { 1 } else { -1 }

    let slope_to_angle(m, limit: 6.0) = {
      if calc.abs(m) > limit { 90deg * sgn(m) } else { calc.atan(m) }
    }

    let seg((x, y), m, len: 0.45, paint: black, thick: 0.9pt) = {
      let a = slope_to_angle(m)
      let dx = (len / 2) * calc.cos(a)
      let dy = (len / 2) * calc.sin(a)
      draw.line((x - dx, y - dy), (x + dx, y + dy), stroke: (paint: paint, thickness: thick, cap: "round"))
    }

    let axes((xmin, xmax), (ymin, ymax), ticks: 1, show-grid: true) = {
      draw.stroke(grid-col + 0.5pt)
      if show-grid {
        draw.grid(
          (xmin, ymin),
          (xmax, ymax),
          help-lines: true,
        )
      }
      draw.stroke(axis-col + 1pt)
      draw.line((xmin, 0), (xmax, 0))
      draw.line((0, ymin), (0, ymax))
      draw.stroke(axis-col + 0.5pt)
      for x in range(calc.ceil(xmin), calc.floor(xmax) + 1) {
        draw.line((x, -0.07), (x, 0.07))
        if x != 0 { draw.content((x, -0.35), str(x), anchor: "north") }
      }
      for y in range(calc.ceil(ymin), calc.floor(ymax) + 1) {
        draw.line((-0.07, y), (0.07, y))
        if y != 0 { draw.content((-0.25, y), str(y), anchor: "west") }
      }
      draw.content((xmax, -0.45), $ t $, anchor: "north-east")
      draw.content((-0.45, ymax), $ y $, anchor: "north-west")
    }

    let slope_field(f, t-range: (-3, 3), y-range: (-3, 3), nx: 13, ny: 13) = {
      let (tmin, tmax) = t-range
      let (ymin, ymax) = y-range
      axes(t-range, y-range)
      for i in range(0, nx) {
        let u = i / (nx - 1)
        let t = lerp(tmin, tmax, u)
        for j in range(0, ny) {
          let v = j / (ny - 1)
          let y = lerp(ymin, ymax, v)
          let m = f(t, y)
          let paint = if calc.abs(m) < 0.08 { col-zero } else if m > 0 { col-pos } else { col-neg }
          seg((t, y), m, len: 0.42, paint: paint)
        }
      }
    }

    let h_dashed(y, xmin, xmax, paint: col-zero) = {
      draw.line((xmin, y), (xmax, y), stroke: (paint: paint, thickness: 0.8pt, dash: "dashed"))
    }

    canvas(length: 0.6cm, {
      // Direction field for y' = y^2 - 3
      let f_y = y => y * y - 3
      slope_field((t, y) => f_y(y), t-range: (-3, 3), y-range: (-3, 3), nx: 21, ny: 17)

      // Show horizontal equilibrium lines
      let r = calc.sqrt(3.0)
      h_dashed(r, -3, 3)
      h_dashed(-r, -3, 3)

      // Labels
      draw.content((3.1, r), [$y = +sqrt(3)$], anchor: "west")
      draw.content((3.1, -r), [$y = -sqrt(3)$], anchor: "west")
      draw.content((0, -2.5), [Horizontal bands of constant slope], anchor: "center", frame: "rect", fill: white)
    })
  },
  caption: [Direction field for $y' = y^2 - 3$. The horizontal band structure shows that slope depends only on $y$-coordinate. Equilibrium lines at $y = ± sqrt(3)$ (gray dashed) separate regions of different behavior.],
)

==== Type 3: $y' = f(t,y)$ - Mixed Dependence

The most general case where slope depends on both variables creates the richest direction field structures.

#example[Linear Mixed Case: $y' = y - t$][
  Consider $y' = y - t$.

  *Equilibrium Curve*: Setting $y' = 0$:
  $ y - t = 0 arrow.r y = t $

  This is the **diagonal line** $y = t$, not just isolated points.

  *Sign Analysis*:
  - **Above the line** $y > t$: $y - t > 0$, so $y' > 0$ (solutions rise)
  - **On the line** $y = t$: $y' = 0$ (horizontal tangents)
  - **Below the line** $y < t$: $y - t < 0$, so $y' < 0$ (solutions fall)

  *Sample Calculations*:

  #table(
    columns: 4,
    align: center,
    [$(t,y)$], [$y - t$], [$y'$], [Direction],
    [$(1, 3)$], [$3 - 1 = 2$], [$+2$], [↗ steep rise],
    [$(0, 0)$], [$0 - 0 = 0$], [$0$], [→ horizontal],
    [$(2, -1)$], [$-1 - 2 = -3$], [$-3$], [↘ steep fall],
  )
]

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    let col-pos = rgb(220, 50, 47)
    let col-neg = rgb(38, 139, 210)
    let col-zero = gray.lighten(20%)
    let grid-col = gray.lighten(50%)
    let axis-col = black

    let lerp(a, b, u) = a + (b - a) * u
    let sgn(x) = if x >= 0 { 1 } else { -1 }

    let slope_to_angle(m, limit: 6.0) = {
      if calc.abs(m) > limit { 90deg * sgn(m) } else { calc.atan(m) }
    }

    let seg((x, y), m, len: 0.45, paint: black, thick: 0.9pt) = {
      let a = slope_to_angle(m)
      let dx = (len / 2) * calc.cos(a)
      let dy = (len / 2) * calc.sin(a)
      draw.line((x - dx, y - dy), (x + dx, y + dy), stroke: (paint: paint, thickness: thick, cap: "round"))
    }

    let axes((xmin, xmax), (ymin, ymax), ticks: 1, show-grid: true) = {
      draw.stroke(grid-col + 0.5pt)
      if show-grid {
        draw.grid(
          (xmin, ymin),
          (xmax, ymax),
          help-lines: true,
        )
      }
      draw.stroke(axis-col + 1pt)
      draw.line((xmin, 0), (xmax, 0))
      draw.line((0, ymin), (0, ymax))
      draw.stroke(axis-col + 0.5pt)
      for x in range(calc.ceil(xmin), calc.floor(xmax) + 1) {
        draw.line((x, -0.07), (x, 0.07))
        if x != 0 { draw.content((x, -0.35), str(x), anchor: "north") }
      }
      for y in range(calc.ceil(ymin), calc.floor(ymax) + 1) {
        draw.line((-0.07, y), (0.07, y))
        if y != 0 { draw.content((-0.25, y), str(y), anchor: "west") }
      }
      draw.content((xmax, -0.45), $ t $, anchor: "north-east")
      draw.content((-0.45, ymax), $ y $, anchor: "north-west")
    }

    let slope_field(f, t-range: (-3, 3), y-range: (-3, 3), nx: 13, ny: 13) = {
      let (tmin, tmax) = t-range
      let (ymin, ymax) = y-range
      axes(t-range, y-range)
      for i in range(0, nx) {
        let u = i / (nx - 1)
        let t = lerp(tmin, tmax, u)
        for j in range(0, ny) {
          let v = j / (ny - 1)
          let y = lerp(ymin, ymax, v)
          let m = f(t, y)
          let paint = if calc.abs(m) < 0.08 { col-zero } else if m > 0 { col-pos } else { col-neg }
          seg((t, y), m, len: 0.42, paint: paint)
        }
      }
    }

    canvas(length: 0.6cm, {
      // Direction field for y' = y - t
      let f_ty = (t, y) => y - t
      slope_field(f_ty, t-range: (-3, 3), y-range: (-3, 3), nx: 21, ny: 17)

      // Show the equilibrium diagonal y = t
      draw.line((-3, -3), (3, 3), stroke: (paint: col-zero, thickness: 0.8pt, dash: "dashed"))

      // Labels
      draw.content((3.1, 3.1), [$y = t$ (equilibrium)], anchor: "south-west")
      draw.content((-2, 2), [Solutions rise], anchor: "center", frame: "rect", fill: white)
      draw.content((2, -2), [Solutions fall], anchor: "center", frame: "rect", fill: white)
    })
  },
  caption: [Direction field for $y' = y - t$. The equilibrium set is the diagonal line $y = t$ (gray dashed). Above this line solutions rise (red slopes), below it they fall (blue slopes). This creates a complex flow pattern unlike the simpler band structures.],
)

=== Sketching Solution Curves

#note[Solution Curve Guidelines][
  To sketch approximate solution curves in a direction field:

  1. **Start at initial condition** $(t_0, y_0)$
  2. **Follow the flow** - move in direction indicated by nearby line segments
  3. **Stay tangent** to the direction field - solution curves should touch each line segment tangentially
  4. **Respect equilibria** - solutions cannot cross equilibrium curves
  5. **Check consistency** - verify your curve makes sense with the equation

  *Common Mistakes*:
  - Drawing curves that "cut through" the direction field instead of following it
  - Crossing equilibrium lines (impossible for autonomous equations)
  - Ignoring the tangent condition at each point
]

=== Qualitative Analysis Applications

Direction fields excel at revealing **global behavior** without solving:

#example[Population Dynamics Analysis][
  For the logistic equation $y' = r y(1 - y/K)$:

  - **Equilibria**: $y = 0$ (extinction) and $y = K$ (carrying capacity)
  - **Direction field reveals**: All positive solutions approach carrying capacity
  - **Stability**: $y = 0$ is unstable, $y = K$ is stable
  - **Solution behavior**: S-shaped growth curves visible in the field

  This analysis requires no integration - just understanding the direction field structure.
]

#attention[Uniqueness and Existence][
  Direction fields also reveal where solutions might fail to exist or be unique:

  - **Intersecting solution curves**: Suggests non-uniqueness (requires checking conditions)
  - **Vertical slopes**: May indicate finite-time blowup
  - **Discontinuities**: Points where $f(t,y)$ is undefined create barriers for solutions
]




== Numerical Methods: Euler's Method

Numerical methods let us approximate solutions when an analytic formula is unavailable or inconvenient. The simplest is Euler's method, which replaces the solution by a polygonal curve whose slope on each subinterval matches the differential equation at the left endpoint.

#definition[Euler's Method][
  Given an IVP $y' = f(t, y)$ with initial data $y(t_0) = y_0$ and a step size $Δ t > 0$:

  - Define grid points $t_n = t_0 + n Δ t$.
  - Initialize $y_0$.
  - Update recursively by the forward-Euler rule: $ y_{n+1} = y_n + Δ t f(t_n, y_n) $ and $ t_{n+1} = t_n + Δ t $.

  This is the discretized version of the differential relation $Δ y ≈ f(t_n, y_n) Δ t$ (using the tangent line at $(t_n, y_n)$).
]

#note[Intuition and Accuracy][
  - We follow the tangent at the current point for one step of length $Δ t$.
  - Local truncation error is $O(Δ t^2)$ and the global error after $N$ steps is $O(Δ t)$.
  - Smaller $Δ t$ yields higher accuracy but requires more steps (cost).
]

=== Worked Example (Forward Euler)

#example[$y' = (3 - y)(y + 1)$ with $y(0) = 4$ and $Δ t = 0.5$][
  We compute $f(t, y) = (3 - y)(y + 1)$ and iterate the Euler update. Values are rounded to 3 decimals for readability.

  #table(
    columns: 6,
    align: center,
    [n], [$t_n$], [$y_n$], [$f(t_n, y_n)$], [$Δ y = f Δ t$], [$y_{n+1}$],
    [0], [0.0], [4.000], [-5.000], [-2.500], [1.500],
    [1], [0.5], [1.500], [3.750], [1.875], [3.375],
    [2], [1.0], [3.375], [-1.641], [-0.820], [2.555],
    [3], [1.5], [2.555], [1.583], [0.791], [3.346],
    [4], [2.0], [3.346], [-1.503], [-0.751], [2.595],
    [5], [2.5], [2.595], [1.460], [0.730], [3.325],
  )

  Hence the Euler approximation at $t = 3$ (after 6 steps) is
  $ y_E(3) ≈ 3.325. $
]

=== Analytic Solution and Comparison

#example[Separation with Partial Fractions][
  For $y' = (3 - y)(y + 1)$, separate variables:
  $ frac(upright(d)y, (3 - y)(y + 1)) = upright(d)t. $

  Decompose:
  $ frac(1, (3 - y)(y + 1)) = frac(1, 4) frac(1, y + 1) + frac(1, 4) frac(1, 3 - y). $

  Integrate:
  $ frac(1, 4) ln|y + 1| - frac(1, 4) ln|3 - y| = t + C $
  $ ln((y + 1) / (3 - y)) = 4 t + C' $
  $ (y + 1) / (3 - y) = C e^(4 t). $

  Solve for $y$:
  $ y(t) = (3 C e^(4 t) - 1) / (1 + C e^(4 t)). $

  Apply $y(0) = 4$ to get $C = -5$, so an equivalent closed form is
  $ y(t) = (15 e^(4 t) + 1) / (5 e^(4 t) - 1) = 3 + 4 / (5 e^(4 t) - 1). $

  In particular,
  $ y(3) = 3 + 4 / (5 e^(12) - 1) ≈ 3.000005. $

  Comparing with Euler above, $y_E(3) ≈ 3.325$ so the absolute error is about $0.325$ with $Δ t = 0.5$.
]

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    canvas(length: 0.6cm, {
      // Plot settings
      let width = 12
      let height = 7
      let x-min = 0.0
      let x-max = 3.0
      let y-min = 0.0
      let y-max = 5.0

      // Axes
      draw.line((0, 0), (width, 0), stroke: black)
      draw.line((0, 0), (0, height), stroke: black)

      // Mapping from data to canvas
      let to-canvas = (x, y) => (
        (x - x-min) * width / (x-max - x-min),
        (y - y-min) * height / (y-max - y-min),
      )

      // Exact solution
      let y-exact = t => (15.0 * calc.exp(4.0 * t) + 1.0) / (5.0 * calc.exp(4.0 * t) - 1.0)
      let n = 140
      for j in range(n) {
        let t0 = x-min + (x-max - x-min) * j / n
        let t1 = x-min + (x-max - x-min) * (j + 1) / n
        let p0 = to-canvas(t0, y-exact(t0))
        let p1 = to-canvas(t1, y-exact(t1))
        draw.line(p0, p1, stroke: (paint: red, thickness: 2pt))
      }

      // Euler polygon for Δt = 0.5
      let et = (0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0)
      let ey = (4.0, 1.5, 3.375, 2.555, 3.346, 2.595, 3.325)
      for j in range(et.len() - 1) {
        let p0 = to-canvas(et.at(j), ey.at(j))
        let p1 = to-canvas(et.at(j + 1), ey.at(j + 1))
        draw.line(p0, p1, stroke: (paint: blue, thickness: 2pt))
      }
      // Node markers
      for j in range(et.len()) {
        draw.circle(to-canvas(et.at(j), ey.at(j)), radius: 2.6pt, fill: white, stroke: blue)
      }

      // Tangent line at (t0, y0) with slope f(t0, y0) = (3 - y)(y + 1)
      let m0 = (3.0 - 4.0) * (4.0 + 1.0) // -5
      let t-span = 0.55
      let t0 = 0.0
      let y0 = 4.0
      draw.line(
        to-canvas(t0, y0),
        to-canvas(t0 + t-span, y0 + m0 * t-span),
        stroke: (paint: orange, thickness: 2pt, dash: "dashed"),
      )

      // Δt bracket
      let y-top = 4.6
      draw.line(to-canvas(0.0, y-top), to-canvas(0.5, y-top), stroke: black)
      draw.content((to-canvas(0.25, y-top).at(0), to-canvas(0.25, y-top).at(1) + 0.35), [Δ t], anchor: "north")

      // Local error at t = 0.5
      let te = 0.5
      let ye = 1.5
      let ytrue = y-exact(te)
      draw.line(to-canvas(te, ye), to-canvas(te, ytrue), stroke: (paint: red, dash: "dotted"))
      draw.content(
        (to-canvas(te, (ye + ytrue) / 2).at(0) + 0.2, to-canvas(te, (ye + ytrue) / 2).at(1)),
        [error],
        anchor: "west",
      )

      // Ticks and labels
      for i in range(0, 7) {
        let x = i * (x-max - x-min) / 6 + x-min
        let xp = (x - x-min) * width / (x-max - x-min)
        draw.line((xp, -0.1), (xp, 0.1), stroke: black)
        draw.content((xp, -0.35), str(i / 2), anchor: "north")
      }
      for i in range(0, 6) {
        let y = i * (y-max - y-min) / 5 + y-min
        let yp = (y - y-min) * height / (y-max - y-min)
        draw.line((-0.1, yp), (0.1, yp), stroke: black)
        draw.content((-0.35, yp), str(i), anchor: "west")
      }
      draw.content((width, -0.45), [$ t $], anchor: "north-east")
      draw.content((-0.45, height), [$ y $], anchor: "north-west")
    })
  },
  caption: [Euler's method for $y' = (3 - y)(y + 1)$ with $Δ t = 0.5$: exact solution (red), Euler polygon (blue) and the initial tangent step (orange, dashed). The vertical dotted segment at $t = 0.5$ shows the local error.],
)

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    canvas(length: 0.6cm, {
      // Settings
      let width = 12
      let height = 7
      let x-min = 0.0
      let x-max = 3.0
      let y-min = 0.0
      let y-max = 5.0
      let to-canvas = (x, y) => (
        (x - x-min) * width / (x-max - x-min),
        (y - y-min) * height / (y-max - y-min),
      )

      // Axes
      draw.line((0, 0), (width, 0), stroke: black)
      draw.line((0, 0), (0, height), stroke: black)

      // Exact
      let y-exact = t => (15.0 * calc.exp(4.0 * t) + 1.0) / (5.0 * calc.exp(4.0 * t) - 1.0)
      let n = 140
      for j in range(n) {
        let t0 = x-min + (x-max - x-min) * j / n
        let t1 = x-min + (x-max - x-min) * (j + 1) / n
        draw.line(to-canvas(t0, y-exact(t0)), to-canvas(t1, y-exact(t1)), stroke: (paint: red, thickness: 1.6pt))
      }

      // Euler nodes and polygon (Δt = 0.5)
      let et = (0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0)
      let ey = (4.0, 1.5, 3.375, 2.555, 3.346, 2.595, 3.325)
      for j in range(et.len() - 1) {
        draw.line(to-canvas(et.at(j), ey.at(j)), to-canvas(et.at(j + 1), ey.at(j + 1)), stroke: (
          paint: blue,
          thickness: 2pt,
        ))
      }
      for j in range(et.len()) {
        draw.circle(to-canvas(et.at(j), ey.at(j)), radius: 3pt, fill: blue)
        draw.content(
          (to-canvas(et.at(j), ey.at(j)).at(0), to-canvas(et.at(j), ey.at(j)).at(1) - 0.35),
          str(j),
          anchor: "south",
        )
      }

      // Labels
      draw.content((width - 1.5, height - 0.7), [Exact], anchor: "center", frame: "rect", fill: white)
      draw.content((width - 1.5, height - 1.2), [Euler], anchor: "center", frame: "rect", fill: white)
      // Sample legend lines
      draw.line((width - 2.7, height - 0.7), (width - 2.1, height - 0.7), stroke: (paint: red, thickness: 1.6pt))
      draw.line((width - 2.7, height - 1.2), (width - 2.1, height - 1.2), stroke: (paint: blue, thickness: 2pt))
    })
  },
  caption: [Exact solution (red) vs. Euler polygon (blue) at nodes $t = 0, 0.5, \ldots, 3$. Filled circles mark the Euler nodes; labels indicate the step index $n$.],
)

== Existence and Uniqueness for First-Order IVPs

#note[Vocabulary][
  We use $∃$ to denote “there exists” and $∃!$ to denote “there exists exactly one (unique)”.
]

#theorem[Existence (Peano-type)][
  Suppose $f(t, y)$ is continuous on a rectangle
  $ R = { (t, y) : a < t < b, c < y < d } $ containing $(t_0, y_0)$.
  Then $∃ ε > 0$ and at least one function $y(t)$ defined for $t ∈ (t_0 - ε, t_0 + ε)$ that solves the IVP
  $ y' = f(t, y),\ y(t_0) = y_0. $
]

#theorem[Uniqueness (Picard–Lindelöf)][
  If, in addition, $∂ f / ∂ y$ is continuous on $R$ (equivalently, $f$ is Lipschitz in $y$ on $R$), then $∃!$ a unique solution to the IVP in some interval around $t_0$.
]

#note[Rectangles and Domains][
  The interval of guaranteed existence/uniqueness must lie inside a rectangle where the hypotheses hold. If $f$ (or $∂ f/∂ y$) blows up or is undefined, the rectangle—and thus the guaranteed interval—must stop before those singularities.
]

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    canvas(length: 0.6cm, {
      let width = 9
      let height = 7
      let x-min = -1.2
      let x-max = 1.2
      let y-min = -2.0
      let y-max = 2.0
      let to-canvas = (x, y) => (
        (x - x-min) * width / (x-max - x-min),
        (y - y-min) * height / (y-max - y-min),
      )

      // Axes
      draw.line((0, 0), (width, 0), stroke: black)
      draw.line((0, 0), (0, height), stroke: black)

      // Rectangle R around (t0, y0) = (0, 0)
      let a = -0.8
      let b = 0.8
      let c = -1.2
      let d = 1.2
      let p1 = to-canvas(a, c)
      let p2 = to-canvas(b, c)
      let p3 = to-canvas(b, d)
      let p4 = to-canvas(a, d)
      draw.line(p1, p2, stroke: (paint: gray, thickness: 1.2pt, dash: "dashed"))
      draw.line(p2, p3, stroke: (paint: gray, thickness: 1.2pt, dash: "dashed"))
      draw.line(p3, p4, stroke: (paint: gray, thickness: 1.2pt, dash: "dashed"))
      draw.line(p4, p1, stroke: (paint: gray, thickness: 1.2pt, dash: "dashed"))

      // Initial point
      draw.circle(to-canvas(0, 0), radius: 3pt, fill: red)
      draw.content((to-canvas(0, 0).at(0) + 0.2, to-canvas(0, 0).at(1) + 0.2), [$(t_0, y_0)$], anchor: "west")

      // Annotations
      draw.content(
        (to-canvas(0.0, 1.35).at(0), to-canvas(0.0, 1.35).at(1)),
        [$R$],
        anchor: "center",
        frame: "rect",
        fill: white,
      )
      draw.content(
        (to-canvas(-0.95, -1.7).at(0), to-canvas(-0.95, -1.7).at(1)),
        [Continuity on $R$ ⇒ $∃$],
        anchor: "west",
      )
      draw.content(
        (to-canvas(-0.95, -1.95).at(0), to-canvas(-0.95, -1.95).at(1)),
        [Lipschitz in $y$ on $R$ ⇒ $∃!$],
        anchor: "west",
      )

      // Ticks/labels
      for i in range(-1, 2) {
        let x = i
        let xp = (x - x-min) * width / (x-max - x-min)
        draw.line((xp, -0.1), (xp, 0.1), stroke: black)
        if x != 0 { draw.content((xp, -0.35), str(x), anchor: "north") }
      }
      for i in range(-2, 3) {
        let y = i
        let yp = (y - y-min) * height / (y-max - y-min)
        draw.line((-0.1, yp), (0.1, yp), stroke: black)
        if y != 0 { draw.content((-0.35, yp), str(y), anchor: "west") }
      }
      draw.content((width, -0.45), [$ t $], anchor: "north-east")
      draw.content((-0.45, height), [$ y $], anchor: "north-west")
    })
  },
  caption: [Existence rectangle $R$ around $(t_0, y_0)$. Continuity of $f$ on $R$ gives $∃$ a solution; a Lipschitz condition in $y$ on $R$ gives $∃!$ uniqueness near $t_0$.],
)


=== Example: $y' = 1 + y^2$

#example[General Solution and Initial Conditions][
  Separate variables: $ frac(upright(d)y, 1 + y^2) = upright(d)t $ gives
  $ arctan(y) = t + C $ and hence $ y(t) = tan(t + C) $.

  - For $y(0) = 0$: $0 = tan(C) ⇒ C = 0$ (mod $π$). The unique solution through $(0, 0)$ near $t = 0$ is
    $ y(t) = tan(t) $, valid on the maximal interval $(-frac(π, 2),\ frac(π, 2))$.

  - For $y(π) = 0$: $0 = tan(π + C) ⇒ C = -π$, so $ y(t) = tan(t - π) $. The natural domain centered at $t_0 = π$ is $(π - frac(π, 2),\ π + frac(π, 2))$.

  Here $f(t, y) = 1 + y^2$ and $∂ f/∂ y = 2y$ are continuous for all $(t, y)$, so $∃!$ a unique solution through any initial condition; the finite domains arise from vertical asymptotes of $tan$.
]

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    canvas(length: 0.6cm, {
      let width = 12
      let height = 7
      let x-min = -1.0
      let x-max = 4.5
      let y-min = -4.0
      let y-max = 4.0
      let to-canvas = (x, y) => (
        (x - x-min) * width / (x-max - x-min),
        (y - y-min) * height / (y-max - y-min),
      )

      // Axes
      draw.line((0, 0), (width, 0), stroke: black)
      draw.line((0, 0), (0, height), stroke: black)

      // Vertical asymptotes at ±π/2 and 3π/2
      let a1 = calc.pi / 2
      let a2 = -calc.pi / 2
      let a3 = 3 * calc.pi / 2
      for x in (a1, a2, a3) {
        if x > x-min and x < x-max {
          let xp = (x - x-min) * width / (x-max - x-min)
          draw.line((xp, 0), (xp, height), stroke: (paint: gray, dash: "dashed"))
        }
      }

      // Plot y = tan(t) piecewise, avoiding jumps
      let n = 500
      let prev-ok = false
      let prev-p = (0, 0)
      let clamp(x, lo, hi) = if x < lo { lo } else if x > hi { hi } else { x }
      for j in range(n + 1) {
        let t = x-min + (x-max - x-min) * j / n
        let y = calc.tan(t)
        let ok = calc.abs(y) <= y-max
        let p = to-canvas(t, clamp(y, y-min, y-max))
        if prev-ok and ok and calc.abs(y - ((prev-p.at(1) * (y-max - y-min) / height) + y-min)) < 2.0 {
          draw.line((prev-p.at(0), prev-p.at(1)), (p.at(0), p.at(1)), stroke: (paint: red, thickness: 1.5pt))
        }
        prev-ok = ok
        prev-p = p
      }

      // Initial condition markers
      draw.circle(to-canvas(0, 0), radius: 3pt, fill: blue)
      draw.content((to-canvas(0, 0).at(0) + 0.2, to-canvas(0, 0).at(1) - 0.2), [$(0, 0)$], anchor: "west")
      if calc.pi < x-max {
        draw.circle(to-canvas(calc.pi, 0), radius: 3pt, fill: blue)
        draw.content(
          (to-canvas(calc.pi, 0).at(0) + 0.2, to-canvas(calc.pi, 0).at(1) - 0.2),
          [$ (π, 0) $],
          anchor: "west",
        )
      }

      // Ticks and labels
      for i in range(-1, 5) {
        let x = i
        let xp = (x - x-min) * width / (x-max - x-min)
        draw.line((xp, -0.1), (xp, 0.1), stroke: black)
        draw.content((xp, -0.35), str(i), anchor: "north")
      }
      for i in range(-4, 5) {
        let y = i
        let yp = (y - y-min) * height / (y-max - y-min)
        draw.line((-0.1, yp), (0.1, yp), stroke: black)
        draw.content((-0.35, yp), str(i), anchor: "west")
      }
      draw.content((width, -0.45), [$ t $], anchor: "north-east")
      draw.content((-0.45, height), [$ y $], anchor: "north-west")
    })
  },
  caption: [Solutions to $y' = 1 + y^2$ are $y(t) = tan(t + C)$. Vertical dashed lines mark asymptotes at $t = ±\,π/2$ and $t = 3π/2$. The points $(0, 0)$ and $(π, 0)$ illustrate two initial conditions with distinct valid intervals.],
)


=== Uniqueness: Consequences and Intuition

#note[No-Crossing Principle][
  If the uniqueness hypotheses hold ($∂ f/∂ y$ continuous on a rectangle $R$), then solution curves through different initial values cannot intersect while they remain in $R$. Otherwise two different solutions would pass through the same point, contradicting $∃!$.
]

#example[Two Solutions That Never Cross][
  Consider $y' = y - t$. The general solution is $y(t) = t + 1 + C e^t$. With $y(0) = -1$ we get $y_1(t) = t + 1 - 2 e^t$; with $y(0) = 1$ we get $y_2(t) = t + 1$. Since $y_1(t) = y_2(t)$ would imply $-2 e^t = 0$, the solutions never intersect. This illustrates uniqueness and the non-crossing property.
]

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    canvas(length: 0.6cm, {
      let width = 12
      let height = 7
      let x-min = -1.5
      let x-max = 2.5
      let y-min = -6.0
      let y-max = 6.0
      let to-canvas = (x, y) => (
        (x - x-min) * width / (x-max - x-min),
        (y - y-min) * height / (y-max - y-min),
      )

      // Axes
      draw.line((0, 0), (width, 0), stroke: black)
      draw.line((0, 0), (0, height), stroke: black)

      // Solutions
      let y1 = t => t + 1 - 2 * calc.exp(t)
      let y2 = t => t + 1
      let n = 180
      for j in range(n) {
        let t0 = x-min + (x-max - x-min) * j / n
        let t1 = x-min + (x-max - x-min) * (j + 1) / n
        draw.line(to-canvas(t0, y1(t0)), to-canvas(t1, y1(t1)), stroke: (paint: blue, thickness: 1.6pt))
        draw.line(to-canvas(t0, y2(t0)), to-canvas(t1, y2(t1)), stroke: (paint: red, thickness: 1.6pt))
      }

      // Initial points at t = 0
      draw.circle(to-canvas(0, -1), radius: 3pt, fill: blue)
      draw.circle(to-canvas(0, 1), radius: 3pt, fill: red)
      draw.content((to-canvas(0, -1).at(0) + 0.2, to-canvas(0, -1).at(1)), [$y_1(0) = -1$], anchor: "west")
      draw.content((to-canvas(0, 1).at(0) + 0.2, to-canvas(0, 1).at(1)), [$y_2(0) = 1$], anchor: "west")

      draw.content((width, -0.45), [$ t $], anchor: "north-east")
      draw.content((-0.45, height), [$ y $], anchor: "north-west")
      draw.content((width - 2.2, height - 0.7), [No crossings under $∃!$], anchor: "center", frame: "rect", fill: white)
    })
  },
  caption: [Two distinct solutions of $y' = y - t$ starting at $(0, -1)$ (blue) and $(0, 1)$ (red) never cross, visualizing the non-crossing consequence of uniqueness.],
)

=== A Classic Non-Uniqueness Example

#example[Failure of Lipschitz at $y = 0$][
  Consider $y' = 3 y^{2/3}$ with $y(0) = 0$.

  - Separating: $y^{-2/3} upright(d)y = 3 upright(d)t => 3 y^{1/3} = 3 t + C$, hence $y = (t + C')^3$.
  - The constant solution $y(t) ≡ 0$ also satisfies the ODE.
  - For any $a \ge 0$, the piecewise function $y_a(t) = 0$ for $t \le a$ and $y_a(t) = (t - a)^3$ for $t \ge a$ solves the IVP and matches $y(0) = 0$.

  Here $∂ f/∂ y = 2 y^{-1/3}$ is unbounded at $y = 0$ (not Lipschitz), so uniqueness fails.
]

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    canvas(length: 0.6cm, {
      let width = 10
      let height = 7
      let x-min = -1.2
      let x-max = 1.8
      let y-min = -1.0
      let y-max = 1.8
      let to-canvas = (x, y) => (
        (x - x-min) * width / (x-max - x-min),
        (y - y-min) * height / (y-max - y-min),
      )

      // Axes
      draw.line((0, 0), (width, 0), stroke: black)
      draw.line((0, 0), (0, height), stroke: black)

      // y = 0
      draw.line(to-canvas(x-min, 0), to-canvas(x-max, 0), stroke: (paint: gray, dash: "dashed"))

      // y = t^3
      let n = 150
      for j in range(n) {
        let t0 = x-min + (x-max - x-min) * j / n
        let t1 = x-min + (x-max - x-min) * (j + 1) / n
        draw.line(to-canvas(t0, t0 * t0 * t0), to-canvas(t1, t1 * t1 * t1), stroke: (paint: red, thickness: 1.6pt))
      }

      // Labels
      draw.content((width - 1.6, height - 0.7), [$y = t^3$], anchor: "center", frame: "rect", fill: white)
      draw.content((width - 1.6, height - 1.2), [$y ≡ 0$], anchor: "center", frame: "rect", fill: white)
      draw.content((width, -0.45), [$ t $], anchor: "north-east")
      draw.content((-0.45, height), [$ y $], anchor: "north-west")
    })
  },
  caption: [Non-uniqueness for $y' = 3 y^{2/3}$ at $y(0) = 0$: both $y ≡ 0$ (gray dashed) and $y = t^3$ (red) satisfy the IVP, because $∂ f/∂ y$ is unbounded at $y = 0$.],
)

=== Worked Example with a Singular Line

#example[$y' = t/(y - 2)$ with $y(-1) = 0$][
  Separate: $(y - 2) upright(d)y = t upright(d)t$ so $ frac(1, 2) (y - 2)^2 = frac(1, 2) t^2 + C $. Applying $y(-1) = 0$ yields $(y - 2)^2 = t^2 + 3$ and hence
  $ y(t) = 2 - sqrt(t^2 + 3). $

  - The right-hand side $f(t, y) = t/(y - 2)$ and $∂ f/∂ y = -t/(y - 2)^2$ are continuous on any rectangle avoiding $y = 2$, so $∃!$ locally around $(-1, 0)$.
  - Our explicit solution remains strictly below $y = 2$ for all $t$, so it never meets the singular line; the domain is $t ∈ (-∞, ∞)$.
]

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    canvas(length: 1cm, {
      let width = 12
      let height = 7
      let x-min = -4.0
      let x-max = 4.0
      let y-min = -6.0
      let y-max = 4.0
      let to-canvas = (x, y) => (
        (x - x-min) * width / (x-max - x-min),
        (y - y-min) * height / (y-max - y-min),
      )

      // Axes
      draw.line((0, 0), (width, 0), stroke: black)
      draw.line((0, 0), (0, height), stroke: black)

      // Singular line y = 2
      let ysing = 2.0
      draw.line(to-canvas(x-min, ysing), to-canvas(x-max, ysing), stroke: (paint: gray, dash: "dashed"))

      // Solution y = 2 - sqrt(t^2 + 3)
      let n = 200
      for j in range(n) {
        let t0 = x-min + (x-max - x-min) * j / n
        let t1 = x-min + (x-max - x-min) * (j + 1) / n
        let y0 = 2 - calc.sqrt(t0 * t0 + 3)
        let y1 = 2 - calc.sqrt(t1 * t1 + 3)
        draw.line(to-canvas(t0, y0), to-canvas(t1, y1), stroke: (paint: red, thickness: 1.8pt))
      }

      // Initial point
      draw.circle(to-canvas(-1, 0), radius: 3pt, fill: red)
      draw.content((to-canvas(-1, 0).at(0) + 0.2, to-canvas(-1, 0).at(1)), [$(-1, 0)$], anchor: "west")

      draw.content((width, -0.45), [$ t $], anchor: "north-east")
      draw.content((-0.45, height), [$ y $], anchor: "north-west")
    })
  },
  caption: [Solution to $y' = t/(y - 2)$ with $y(-1) = 0$ (red). The horizontal dashed line $y = 2$ is a singular barrier and is never crossed.],
)

== Autonomous Equations and Phase Lines

Autonomous equations have the form $y' = f(y)$. Their qualitative behavior can be read from the sign of $f(y)$ using a phase line (a vertical $y$-axis with arrows up/down where $f(y)$ is positive/negative). Equilibria are zeros of $f$.

#definition[Equilibrium Classification (Phase Line)][
  Let $y_*$ be a zero of $f$.
  - $text("sink (stable)")$: arrows point toward $y_*$ from both sides
  - $text("source (unstable)")$: arrows point away from $y_*$
  - $text("semi-stable")$: $f$ touches zero but does not change sign (e.g., repeated root)
]

#note[Workflow for Phase Lines][
  1) Factor $f(y)$, find zeros. 2) Determine the sign of $f$ on each interval between zeros. 3) Draw arrows on a vertical $y$-axis accordingly. 4) Classify each equilibrium. For intuition, also sketch $f(y)$ vs $y$ next to the phase line.
]

=== Phase Line 1: $y' = y(1 - y)$

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    canvas(length: 1cm, {
      // Panel layout
      let W = 13
      let H = 6.5
      // Left panel: f(y) vs y
      let x1 = 0
      let y1 = 0
      let w1 = 7.5
      let h1 = H
      // Right panel: phase line
      let x2 = 8.5
      let y2 = 0
      let w2 = 3.0
      let h2 = H

      // Helpers
      let plot_fx = () => {
        let ymin = -0.5
        let ymax = 1.0
        let xmin = -1.0
        let xmax = 2.0
        let to = (x, y) => (
          x1 + (x - xmin) * w1 / (xmax - xmin),
          y1 + (y - ymin) * h1 / (ymax - ymin),
        )
        // Axes
        draw.line((x1, to(0, 0).at(1)), (x1 + w1, to(0, 0).at(1)), stroke: black)
        draw.line((to(0, 0).at(0), y1), (to(0, 0).at(0), y1 + h1), stroke: black)
        // Function f(y) = y (1 - y)
        let f = y => y * (1 - y)
        let n = 140
        for j in range(n) {
          let a = xmin + (xmax - xmin) * j / n
          let b = xmin + (xmax - xmin) * (j + 1) / n
          draw.line((to(a, f(a))), (to(b, f(b))), stroke: (paint: blue, thickness: 1.4pt))
        }
        // Zeros
        draw.circle((to(0, 0)), radius: 2.3pt, fill: white, stroke: blue)
        draw.circle((to(1, 0)), radius: 2.3pt, fill: white, stroke: blue)
        draw.content((to(1, 0).at(0), to(1, 0).at(1) - 0.35), [$1$], anchor: "south")
        draw.content((to(0, 0).at(0), to(0, 0).at(1) - 0.35), [$0$], anchor: "south")
        draw.content((x1 + w1, y1 - 0.4), [$ y $], anchor: "north-east")
        draw.content((x1 - 0.4, y1 + h1), [$ f(y) $], anchor: "north-west")
      }
      plot_fx()

      // Phase line on right
      let ymin = -0.5
      let ymax = 2.0
      let to = y => (
        x2 + w2 / 2,
        y2 + (y - ymin) * h2 / (ymax - ymin),
      )
      draw.line((x2 + w2 / 2, y2), (x2 + w2 / 2, y2 + h2), stroke: black)
      // Equilibria marks
      draw.circle(to(0), radius: 2.2pt, fill: white, stroke: black)
      draw.circle(to(1), radius: 2.2pt, fill: white, stroke: black)
      // Arrows: sign of f
      let seg = (y0, y1, up) => {
        let p0 = to(y0)
        let p1 = to(y1)
        let mid = (p0.at(0), (p0.at(1) + p1.at(1)) / 2)
        let dy = 0.6
        if up {
          draw.line((mid.at(0), mid.at(1) - dy), (mid.at(0), mid.at(1) + dy), mark: (end: ">"))
        } else {
          draw.line((mid.at(0), mid.at(1) + dy), (mid.at(0), mid.at(1) - dy), mark: (end: ">"))
        }
      }
      seg(-0.5, 0, false) // y < 0: down
      seg(0, 1, true) // (0,1): up
      seg(1, 2.0, false) // >1: down
      draw.content((x2 + w2, to(1).at(1) + 0.3), [stable], anchor: "west")
      draw.content((x2 + w2, to(0).at(1) + 0.3), [unstable], anchor: "west")
    })
  },
  caption: [Phase line for $y' = y(1 - y)$. Left: $f(y)$ vs $y$. Right: phase line arrows show $y = 1$ is a sink (stable) and $y = 0$ is a source (unstable).],
)

=== Phase Line 2: $y' = (y - 2)(y + 1)$

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    canvas(length: 1cm, {
      let W = 13
      let H = 6.5
      let x1 = 0
      let y1 = 0
      let w1 = 7.5
      let h1 = H
      let x2 = 8.5
      let y2 = 0
      let w2 = 3.0
      let h2 = H

      // Left: f(y)
      let ymin = -2.5
      let ymax = 4.0
      let xmin = -2.0
      let xmax = 3.0
      let to1 = (x, y) => (
        x1 + (x - xmin) * w1 / (xmax - xmin),
        y1 + (y - ymin) * h1 / (ymax - ymin),
      )
      draw.line((x1, to1(0, 0).at(1)), (x1 + w1, to1(0, 0).at(1)), stroke: black)
      draw.line((to1(0, 0).at(0), y1), (to1(0, 0).at(0), y1 + h1), stroke: black)
      let f = y => (y - 2) * (y + 1)
      let n = 180
      for j in range(n) {
        let a = xmin + (xmax - xmin) * j / n
        let b = xmin + (xmax - xmin) * (j + 1) / n
        draw.line((to1(a, f(a))), (to1(b, f(b))), stroke: (paint: blue, thickness: 1.4pt))
      }
      draw.circle(to1(-1, 0), radius: 2.3pt, fill: white, stroke: blue)
      draw.circle(to1(2, 0), radius: 2.3pt, fill: white, stroke: blue)
      draw.content((to1(-1, 0).at(0), to1(-1, 0).at(1) - 0.35), [$-1$], anchor: "south")
      draw.content((to1(2, 0).at(0), to1(2, 0).at(1) - 0.35), [$2$], anchor: "south")

      // Right: phase line
      let to2 = y => (
        x2 + w2 / 2,
        y2 + (y - (-2.0)) * h2 / (3.0 - (-2.0)),
      )
      draw.line((x2 + w2 / 2, y2), (x2 + w2 / 2, y2 + h2), stroke: black)
      draw.circle(to2(-1), radius: 2.2pt, fill: white, stroke: black)
      draw.circle(to2(2), radius: 2.2pt, fill: white, stroke: black)
      // Arrows: + for y < -1, - for (-1,2), + for > 2
      let seg = (ya, yb, up) => {
        let p0 = to2(ya)
        let p1 = to2(yb)
        let midy = (p0.at(1) + p1.at(1)) / 2
        if up {
          draw.line((p0.at(0), midy - 0.7), (p0.at(0), midy + 0.7), mark: (end: ">"))
        } else {
          draw.line((p0.at(0), midy + 0.7), (p0.at(0), midy - 0.7), mark: (end: ">"))
        }
      }
      seg(-2.0, -1, true)
      seg(-1, 2, false)
      seg(2, 3.0, true)
      draw.content((x2 + w2, to2(-1).at(1) + 0.3), [stable], anchor: "west")
      draw.content((x2 + w2, to2(2).at(1) + 0.3), [unstable], anchor: "west")
    })
  },
  caption: [Phase line and $f(y)$ for $y' = (y - 2)(y + 1)$. The equilibrium $y = -1$ is a sink (stable) while $y = 2$ is a source (unstable).],
)

=== Phase Line 3: $y' = (y - 1)^2(2 - y)$

#figure(
  {
    import "@preview/cetz:0.4.2": canvas, draw

    canvas(length: 1cm, {
      let W = 13
      let H = 6.5
      let x1 = 0
      let y1 = 0
      let w1 = 7.5
      let h1 = H
      let x2 = 8.5
      let y2 = 0
      let w2 = 3.0
      let h2 = H

      // Left: f(y)
      let ymin = -1.5
      let ymax = 2.5
      let xmin = -0.5
      let xmax = 3.0
      let to1 = (x, y) => (
        x1 + (x - xmin) * w1 / (xmax - xmin),
        y1 + (y - ymin) * h1 / (ymax - ymin),
      )
      draw.line((x1, to1(0, 0).at(1)), (x1 + w1, to1(0, 0).at(1)), stroke: black)
      draw.line((to1(0, 0).at(0), y1), (to1(0, 0).at(0), y1 + h1), stroke: black)
      let f = y => (y - 1) * (y - 1) * (2 - y)
      let n = 180
      for j in range(n) {
        let a = xmin + (xmax - xmin) * j / n
        let b = xmin + (xmax - xmin) * (j + 1) / n
        draw.line((to1(a, f(a))), (to1(b, f(b))), stroke: (paint: blue, thickness: 1.4pt))
      }
      draw.circle(to1(1, 0), radius: 2.3pt, fill: white, stroke: blue)
      draw.circle(to1(2, 0), radius: 2.3pt, fill: white, stroke: blue)
      draw.content((to1(1, 0).at(0), to1(1, 0).at(1) - 0.35), [$1$], anchor: "south")
      draw.content((to1(2, 0).at(0), to1(2, 0).at(1) - 0.35), [$2$], anchor: "south")

      // Right: phase line
      let to2 = y => (
        x2 + w2 / 2,
        y2 + (y - 0.0) * h2 / (3.0 - 0.0),
      )
      draw.line((x2 + w2 / 2, y2), (x2 + w2 / 2, y2 + h2), stroke: black)
      draw.circle(to2(1), radius: 2.2pt, fill: white, stroke: black)
      draw.circle(to2(2), radius: 2.2pt, fill: white, stroke: black)
      // Signs: positive for y < 2, negative for y > 2; repeated root at 1 => no sign change
      let seg = (ya, yb, up) => {
        let p0 = to2(ya)
        let p1 = to2(yb)
        let midy = (p0.at(1) + p1.at(1)) / 2
        if up {
          draw.line((p0.at(0), midy - 0.7), (p0.at(0), midy + 0.7), mark: (end: ">"))
        } else {
          draw.line((p0.at(0), midy + 0.7), (p0.at(0), midy - 0.7), mark: (end: ">"))
        }
      }
      seg(0.0, 1.0, true)
      seg(1.0, 2.0, true) // still up: semi-stable at 1
      seg(2.0, 3.0, false)
      draw.content((x2 + w2, to2(2).at(1) + 0.3), [stable], anchor: "west")
      draw.content((x2 + w2, to2(1).at(1) + 0.3), [semi-stable], anchor: "west")
    })
  },
  caption: [Phase line paired with $f(y)$ for $y' = (y - 1)^2(2 - y)$. The repeated root at $y = 1$ yields a semi-stable equilibrium (no sign change), while $y = 2$ is a stable sink.],
)
