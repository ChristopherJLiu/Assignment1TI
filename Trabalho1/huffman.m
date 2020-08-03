function [huffman] = huffman(Fonte,Alfa)
    %calculo de ocorrencia de simbolos
    counts = histograma(Fonte,Alfa);
    %calculo do numero de bits necessarios para a codificar cada bit
    HLen = hufflen(counts);
    %calcula a probabilidade
    prob = counts/sum(counts);
    %calculo
    huffman = sum(HLen.*prob);
end