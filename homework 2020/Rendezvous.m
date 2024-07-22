function [xdot,ydot,zdot] = Rendezvous(x0,y0,z0,n,t)
    ydot = ( n*sin(n*t)*(6*x0*(n*t-sin(n*t))-y0) - 2*n*x0*(4-3*cos(n*t))*(1-cos(n*t)) )...
        /( (4*sin(n*t)-3*n*t)*sin(n*t) + 4*(1-cos(n*t))^2 );
    xdot = ( -n*x0*(4-3*cos(n*t)) + 2*(1-cos(n*t))*ydot )/(sin(n*t));
    zdot = -z0*n*cot(n*t);
end

