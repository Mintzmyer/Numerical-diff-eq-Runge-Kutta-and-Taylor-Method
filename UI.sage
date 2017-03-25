# User Interface for solving differential equations numerically
# Author: Samantha Mintzmyer
# Site sources: Sage api docs, stack overflow

load Taylor.sage
load Runge_Kutta.sage

print 'Welcome to the UI!  A sample has been run for you:'
print 'f(y,t)=y-(t^2)+1'
print 'f0=0.5'
print 'start: t0=0.0'
print 'end: tz=2.0'
print 'step: h=0.5'

# Has preloaded diff eq, interval, etc
# Computes preloaded example, launches graph that visually compares methods
f(y,t)=y-(t^2)+1
f0=0.5
start=0.0
h=0.5
end=2.0

T1=Taylor1(f, f0, start, h, end)
T3=Taylor3(f, f0, start, h, end)
K2=Runge_Kutta2(f, f0, start, h, end)
K4=Runge_Kutta4(f, f0, start, h, end)

print 'Taylor Series w/ 2 terms: ',T1
print 'Taylor Series w/ 4 terms: ',T3
print 'Runge-Kutta w/ 2 terms: ',K2
print 'Runge-Kutta w/ 4 terms: ',K4

graph=[]
graph.append(list_plot(T1, plotjoined=True, color="light green"))
graph.append(list_plot(T3, plotjoined=True, color="dark green"))
graph.append(list_plot(K2, plotjoined=True, color="light purple"))
graph.append(list_plot(K4, plotjoined=True, color="dark purple"))
sum(graph)

# Enters Run Loop:
while(True):
    # Prompts user for diff eq, interval, etc
    print 'Please enter a new problem: (Ctrl-c to exit'
    f(y,t)=input('Function f(y,t)= ');
    f0=input('Initial value f0= ');
    start=input('start: t0= ');
    end=input('end: tz= ');
    h=input('step: h= ');

    # Computes numerical approximation of diff eq
    T1=Taylor1(f, f0, start, h, end)
    T3=Taylor3(f, f0, start, h, end)
    K2=Runge_Kutta2(f, f0, start, h, end)
    K4=Runge_Kutta4(f, f0, start, h, end)

    # launches graph that visually compares methods
    graph.append(list_plot(T1, plotjoined=True, color="light green"))
    graph.append(list_plot(T3, plotjoined=True, color="dark green"))
    graph.append(list_plot(K2, plotjoined=True, color="light purple"))
    graph.append(list_plot(K4, plotjoined=True, color="dark purple"))
    sum(graph)

    # Also prints results in case graph doesn't launch
    print 'Sage should plot all four approximations on a graph (not working in my browser). Here is the raw data.'
    print 'Taylor Series w/ 2 terms: ',T1
    print 'Taylor Series w/ 4 terms: ',T3
    print 'Runge-Kutta w/ 2 terms: ',K2
    print 'Runge-Kutta w/ 4 terms: ',K4

    # Exits at some point