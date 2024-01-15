class Generator(BaseGenerator):
    def data(self):
        plist = [2,3,5,7,9,11,13];
        p = choice(plist);

        # task1.1 stuff
        if p == 2:
            r11 = randrange(2,8)*choice([1,-1]);
        elif p == 3:
            r11 = randrange(2,6)*choice([1,-1]);
        elif p == 5 or p == 7:
            r11 = randrange(2,4)*choice([1,-1]);
        else:
            r11 = choice([2,-2]);

        if p < 7:
            m = randrange(5);
        elif p == 7:
            m = randrange(4);
        else:
            m = choice([0,1]);

        r21 = (2*m+1)/2;
        r1 = r11 + r21;

        if r1 == 1:
            disp_r1 = " ";
        else:
            disp_r1 = r1;

        

        # task2 stuff
        x = var('x');
        s = sample(range(1,9),3);
        a = s[0]*choice([-1,1]);
        b = s[1]*choice([-1,1]);
        c = s[2];

        pp = choice(["","2","3"]);
        qq = choice(["","2","3"]);
        rr = choice(["","2","3"]);

        power_dict = {"":1,"2":2,"3":3};

        f(x) = x^(power_dict[pp])*(x-a)^(power_dict[qq])*(x-b)^(power_dict[rr])/(x^2-c^2);


        # task3 stuff
        b = choice([2,3,5,7,11,13]);

        s1 = randrange(-9,10);
        s2 = randrange(-9,10);
        s3 = choice([i for i in range(-9,10) if i!=s1 and i!=-s1 and i!=s2 and i!=-s2]);
        s4 = s1+s2-s3;

        prod12 = s1*s2;
        prod34 = s3*s4;

        if prod12>prod34:
            d = prod12-prod34;
            a1 = s1;
            a2 = s2;
            a3 = s3;
            a4 = s4;
        else:
            d = prod34-prod12;
            a1 = s3;
            a2 = s4;
            a3 = s1;
            a4 = s2;

        S3 = min(a3,a4);
        S4 = max(a3,a4);

        if S3>a1 and S3>a2:
            answer1 = S3;
            answer2 = S4;
        elif S4>a1 and S4>a2:
            answer1 = S4;
            answer2 = " ";
        else:
            answer1 = "none";
            answer2 = " ";


        

        return {
            "p": p,
            "arg11": p^(r11),
            "arg21": p^(r21),
            "r1": r1,
            "disp_r1": disp_r1,
            "f": f(x),
            "afact": x-a,
            "bfact": x-b,
            "c1fact": x-c,
            "c2fact": x+c,
            "pp": power_dict[pp],
            "qq": power_dict[qq],
            "rr": power_dict[rr],
            "log1": x-a1,
            "log2": x-a2,
            "d": d,
            "b": b,
            "answer1": answer1,
            "answer2": answer2
        }
