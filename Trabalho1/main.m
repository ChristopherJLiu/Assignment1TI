figure(1)
le('data\landscape.bmp')
figure(2)
le('data\MRI.bmp')
figure(3)
le('data\MRIbin.bmp')
figure(4)
le('data\soundMono.wav')
figure(5)
le('data\lyrics.txt')

function [] = le(ficheiro)

    ext = ficheiro(end-2:end); 
    
    if strcmp(ext, 'txt')
        %lê o ficheiro
        file = fopen(ficheiro);
        fich = fscanf(file, '%s') ;
        fclose(file);
        %converte para double
        fich = double(fich);
        %caracter de ascii que sao ignorados
        fich(find(fich<48 | (fich>57 & fich<65) | (fich>90 & fich <97) | fich>122)) = [];
        %Devolve os valores unicos eistentes no vector = alfabeto
        alfabeto = unique(fich);
        fprintf('-------------Ficheiro:%s-------------\n',ficheiro);
        fprintf('Entropia:%f\n',entropia(fich, alfabeto));
        fprintf('Huffman = %d\n',huffman(fich,alfabeto));
        fprintf('Entropia com combinações = %f\n\n',entConjunta(fich,alfabeto));
    end
    
    if strcmp(ext, 'bmp')
        %imshow(ficheiro);
        %info=imfinfo(ficheiro);
        %disp(info);
        %lê o ficheiro criando uma matriz
        fich = imread(ficheiro);
        %converte a matriz num vector
        fich = reshape(fich,1,[]);
        %cria um vector com o alfabeto(Com unique da problemas no5!!!!!!!)
        alfabeto = 0:1:255;
        fprintf('-------------Ficheiro:%s-------------\n',ficheiro);
        fprintf('Entropia:%f\n', entropia(fich, alfabeto));
        fprintf('Huffman = %d\n',huffman(fich,alfabeto));
        fprintf('Entropia com combinações = %f\n\n',entConjunta(fich,alfabeto));
    end
    
    if strcmp(ext, 'wav')
        %lê o ficheiro criando Y o vector da fonte
        [y, fs] = audioread(ficheiro);
        %cria um vector com o alfabeto(Com unique da problemas no 5!!!!!!!)
        alfabeto = linspace(-1,1,256+1);
        fprintf('-------------Ficheiro:%s-------------\n',ficheiro);
        fprintf('Entropia:%f\n', entropia(y, alfabeto));
        fprintf('Huffman = %d\n',huffman(y,alfabeto));
        fprintf('Entropia com combinações = %f\n\n',entConjunta(y,alfabeto));
        
    end
    

end