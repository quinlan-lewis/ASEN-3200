function [x,y,z] = Prox_xyz(x0,y0,z0,xdot0,ydot0,zdot0,n,t)
    phi_rr = [(4-3*cos(n*t)) 0 0; (6*(sin(n*t)-n*t)) 1 0; 0 0 cos(n*t)];
    r_0 = [x0; y0; z0];
    phi_rv = [((1/n)*sin(n*t)) (2/n)*(1-cos(n*t)) 0; (2/n)*(cos(n*t)-1) (4/n)*sin(n*t)-3*t 0; 0 0 (1/n)*sin(n*t)];
    v_0 = [xdot0; ydot0; zdot0];
    
    r_t = phi_rr*r_0 + phi_rv*v_0;
    
    x = r_t(1); y = r_t(2); z = r_t(3);
end

