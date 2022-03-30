# Practical Optimization Methods

Optimization is at the heart of many ML algorithms, including Linear Regression, Classification, Max Likelihood Estimation, k-means, graphical modesl, feature extraction and many more.

There are 2 parts of this project, and the report pdf for each project is attached.

# 1. Exploring using norm approximation in convex optimization problems.

In the first part of the project, we explore using norm approximation for convex optimization problems, explore interior-point methods using barrier functions in particular, and touch on sparse signal reocnstruction. A simple dataset with Matrix A and vector b is used to carry out the analysis.

- Starting with the simplest form norm approximation using l_1, l_2  and l_∞ norms, their algorithmically-applicable forms were derived: linear programming and least squares method 
- applied to 5 different overdetermined data pairs
- The performance of the different norms were compared by comparing computation times and histogramming the residuals
- it is found that there is a trade-off in using each norm for approximation. 
- Central path formulation using a logarithmic barrier function was explored. 
- This unconstrained minimization problem was solved using gradient descent, and its performance was evaluated via a simple convergence analysis. 
- A sparse signal reconstruction was explored in a l_1-regularised Least squares problem. This optimization problem was solved using a Newton interior-point method and resulted in a very successful signal recovery. This was compared to a minimum-energy reconstruction result without l_1-heuristics, which showed very poor signal recovery

# 2. Comparing the algorithmic performances of Simulated Annealing (SA) and Genetic Algorithm (GA)

In the second part of the project, The Genetic Algorithm (GA) and Simulated Annealing Algirhtm (SA) are explored as optimization techniques in solving a 5-Dimensional optimization problem.

Genetic Algirhtm is a random search-based algorithm known to be used in ML. The algorithm is based on the ideas of natural selection and genetics. GAs simulate the process of natural selection which means those species who can adapt to changes in their environment are able to survive and reproduce and go the next generation, simulating 'survivial of the fittest'.

Simulated Annealing is based on the temperature-time profile when annealing is performed. The optimization routine consists of finding a neighboring solution and accepting it with probability e^(f(c) – f(n)) where c is the current solution and n is the neighboring solution. A neighboring solution is found by applying a slight perturbation to the current solution. This randomness is useful to escape the common pitfall of optimization heuristics — getting trapped in local minima. By potentially accepting a less optimal solution than we currently have, and accepting it with probability inverse to the increase in cost, the algorithm is more likely to converge near the global optimum.

## Problem Formulation

<p align="center">
<img width="400" alt="Screenshot 2022-03-24 at 17 24 30" src="https://user-images.githubusercontent.com/71874390/160012829-07a0c797-f44a-49ef-b081-9d3f7e759d2d.png">
</p>
<p align="center">
<img width="807" alt="Screenshot 2022-03-24 at 17 26 59" src="https://user-images.githubusercontent.com/71874390/160042392-61ad0b83-1411-48c1-aa43-39b5e5f33278.png">
</p>

## Results

-  In the global objective minimization of highly complicated continuous-variable functions, like the Rana Function, the Simulated Annealing Algorithm outperforms the Genetic Algorithm without dispute.
-  However, if the constraint was to keep the computational time or cost equivalent, rather than the number of objective evaluations to compare the two algorithms, results may have been different, as GA is computationally more efficient than SA. Unlike SA, which is a sequential program, GAs are well-suited to implementation on parallel computers, where objective function and constraint evaluations can be done simultaneously. 
- The algorithmic performance would have been better if we had used Evolution Strategies instead of GA, which is an algorithm that also simulates natural evolution and is computationally efficient also, but it is designed to be applied to continuous parameter optimization problems.
- Reference: https://github.com/rmsolgi/geneticalgorithm for GA


