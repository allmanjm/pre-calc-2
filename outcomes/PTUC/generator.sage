class Generator(BaseGenerator):
    def data(self):
        denom = choice([3,4,6]);
        ref_angle = pi/denom;
        cosQ1 = cos(ref_angle);
        sinQ1 = sin(ref_angle);

        A = choice([pi - ref_angle, ref_angle + pi, 2*pi - ref_angle]);

        sinA = sin(A);
        cosA = cos(A);
        tanA = tan(A);
        cotA = cot(A);
        secA = sec(A);
        cscA = csc(A);

        return {
            "denom": denom,
            "ref_angle": ref_angle,
            "sinQ1": sinQ1,
            "cosQ1": cosQ1,
            "ref_pt": (cosQ1,sinQ1),
            "angle": A,
            "sinA": sinA,
            "cosA": cosA,
            "tanA": tanA,
            "cotA": cotA,
            "secA": secA,
            "cscA": cscA,
            "pt": (cosA,sinA),
        }
    
    @provide_data
    def graphics(data):

        return {
            "Show1": point((0,0),pointsize=20,color='blue')+point((1,0),pointsize=20,color='blue')+point(data["ref_pt"],pointsize=20,color='blue')+circle((0,0),1,color='blue',linestyle="--")+arc((0,0), 1, sector=(0,data["ref_angle"]),color='red')+line([(0,0),(1,0)],color='red')+line([(0,0),data["ref_pt"]],color='red'),
            "Show2": point((0,0),pointsize=20,color='blue')+point(data["pt"],pointsize=20,color='blue')+circle((0,0),1,color='blue',linestyle="--")+line([(0,0),data["pt"]],color='red'),
        }
