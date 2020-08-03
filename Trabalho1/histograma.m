function [counts] = histograma(Fonte,Alfa)
    %criar vector com o tamanho do alfabeto
    counts = zeros(size(Alfa));
    %conta a ocorrência de cada simbolo
    for k=1 : length(Alfa)
        n = sum (sum(Fonte==Alfa(k)));
        counts(k) = n;
    end
    bar(counts),title('Histograma');
end