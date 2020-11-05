function x= Intrianle(test)
A=[0,0,0];
B=[1,1,1];
C=[1,0,0];
Photo=[0,0,1];
disAtest=sqrt((A-test)* (A-test)');
disBtest=sqrt((B-test)* (B-test)');
disCtest=sqrt((C-test)* (C-test)');
if (disAtest==0|| disBtest==0 || disCtest==0)
    x=2;    
else
    
    v0=C-A;
    v1=B-A;
    Vc=test-Photo;
    n=cross(v0,v1);
    n=n/(n*n');
    if (n*Vc'==0)
        x=3;
    else
        tHit= n*(B-Photo)'./(n*Vc');
        phit=test+Vc.*tHit;
        v2=phit-A;
        dot00=v0*v0';
        dot01=v0*v1';
        dot02=v0*v2';
        dot11=v1*v1';
        dot12=v1*v2';
        invDenom = 1 / (dot00 * dot11 - dot01 * dot01);
        u = (dot11 * dot02 - dot01 * dot12) * invDenom;
        v = (dot00 * dot12 - dot01 * dot02) * invDenom;
        
        % Check if point is in triangle
        if ((u >= 0) && (v >= 0) && (u + v < 1))
            x=1;
        else
            x=0;
        end
    end
end