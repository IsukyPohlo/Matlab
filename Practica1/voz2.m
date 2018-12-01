function y =voz2(archivo)
    [y,fs] = audioread(archivo);
    %[y,fs] = audioread('vozP0.wav');
    l = length(y)-1;
    
    %Periodo de muestreo
    dt = 1/fs;
    
    %Longitud de la señal
    dl = l/fs;
       
    %Vector tiempo
    t = 0:dt:dl;
    
    %Ploteo
    subplot(211);
        plot(t,y);
        title('Leopoldo(O) 10 ms')
        xlabel('Tiempo (s)');
        ylabel('Amplitud');
        axis([0 0.1 -1 1]);
   
   espectro(y,fs,'Frecuencia (Hz)','Magnitud','Espectro');
         
end
