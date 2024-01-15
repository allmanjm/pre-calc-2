class Generator(BaseGenerator):
    def data(self):
        # task1 stuff
        f = choice([r'\sin^2(\theta)',r'\cos^2(\theta)']);
        p = randrange(2,10);
        g = choice([r'\tan',r'\cot',r'\sec',r'\csc']);
        sign = choice(["+","-"]);
        
        if f == r'\sin^2(\theta)':  
            if sign == "+":
                h = r'\cos^2(\theta)';
                b = " ";
                q = " ";
            else:
                h = " ";
                b = r"\cos^2(\theta) ";
                q = sign;
        else:
            if sign == "+":
                h = r'\sin^2(\theta)';
                b = " ";
                q = " ";
            else:
                h = " ";
                b = r'\sin^2(\theta)';
                q = sign;
        
        
        # task2 stuff
        F = choice([r'\tan^2(\theta)',r'\cot^2(\theta)']);
        P = randrange(2,10);
        SIGN = choice(["+","-"]);



        if F == r'\tan^2(\theta)':
            G = choice([r'\sin',r'\cot',r'\cos',r'\csc']);
            if SIGN == "+":
                H = " ";
                B = r"\sec^2(\theta)";
                Q = " "
            else:
                H = r'\sec^2(\theta)';
                B = " ";
                Q = SIGN;
        else:
            G = choice([r'\sin',r'\tan',r'\cos',r'\sec']);
            if SIGN == "+":
                H = " ";
                B = r'\csc^2(\theta)';
                Q = " ";
            else:
                H = r'\csc^2(\theta)';
                B = " ";
                Q = SIGN;




        return {
            "f": f,
            "g": g,
            "p": p,
            "h": h,
            "b": b,
            "q": q,
            "pm": sign,
            "F": F,
            "G": G,
            "P": P,
            "H": H,
            "B": B,
            "Q": Q,
            "PM": SIGN,
        }
