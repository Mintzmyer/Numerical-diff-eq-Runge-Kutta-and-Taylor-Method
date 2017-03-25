# Taylor Series Method Implementation of variable order
# Author: Samantha Mintzmyer
# Site sources: Sage docs, stackoverflow, mat.iitm.ac.in

# Accepts function, place to approximate, error, and order
# Returns computed value, also consider error of approximation

def Taylor1(f, f0, start, h, end):

    steps=int((end-start)/h)
    tn=[w for w in [start..end, step=h] ]

    # Points for Taylor method approximations, Using up to the 1st derivative
    T1pts=[]

    # Add initial value to each order's approximation
    T1pts.append(f0)

    # Loops through terms of Taylor series
    # x(t+h) = x(t) + hx'(t) + 1/2!h^2x''(t)+...1/m!h^mx(m)(t)+...
    for i in range(1, int(steps)+1):
        pt1=T1pts[i-1]+h*f(tn[i-1],T1pts[i-1])
        T1pts.append(pt1)

    # Join up t and approximation
    for i in range(int(steps)+1):
        T1pts[i]=[tn[i],T1pts[i]]

    # Return summations of order 2
    return T1pts

def Taylor3(f, f0, start, h, end):

    steps=int((end-start)/h)
    tn=[w for w in [start..end, step=h] ]

    # Points for Taylor method approximations, Using up to the 3rd derivative
    T3pts=[]

    # Add initial value to each order's approximation
    T3pts.append(f0)

    # Generates needed differentiations of function per order
    # Places each function derivative in list fnddx[f(x), f'(x), f''(x), f'''(x) ]
    fnddx=[]
    fnddx.append(f0)
    fnddx.append(f)
    ddx2=f.diff(t)+f.diff(x)*f
    fnddx.append(ddx2)
    ddx3=f.diff(t).diff(t)+(2*f.diff(t).diff(x)*f)+(f.diff(x).diff(x)*f*f)+f.diff(x)*fnddx[2]
    fnddx.append(ddx3)

    # Loops through terms of Taylor series
    # x(t+h) = x(t) + hx'(t) + 1/2!h^2x''(t)+...1/m!h^mx(m)(t)+...
    # for i in range(len(fnddx)):
    #     ith loop: sum = (h^i)/(factorial(i))*fn[i](t=x)
    for i in range(1, int(steps)+1):
        pt3=T3pts[i-1]+h*f(tn[i-1],T3pts[i-1])+((h^2)/2)*fnddx[2](tn[i-1],T3pts[i-1])+((h^3)/factorial(3))*fnddx[3](tn[i-1],T3pts[i-1])
        T3pts.append(pt3)

    # Join up t and approximation
    for i in range(steps+1):
        T3pts[i]=[tn[i],T3pts[i]]

    # Return summations of order 2
    return T3pts
