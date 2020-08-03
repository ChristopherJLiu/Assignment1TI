function [infoM] = infoMutua(query, target, alfabeto, passo)
    %numero de janelas
     tamanhoquery=size(query);
     tamanhotarget=size(target);
     tqtotal=(tamanhoquery(1)*tamanhoquery(2));
     tttotal=(tamanhotarget(1)*tamanhotarget(2));
    numJan = round(((size(target)-size(query))/passo)+1);
    %inicializacao do vector de acordo com o numero de janelas existentes
    infoM = zeros(numJan);
    a=1;
    for k=1:numJan(2)
        for j=1:numJan(1)
            %se fim da janela superior ao tamanho do target, calcular a janela até esse ponto
            if tqtotal > tttotal 
                target2 = target(tqtotal - tttotal : tttotal);
            else 
                target2 = target(a:a+tqtotal-1);
            end
            %cria a vector de ocorencias para essa janela
            seq = zeros(length(alfabeto));
            target2
            for i=1:tqtotal
                x = find(query(i) == alfabeto);
                y = find(target2(i) == alfabeto);
                seq(x,y) = seq(x,y) + 1;
            end
            %elimina todos os resultados com 0 pois log2(0) e impossivel
            seq = seq(seq~=0);
            %mete em probabilidade
            p = seq/numel(query);
            %calculo da entropia conjunta
            e = sum(p.*log2(p.^(-1)));
            %informaçao conjunta 
            infoM(j,k) = entropia(query, alfabeto) + entropia(target2, alfabeto) - e;
            %step
            a = a + passo;

        end
    end
end
