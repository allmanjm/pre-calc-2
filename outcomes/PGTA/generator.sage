class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        a = randrange(1,8)*choice([-1,1]);
        B = randrange(2,15)*choice([-1,1]);

        if B<0:
            sign = "-";
        else:
            sign = " ";
        
        arg = x-a;

        return {
            "a": a,
            "B": B,
            "sign": sign,
            "arg": arg
        }
    
    @provide_data
    def graphics(data):

        tan_graph = plot(tan(x),(x,-pi,pi),color='blue',ymin=-4,ymax=4,aspect_ratio=1,ticks=pi/2,tick_formatter=pi,detect_poles=True);
        pts_graph = points([(-pi,0),(0,0),(pi,0)],pointsize = 20, color='red');
        asy_graph = line([(-pi/2,-4),(-pi/2,4)],color='red',linestyle='--')+line([(pi/2,-4),(pi/2,4)],color='red',linestyle='--');

        atan_graph = plot(arctan(x),(x,-4,4),ymin=-pi, ymax=pi,color='blue',aspect_ratio=1,ticks=[None,pi/2],tick_formatter=[None,pi]);
        apts_graph = point((0,0),pointsize = 20, color='red');
        aasy_graph = line([(-4,-pi/2),(4,-pi/2)],color='red',linestyle='--')+line([(-4,pi/2),(4,pi/2)],color='red',linestyle='--');

        if data["B"]<0:
            y_min = pi*data["B"];
            y_max = -pi*data["B"];
        else:
            y_min = -pi*data["B"];
            y_max = pi*data["B"];

        x_min = data["a"]-4;
        x_max = data["a"]+4;

        graph2 = plot(data["B"]*arctan(x-data["a"]),(x,x_min,x_max),ymin=y_min,ymax=y_max,color='blue',ticks=[None,y_max/2],tick_formatter=[None,pi]);
        pts2 = point((data["a"],0),pointsize=20,color='red');
        asy2 = line([(x_min,y_min/2),(x_max,y_min/2)],color='red',linestyle='--')+line([(x_min,y_max/2),(x_max,y_max/2)],color='red',linestyle='--');
        

        return {
            "Show1": tan_graph + pts_graph + asy_graph,
            "Show2": atan_graph + apts_graph + aasy_graph,
            "Show3": graph2 + pts2 + asy2,
        }
