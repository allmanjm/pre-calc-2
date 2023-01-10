class Generator(BaseGenerator):
    def data(self):
        A,B,C = var('A,B,C');

        s = sample(range(2,10),2);
        a = s[0];
        b = s[1];

        p = randrange(2,10);
        trans_deriv_dict = {"s": cos, "c": sin, "e": exp};
        t = choice(["s","c","e"]);
        sign = choice([1,-1]);

        lhs = p*B^(p-1)*C + sign*(A*C+B)*trans_deriv_dict[t](A*B);
        rhs = a*A^(a-1)*B^b + b*A^a*B^(b-1);

        return {
            "lhs": lhs,
            "rhs": rhs,
            "num_ans": rhs - sign*B*trans_deriv_dict[t](A*B),
            "den_ans": p*B^(p-1) + sign*A*trans_deriv_dict[t](A*B),
        }
