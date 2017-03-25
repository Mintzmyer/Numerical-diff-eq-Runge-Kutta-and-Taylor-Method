# Numerical-diff-eq-Runge-Kutta-and-Taylor-Method
A sage/python implementation of solving differential equations with Runge-Kutta and Taylor method, and a UI to compare them.

Implementation the Runge-Kutta method 
    and the Taylor series-based methods 
    for solving differential equations numerically.

Method:
    1-Open 'Run.term' or a new terminal
    2-Enter 'sage UI.sage' to launch the user interface
    3-Enter function and parameters as prompted
    Note: The UI *should* graph the data. The code runs fine on my local machine, and in browser it reports to have launched a graphics window,
        but none opens. I can't find any documentation on this, so I'm hoping this is an error with my browser and works fine for you.
        In lieu of a graphical representation of the approximations, it will also print out raw data points.
    4-Press 'Ctrl-c' to quit out of the loop.

Files:
    >UI.sage
        User interface for solving differential equations numerically with Taylor and Runge-Kutta methods

    >Runge_Kutta.sage
        Implementation of Runge-Kutta method for solving differential equations numerically.

    >Taylor.sage
        Implementation of Taylor method for solving differential equations numerically.

Sources: doc.sagemath.org/, sagemath.wikispaces.com/, stackoverflow, mat.iitm.ac.in, math.stackexchange.com, Numerical Mathematics and Computing
# Author: Samantha Mintzmyer
