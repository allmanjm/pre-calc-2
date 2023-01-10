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

        if data["B"]<0:
            ymin = 2.5*data["B"];
            ymax = -2.7*data["B"];
            spot = ymin;
        else:
            ymin = -2.7*data["B"];
            ymax = 2.5*data["B"];
            spot = ymax;

        asymp_text = r'$x=$'+str(data["a"]);
        

        return {
            "Show2": plot(log(x),(x,0,10))+line([(0,-2.7),(0,2.5)],linestyle='--',color='red',thickness=2)+point((1,0),pointsize=20,color='red')+text(r'$(1,0)$',(1,0),horizontal_alignment='right',vertical_alignment='bottom',color='red')+text(r'$x=0$',(0.01,2.5),horizontal_alignment='left',vertical_alignment='top',color='red'),
            "Show1": plot(exp(x),(x,-3,2.5))+line([(-2.7,0),(2.5,0)],linestyle='--',color='red',thickness=2)+point((0,1),pointsize=20,color='red')+text(r'$(0,1)$',(0,1),horizontal_alignment='left',vertical_alignment='top',color='red')+text(r'$y=0$',(2.5,0.01),horizontal_alignment='right',vertical_alignment='bottom',color='red'),
            "Show3": plot(data["B"]*log(x-data["a"]),(x,data["a"],data["a"]+10))+line([(data["a"],ymin),(data["a"],ymax)],linestyle='--',color='red',thickness=2)+point((data["a"]+1,0),pointsize=20,color='red')+text((data["a"]+1,0),(data["a"]+1,0),horizontal_alignment='right',vertical_alignment='bottom',color='red')+point((data["a"]+e,data["B"]),pointsize=20,color='red')+text((data["a"]+e,data["B"]),(data["a"]+e,data["B"]),horizontal_alignment='right',vertical_alignment='bottom',color='red')+text(asymp_text,(data["a"]+0.01,spot),horizontal_alignment='left',vertical_alignment='top',color='red'),
        }
