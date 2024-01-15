class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        numa = randrange(1,10);
        denoma = choice([i for i in range(1,10) if i!=numa]);
        a = QQ(numa/denoma);
        b = randrange(1,13)*choice([-1,1]);
        numc = randrange(1,10);
        denomc = choice([i for i in range(1,10) if i!=numc]);
        c = QQ(numc/denomc);
        d = randrange(1,13)*choice([-1,1]);

        if b>0:
            sign_inside = "+";
        else:
            sign_inside = " ";

        
        

        TRAN = choice([r'\exp',r'\ln',r'\tan',r'\arctan']);

        if TRAN == r'\exp':
            tran = r'\ln';
        elif TRAN == r'\ln':
            tran = r'\exp';
        elif TRAN == r'\tan':
            tran = r'\arctan';
        else:
            tran = r'\tan';

        


        return {
            "a": a,
            "a1": 1/a,
            "b": b,
            "b1": -b,
            "c": c,
            "c1": 1/c,
            "d": d,
            "d1": -d,
            "TRAN": TRAN,
            "tran": tran,
            "sign_inside": sign_inside,
            "f1_arg": (x-d)/c,
            "ab1": QQ(-b/a),
        }
    
    @provide_data
    def graphics(data):

        tan_graph = plot(tan(x),(x,-pi,pi),color='blue',ymin=-4,ymax=4,aspect_ratio=1,ticks=pi/2,tick_formatter=pi,detect_poles=True);
        pts_graph = points([(-pi,0),(0,0),(pi,0)],pointsize = 20, color='red');
        asy_graph = line([(-pi/2,-4),(-pi/2,4)],color='red',linestyle='--')+line([(pi/2,-4),(pi/2,4)],color='red',linestyle='--');

        atan_graph = plot(arctan(x),(x,-4,4),ymin=-pi, ymax=pi,color='blue',aspect_ratio=1,ticks=[None,pi/2],tick_formatter=[None,pi]);
        apts_graph = point((0,0),pointsize = 20, color='red');
        aasy_graph = line([(-4,-pi/2),(4,-pi/2)],color='red',linestyle='--')+line([(-4,pi/2),(4,pi/2)],color='red',linestyle='--');

        exp_graph = plot(exp(x),(x,-4,4),color='blue',ymin=-10,ymax=70);
        exppts_graph = point((0,1),pointsize = 20, color='red');
        expasy_graph = line([(-4,0),(4,0)],color='red',linestyle='--');

        ln_graph = plot(ln(x),(x,0,35),color='blue',ymin=-4,ymax=4,detect_poles=True);
        lnpts_graph = point((1,0),pointsize=20,color='red');
        lnasy_graph = line([(0,-4),(0,4)],color='red',linestyle='--');



        
        

        return {
            "Show1": tan_graph + pts_graph + asy_graph,
            "Show2": atan_graph + apts_graph + aasy_graph,
            "Show3": exp_graph + exppts_graph + expasy_graph,
            "Show4": ln_graph + lnpts_graph + lnasy_graph,
        }
