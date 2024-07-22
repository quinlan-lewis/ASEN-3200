function [xdot,ydot,zdot] = Prox_xyz_dot(x0,y0,z0,xdot0,ydot0,zdot0,n,t)
    phi_vr = [(3*n*sin(n*t)) 0 0; (6*n*(cos(n*t)-1)) 0 0; 0 0 -n*sin(n*t)];
    r_0 = [x0; y0; z0];
    phi_vv = [cos(n*t) 2*sin(n*t) 0; -2*sin(n*t) 4*cos(n*t)-3 0; 0 0 cos(n*t)];
    v_0 = [xdot0; ydot0; zdot0];
    
    v_t = phi_vr*r_0 + phi_vv*v_0;
    
    xdot = v_t(1); ydot = v_t(2); zdot = v_t(3);
end

