%Bisección: se ingresa el valor inicial y final del intervalo (xi, xs), la tolerancia del error (Tol) y el màximo nùmero de iteraciones (niter) 

function [s,tabla,output] = Biseccion(xi,xs,Tol,niter,f)
    syms x
    tabla=table();
    s=0;
    E=0;
    fm=0;
    
    
    fi=double(subs(f,x,xi));
    fs=double(subs(f,x,xs));
    if fi==0
        s=xi;
        E=0;
        output=sprintf('%f es raiz de f(x)',xi);
    elseif fs==0
        s=xs;
        E=0;
        output=sprintf('%f es raiz de f(x)',xs);
    elseif fs*fi<0
        c=0;
        xm=(xi+xs)/2;
        fm(c+1)=double(subs(f,x,xm));
        fe=fm(c+1);
        E(c+1)=Tol+1;
        error=E(c+1);
        while error>Tol && fe~=0 && c<niter
            if fi*fe<0
                xs=xm;
                fs=double(subs(f,x,xs));
            else
                xi=xm;
                fi=double(subs(f,x,xi));
            end
            xa=xm;
            xm=(xi+xs)/2;
            fm(c+2)=double(subs(f,x,xm));
            fe=fm(c+2);
            E(c+2)=abs(xm-xa);
            error=E(c+2);
            c=c+1;
        end
        if fe==0
           s=xm;
           tabla=table(flip(fm',1),flip(E',1));
           output=sprintf('%f es raiz de f(x)',xm);
        elseif error<Tol
           s=xm;
           tabla=table(flip(fm',1),flip(E',1));
           output=sprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f',xm,Tol);
        else 
           s=xm;
           tabla=table(flip(fm',1),flip(E',1));
           output=sprintf('Fracasó en %f iteraciones',niter);
        end
    else
       output=sprintf('El intervalo es inadecuado');       
    end    
    
end