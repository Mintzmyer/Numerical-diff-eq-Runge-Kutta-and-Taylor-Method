# Runge-Kutta Method Implementation
# Author: Samantha Mintzmyer
# Site sources: doc.sagemath.org/, sagemath.wikispaces.com/, stackoverflow

# Accepts function, place to begin approximate, step size, place to end
# Returns computed values, also consider error of approximation

def Runge_Kutta2(fn, f0, start, h, end):
#    fn(y,t)=y-(t^2)+1
#    start=0.0
#    f0=0.5
#    h=0.5
#    end=2.0

    steps=int((end-start)/h)
    O2pts=[]
    tn=[w for w in [start..end, step=h] ]

    pt=f0
    O2pts.append(pt)

    # Order 2: x(t+h)=x(t) + (1/2)(K1+K2)
    #          x(t+h)=x(t) + (1/2)(hf(t,x) + hf(t+h, x+hf(t,x)))
    for i in range(1, int(steps)+1):
        K1=h*(fn(tn[i-1], O2pts[i-1]))
        K2=h*(fn(tn[i-1]+h, O2pts[i-1]+K1))
        pt=O2pts[i-1]+(1/2)*(K1+K2)
        O2pts.append(pt)

    # Join up t and approximation
    for i in range(steps+1):
        O2pts[i]=[tn[i],O2pts[i]]

    # Return summations of order 2
    return O2pts

def Runge_Kutta4(fn, f0, start, h, end):
#    fn(y,t)=y-(t^2)+1
#    start=0.0
#    f0=0.5
#    h=0.5
#    end=2.0

    steps=int((end-start)/h)
    O4pts=[]
    tn=[w for w in [start..end, step=h] ]

    pt=f0
    O4pts.append(pt)

    # Order 4: x(t+h)=x(t) + (1/6)(K1 + 2K2 + 2K3 + K4)
    #          K1=hf(t,x)
    #          K2=hf(t+(1/2)h, x+(1/2)K1)
    #          K3=hf(t+(1/2)h, x+(1/2)K2)
    #          K4=hf(t+h, x+k3)
    for i in range(1, int(steps)+1):
        K1=h*(fn(tn[i-1], O4pts[i-1]))
        K2=h*(fn(tn[i-1]+(h/2), O4pts[i-1]+(K1/2)))
        K3=h*(fn(tn[i-1]+(h/2), O4pts[i-1]+(K2/2)))
        K4=h*f(tn[i-1]+h, O4pts[i-1]+K3)
        pt=O4pts[i-1]+(1/6)*(K1+(2*K2)+(2*K2)+K4)
        O4pts.append(pt)

    # Join up t and approximation
    for i in range(steps+1):
        O4pts[i]=[tn[i],O4pts[i]]

    # Return summations of order 4
    return O4pts