xc2=0;yc2=0;
for j=0:3
    Beta = j * 0.5 * pi:.1:(j+1)*0.5*pi;
    a=97.057659149169922;
    b=17.567956924438246;
    Dopt=26.82765052539486;
    baseline=50;
    xc= (a+Dopt) * cos(Beta);
    yc= (b+Dopt) * sin (Beta);
    r=sqrt(xc.*xc+yc.*yc);
    eps =baseline./r;
    l=Beta+eps;
    
    xc2= (a+Dopt) * cos(l);
    yc2= (b+Dopt)* sin(l);			                
    plot(xc,yc)
    hold on
    plot(xc2,yc2, 'r')
end
