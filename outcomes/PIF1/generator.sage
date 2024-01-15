class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        a=randrange(1,6)*choice([-1,1]);
        preb=choice([2*i+1 for i in range(1,4)])*choice([-1,1]);
        b = choice([preb,1/preb]);
        prec = randrange(2,10);
        c=choice([prec,1/prec]);

        
        if a<0:
            sign1 = "+";
            a1 = -a;
        else:
            sign1 = "-";
            a1 = a;


        return {
            "a": a,
            "a1": a1,
            "b": b,
            "b1": 1/b,
            "c": c,
            "c1": 1/c,
            "farg": x+a,
            "f1arg": x/c,
            "sign1": sign1,
        }