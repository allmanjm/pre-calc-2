class Generator(BaseGenerator):
    def data(self):

        t = var('t');
        
        A = randrange(2,6)*choice([1,-1]);
        B = randrange(2,21)*choice([1,-1]);
        p = randrange(2,6);

        scCoeff = A*2^p;
        cCoeff1 = B;
        cCoeff2 = 2*B;
        sCoeff1 = -B;
        sCoeff3 = -2*B;

        def coeff_str(coeff):
            if coeff < 0:
                cstr = " " + str(coeff)
            else:
                cstr = "+" + str(coeff)
            
            return cstr


        k = randrange(1,6);
        l = randrange(1,6);
        a = randrange(2,21);
        b = randrange(2,21);
        arg1 = k*t;
        arg2 = l*t;
        
        answer = (a-b)/2 + (a/2)*cos(2*k*t) + (b/2)*cos(2*l*t);


        return {
            "A": A,
            "B": coeff_str(B),
            "p": p,
            "sc": scCoeff,
            "c1": coeff_str(cCoeff1),
            "c2": coeff_str(cCoeff2),
            "s1": coeff_str(sCoeff1),
            "s3": coeff_str(sCoeff3),
            "const2": coeff_str(-B),
            "const3": coeff_str(B),
            "a": a,
            "b": b,
            "arg1": arg1,
            "arg2": arg2,
            "ans": answer,
        }
