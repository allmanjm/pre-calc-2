class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        b0 = randrange(7);
        b1 = randrange(7);

       

        sx = randrange(2,26);
        sy = randrange(2*sx+1,4*sx);

        if sx*sy+sy*b0-sx*b1>0:
            a1 = randrange(ceil(sy/sx)+1,13);
        else:
            a1 = randrange(1,ceil(sy/sx));


        p = x+b0;
        h = a1*x+b1;

        ans = Rational((sx*sy+sy*b0-sx*b1)/(sx*a1-sy));

        return {
            "answer": ans,
            "p": p,
            "h": h,
            "a1": a1,
            "b0": b0,
            "b1": b1,
            "sx": sx,
            "sy": sy,
        }
    
    @provide_data
    def graphics(data):

        A1 = data["a1"];
        B0 = data["b0"];
        B1 = data["b1"];

        smallbase = data["sx"];
        smallheight = data["sy"];

        bigbase = data["sx"] + data["answer"]+B0;
        bigheight = A1*(data["answer"]) + B1;

        dx = bigbase - smallbase
        sqsize = min(smallbase,dx)

        smalltriangle = polygon2d([(0,0),(smallbase,0),(smallbase,smallheight)],fill=False,axes=False,aspect_ratio=1);
        bigtriangle = polygon2d([(0,0),(bigbase,0),(bigbase,bigheight)],fill=False,axes=False,aspect_ratio=1);

        sx_label = text(str(data["sx"]),(data["sx"]/2,-.2*dx),color='black');
        sy_label = text(str(data["sy"]),(smallbase+.2*dx,data["sy"]/2),color='black');
        p_label = text(r'$p(x)$', ((smallbase+bigbase)/2,-.2*dx),color='black');
        h_label = text(r'$h(x)$', (bigbase+.3*dx,bigheight/2),color='black');
        
        small_right = polygon2d([(smallbase,0),(smallbase,.2*sqsize),(smallbase-.2*sqsize,.2*sqsize),(smallbase-.2*sqsize,0)],fill=False,axes=False,aspect_ratio=1,thickness=0.7,color='black');
        big_right = polygon2d([(bigbase,0),(bigbase,.2*sqsize),(bigbase-.2*sqsize,.2*sqsize),(bigbase-.2*sqsize,0)],fill=False,axes=False,aspect_ratio=1,thickness=0.7,color='black');

        return {
            "Show": smalltriangle + bigtriangle + sx_label + sy_label + p_label + h_label + small_right + big_right,
        }
