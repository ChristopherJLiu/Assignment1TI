function [] = ex6(alinea)
    
    if strcmp(alinea, 'a')
        
        q = [2 6 ;
            4 9]; 
        t = [6 8 9 7 ;
            2 4 9 9 ;
            4 9 1 4 ];
        alfabeto = 0:9;
        step = 1;

        a= infoMutua(q,t,alfabeto, step);
        disp(a);
    end
    
end