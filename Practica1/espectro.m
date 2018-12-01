function espectro(y, fs, xl ,yl, tit)
    subplot(212);
    
        %f = fs*( (-le/2):(le/2) )/le;
    
        le = length(y)-1;     
        
        
        f = (-fs/2):fs/le:(fs/2);
                
        val = fftshift(abs(fft(y)));
        
        plot(f,val);
        
        title (tit);
        xlabel(xl);
        ylabel(yl);
end