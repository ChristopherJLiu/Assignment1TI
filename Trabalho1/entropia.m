function [entropia] = entropia(Fonte, Alfa)
    %guarda o histograma de ocorrencias em counts
    counts = histograma(Fonte,Alfa);
    %elemina as não ocorrencias
    counts = counts(counts~=0);
    %calcula a probabilidade de cada simbolo
    p = counts/sum(counts);
    %calculo da entropia
    entropia = sum(p.*log2(p.^(-1)));
end