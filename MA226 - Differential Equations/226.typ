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

    canvas(length: 1cm, {
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

    canvas(length: 1cm, {
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

    canvas(length: 0.8cm, {
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

    canvas(length: 0.8cm, {
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

    canvas(length: 0.8cm, {
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

