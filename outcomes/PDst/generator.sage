class Generator(BaseGenerator):
    def data(self):
        xcoords = sample(range(-9,10),2);
        ycoords = sample(range(-9,10),2);
        p0 = (xcoords[0],ycoords[0]);
        p1 = (xcoords[1],ycoords[1]);
        dsquared = (p0[0] - p1[0])^2 + (p0[1]-p1[1])^2;
        d = sqrt(dsquared);

        # calculations for graphics
        x0 = xcoords[0];
        y0 = ycoords[0];
        x1 = xcoords[1];
        y1 = ycoords[1];
        dx = x1-x0;
        dy = y1-y0;
        m = dy/dx;
        
        y2 = min(ycoords);

        if m<0:
            x2 = min(xcoords);
        else:
            x2 = max(xcoords);
        
        p2 = (x2,y2);
        xeps = abs(dx)/5;
        yeps = abs(dy)/5;

        return {
            "p0": p0,
            "p1": p1,
            "p2": p2,
            "x0": x0,
            "x1": x1,
            "y0": y0,
            "y1": y1,
           "dist": d,
        }

    @provide_data
    def graphics(data):

        return {
            "Show": polygon2d([data["p0"],data["p1"],data["p2"]],color='red',fill=False,ticks=[[data["x0"],data["x1"]],[data["y0"],data["y1"]]]) + point(data["p0"],pointsize=20,color='blue') + point(data["p1"],pointsize=20,color='blue') + point(data["p2"],pointsize=20,color='blue'),
        }
