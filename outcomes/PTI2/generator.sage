class Generator(BaseGenerator):
    def data(self):

        theta_deg = choice([45,135,225,315])*choice([1,-1]);
        phi_deg = choice([30,60,120,150,210,])*choice([1,-1]);
        


        return {
            "AB": theta_deg+phi_deg,
            "sAB": sin((theta_deg+phi_deg)*pi/180),
            "cAB": cos((theta_deg+phi_deg)*pi/180),
        }
