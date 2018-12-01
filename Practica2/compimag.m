function y = compimag(nomarch,umbral)

    tituloaa = "Practica 2 , Umbral: " + umbral;

    figure('Name',tituloaa);

    A = rgb2gray( imread(nomarch) );
    subplot (221);
    imshow ( A );

    %Entropia Original
    ea = calcEntropia (A);
    title (strcat ('Original  H: ', num2str(ea) ) );

    %DCT en la imagen
    fun = @(block_struct) dct2(block_struct.data);
    B = blockproc ( A, [8 8], fun);

    subplot (222);
    imshow ( B );

    %Ceros antes
    %idx=B==0;
    Ceros0=sum(sum(B==0));

    %Calcular Entropia DCT
    eb = calcEntropia (B);
    title (strcat ('DCT  H: ',num2str(eb)));

    %Umbral
    B(B < umbral )= 0;

    %Ceros despues
    Ceros1=sum(sum(B==0));

    subplot (223);
    imshow ( B );
    %Entropia DCT Comprimida
    ebb = calcEntropia ( B );
    title (strcat ('DCT - Umbral  H: ',num2str(ebb) ));

    %DCT Inversa
    fun2 = @(block_struct) idct2(block_struct.data);
    C = blockproc ( B , [8 8], fun2);
    D=uint8(C);

    %Recreacion
    subplot (224);
    imshow ( D );
    ed = calcEntropia ( D );
    title (strcat ('Recreada  H: ',num2str(ed) ));

    %Porcentaje de compresion
    total = numel( A );
    retenidos = (total - (Ceros1 - Ceros0));
    comp = (1 - (retenidos / total)) * 100;

    %xlabel("Compresion: " + comp + "% ");

    %error cuadratico medio

    Z=D-A;
    PotImagenZ= sum(sum(Z.^2));
    ECM = PotImagenZ / total;
    PotImagen = sum(sum(A.^2));
    err = ECM / PotImagen * 100; 
    %xlabel( " Compresion: " + comp + "% ");
    xlabel("Compresion: " + comp + "% ");
    tsto = ['err =', num2str(err),'            ECM = ', num2str(ECM) ];
    
    text(-2000,1100,tsto);
    
end



