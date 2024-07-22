function [r2,v2] = Gibbs(r1,r2,r3,mu)
    alpha = 90 - acosd(  (dot( r1, (cross(r2,r3)) ))/ ( norm(r1) * norm(cross(r2,r3)) )  );
    %about zero so coplanar
    cc = cross(r1, r2);
    check = dot(cc,r3);

    D = cross(r1,r2) + cross(r2,r3) + cross(r3,r1);
    N = norm(r1)*cross(r2,r3) + norm(r2)*cross(r3,r1) + norm(r3)*cross(r1,r2);
    S = (norm(r2) - norm(r3))*r1 + (norm(r3) - norm(r1))*r2 + (norm(r1) - norm(r2))*r3;
    B = cross(D,r2);

    v2 = sqrt( mu / (norm(N) * norm(D)) ) * ( cross(D,r2)/norm(r2) + S  );

end

