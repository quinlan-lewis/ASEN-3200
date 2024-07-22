function [e,a,i,Omega,omega,theta] = OrbitalChars(r,v,mu)
    X = [1;0;0];
    Y = [0;1;0];
    Z = [0;0;1];

    h = cross(r,v);
    n = cross(Z,h);
    
    e = cross(v,h)/mu - r/norm(r);
    a = norm(h)^2/(mu*(1 - norm(e)^2));
    i = acos(dot(Z,h)/(norm(Z)*norm(h)));
    
    Omega = acos(dot(X,n)/(norm(X)*norm(n)));
    check = dot(n,Y);
    if (check>0) && (Omega>0) && (Omega<pi)
        Omega = Omega;
    elseif (check>0) && (Omega<0) && (Omega>pi)
        Omega = pi - Omega;
    elseif (check<0) && (Omega>pi) && (Omega<2*pi)
        Omega = Omega;
    elseif (check<0) && (Omega<pi) && (Omega<2*pi)
        Omega = 2*pi - Omega;
    end
 
    omega = acos(dot(n,e)/(norm(n)*norm(e)));
    check = dot(e,Z);
    if (check>0) && (omega>0) && (omega<pi)
        omega = omega;
    elseif (check>0) && (omega<0) && (omega>pi)
        omega = pi - omega;
    elseif (check<0) && (omega>pi) && (omega<2*pi)
        omega = omega;
    elseif (check<0) && (omega<pi) && (omega<2*pi)
        omega = 2*pi - omega;
    end
    
    theta = acos(dot(r,e)/(norm(r)*norm(e)));
    check = dot(r,v);
    if (check>0) && (theta>0) && (theta<pi)
        theta = theta;
    elseif (check>0) && (theta<0) && (theta>pi)
        theta = pi - theta;
    elseif (check<0) && (theta>pi) && (theta<2*pi)
        theta = theta;
    elseif (check<0) && (theta<pi) && (theta<2*pi)
        theta = 2*pi - theta;
    end
    
end

