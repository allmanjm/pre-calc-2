class Generator(BaseGenerator):
    def data(self):
        x = var('x');
        
        s = sample(range(-9,10),2);
        r1=s[0];
        r2=s[1];

        poly = expand((x-r1)*(x-r2));

        # task1 stuff
        a1 = randrange(2,10)*choice([1,-1]);
        b1 = randrange(1,10)*choice([1,-1]);
        ba1=-b1/a1

        zeroes1 = [r1,r2,exp(-b1/a1)];

        ticks1 = sorted([t for t in zeroes1 if t>0]);
        tm1 = sorted([n(t) for t in ticks1]);
        
        if r1>0 and r2>0:
            zero_str1 = str(r1) + ', ' + str(r2) +', ' + 'e^{' + str(ba1) + '}';
        elif r1>0:
            zero_str1 = str(r1) + ', ' + 'e^{' + str(ba1) + '}';
        elif r2>0:
            zero_str1 = str(r2) + ', ' + 'e^{' + str(ba1) + '}';
        else:
            zero_str1 = 'e^{' + str(ba1) + '}';

        
        if b1>0:
            s1 = "+";
        else:
            s1 = " "


        m1 = 0;
        M1 = max(tm1) + 3;

        test_pts1 = [(m1+tm1[0])/2];
        i1=1;
        while i1<len(tm1):
            test_pts1 += [(tm1[i1-1]+tm1[i1])/2]
            i1 += 1

        test_pts1 += [(tm1[-1]+M1)/2];

        d1 = M1-m1;
        eps1 = d1/120;

        pos_pts1 = [];
        neg_pts1 = [];

        f(x) = (x-r1)*(x-r2)*(a1*log(x)+b1)

        for t in test_pts1:
            if f(t)>0:
                pos_pts1 += [(t,0.75*eps1)]
            else:
                neg_pts1 += [(t,0.75*eps1)]



        # task2 stuff
        a2 = randrange(2,10)*choice([1,-1]);
        b2 = randrange(1,10)*choice([1,-1]);
        ba2 = -b2/a2

        if ba2>0:
            ticks2 = sorted(list(set([r1,r2,log(ba2)])))
            zero_str2 = str(r1) + ', ' + str(r2) + ', ' + r'\ln(' + str(ba2) + ')'
        else:
            ticks2 = sorted(list(set([r1,r2])))
            zero_str2 = str(r1) + ', ' + str(r2)
        
        tm2 = [real_part(n(t)) for t in ticks2]
        
        if b2>0:
            s2 = "+";
        else:
            s2 = " "

        m2 = min(tm2) - 3;
        M2 = max(tm2) + 3;

        test_pts2 = [(m2+tm2[0])/2];
        i2=1;
        while i2<len(tm2):
            test_pts2 += [(tm2[i2-1]+tm2[i2])/2]
            i2 += 1

        test_pts2 += [(tm2[-1]+M2)/2];

        d2 = M2-m2;
        eps2 = d2/120;

        pos_pts2 = [];
        neg_pts2 = [];

        g(x) = (x-r1)*(x-r2)*(a2*exp(x)+b2)

        for t in test_pts2:
            if g(t)>0:
                pos_pts2 += [(t,0.75*eps2)]
            else:
                neg_pts2 += [(t,0.75*eps2)]
        

        # task3 stuff
        a3 = choice([1,2]);
        eps3 = choice([1,-1]);
        b3 = randrange(2,10)*choice([1,-1]);

        coeff1 = -eps3 - a3*b3;
        coeff0 = eps3*b3;

        if coeff1>0:
            sign1 = "+";
        else:
            sign1 = " ";

        if coeff0>0:
            sign0 = "+";
        else:
            sign0 = " ";
        

        if eps3/a3 == 1/2:
            ticks3 = sorted([r1,r2]+[-11*pi/6,-7*pi/6,pi/6,5*pi/6,13*pi/6,17*pi/6]);
            trig_zero_str = [r'-\frac{11\pi}{6}',r'-\frac{7\pi}{6}',r'\frac{\pi}{6}',r'\frac{5\pi}{6}',r'\frac{13\pi}{6}',r'\frac{17\pi}{6}']
        elif eps3/a3 == -1/2:
            ticks3 = sorted([r1,r2]+[11*pi/6,7*pi/6,-pi/6,-5*pi/6,-13*pi/6,-17*pi/6]);
            trig_zero_str = [r'\frac{11 \pi}{6}',r'\frac{7 \pi}{6}',r'-\frac{\pi}{6}',r'-\frac{5 \pi}{6}',r'-\frac{13 \pi}{6}',r'-\frac{17 \pi}{6}']
        elif eps3/a3 == 1:
            ticks3 = sorted([r1,r2]+[-3*pi/2,pi/2,5*pi/2]);
            trig_zero_str = [r'-\frac{3 \pi}{2}',r'\frac{\pi}{2}',r'\frac{5 \pi}{2}'];
        else:
            ticks3 = sorted([r1,r2]+[3*pi/2,-pi/2,-5*pi/2]);
            trig_zero_str = [r'\frac{3 \pi}{2}',r'-\frac{\pi}{2}',r'-\frac{5 \pi}{2}']

        tm3 = [n(t) for t in ticks3]

        non_trig_zeros = sorted(list(set([r1,r2])))
        
        zero_str3 = str(non_trig_zeros[0])

        kk=1
        while kk<len(non_trig_zeros):
            zero_str3 = zero_str3 + ', ' + str(non_trig_zeros[kk])
            kk += 1
        
        n3 = len(trig_zero_str)
        k=0
        while k<n3:
            zero_str3 = zero_str3 + ', ' + trig_zero_str[k]
            k += 1

        if a3==1:
            A3 = " ";
        else:
            A3 = a3;

        m3 = -3*pi;
        M3 = 3*pi;

        test_pts3 = [(m3+tm3[0])/2];
        i3=1;
        while i3<len(tm3):
            test_pts3 += [(tm3[i3-1]+tm3[i3])/2]
            i3 += 1

        test_pts3 += [(tm3[-1]+M3)/2];

        d3 = M3-m3;
        eps = d3/120;

        pos_pts3 = [];
        neg_pts3 = [];

        h(x) = (x-r1)*(x-r2)*(a3*(sin(x))^2-(eps3+a3*b3)*sin(x)+eps3*b3)

        for t in test_pts3:
            if h(t)>0:
                pos_pts3 += [(t,0.75*eps)]
            else:
                neg_pts3 += [(t,0.75*eps)]
        

        return {
            "poly": poly,
            "a1": a1,
            "b1": b1,
            "tm1": tm1,
            "z1": zero_str1,
            "s1": s1,
            "a2": a2,
            "b2": b2,
            "tm2": tm2,
            "z2": zero_str2,
            "s2": s2,
            "a3": a3,
            "A3": A3,
            "b3": b3,
            "sign1": sign1,
            "sign0": sign0,
            "coeff1": coeff1,
            "coeff0": coeff0,
            "tm3": tm3,
            "z3": zero_str3,
            "m1": m1,
            "M1": M1,
            "pp1": pos_pts1,
            "np1": neg_pts1,
            "e1": eps1,
            "m2": m2,
            "M2": M2,
            "pp2": pos_pts2,
            "np2": neg_pts2,
            "e2": eps2,
            "m3": m3,
            "M3": M3,
            "pp3": pos_pts3,
            "np3": neg_pts3,
            "e3": eps,
        }

    @provide_data
    def graphics(data):

        return {
            "Show1": plot(0, (data["m1"]+data["e1"],data["M1"]), ticks = [data["tm1"],[]], ymin = -1.2*data["e1"], ymax = 1.2*data["e1"], aspect_ratio = 1) + point(data["pp1"], size = 35, marker = "$+$")+point(data["np1"], size = 35, marker = "$-$")+point((data["M1"],0), size = 50, marker = ">")+circle((0,0),data["e1"]),
            "Show2": plot(0, (data["m2"],data["M2"]), ticks = [data["tm2"],[]], ymin = -1.2*data["e2"], ymax = 1.2*data["e2"], aspect_ratio = 1) + point(data["pp2"], size = 35, marker = "$+$")+point(data["np2"], size = 35, marker = "$-$")+point((data["M2"],0), size = 50, marker = ">")+point((data["m2"],0), size = 50, marker = "<"),
            "Show3": plot(0, (data["m3"],data["M3"]), ticks = [data["tm3"],[]], ymin = -1.2*data["e3"], ymax = 1.2*data["e3"], aspect_ratio = 1) + point(data["pp3"], size = 35, marker = "$+$")+point(data["np3"], size = 35, marker = "$-$")+point((data["M3"],0), size = 50, marker = ">")+point((data["m3"],0), size = 50, marker = "<"),
        }
