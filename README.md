# Practical-Optimization
Cambridge MEng Coursework

1. Exploring usage of norm approximation in convex optimization problems.
- Starting with the simplest form norm approximation using l_1, l_2  and l_∞ norms, their algorithmically-applicable forms were derived: linear programming and least squares method 
- applied to 5 different overdetermined data pairs
- The performance of the different norms were compared by comparing computation times and histogramming the residuals
- it is found that there is a trade-off in using each norm for approximation. 
- Central path formulation using a logarithmic barrier function was explored. 
- This unconstrained minimization problem was solved using gradient descent, and its performance was evaluated via a simple convergence analysis. 
- A sparse signal reconstruction was explored in a l_1-regularised Least squares problem. This optimization problem was solved using a Newton interior-point method and resulted in a very successful signal recovery. This was compared to a minimum-energy reconstruction result without l_1-heuristics, which showed very poor signal recovery

2. Comparing the algorithmic performances of Simulated Annealing (SA) and Genetic Algorithm (GA), in solving a 5D function.
<p align="center">
<img width="400" alt="Screenshot 2022-03-24 at 17 24 30" src="https://user-images.githubusercontent.com/71874390/160012829-07a0c797-f44a-49ef-b081-9d3f7e759d2d.png">
</p>
<p align="center">
<img width="807" alt="Screenshot 2022-03-24 at 17 26 59" src="https://user-images.githubusercontent.com/71874390/160042392-61ad0b83-1411-48c1-aa43-39b5e5f33278.png">
</p>

-  In the global objective minimization of highly complicated continuous-variable functions, like the Rana Function, the Simulated Annealing Algorithm outperforms the Genetic Algorithm without dispute.
-  However, if the constraint was to keep the computational time or cost equivalent, rather than the number of objective evaluations to compare the two algorithms, results may have been different, as GA is computationally more efficient than SA. Unlike SA, which is a sequential program, GAs are well-suited to implementation on parallel computers, where objective function and constraint evaluations can be done simultaneously. 
- The algorithmic performance would have been better if we had used Evolution Strategies instead of GA, which is an algorithm that also simulates natural evolution and is computationally efficient also, but it is designed to be applied to continuous parameter optimization problems.
