
function [ binim, mask, cimg1, cimg2, oimg1, oimg2 ] = f_enhance( img )
    enhimg =  fft_enhance_cubs(img,6);             
    enhimg =  fft_enhance_cubs(enhimg,12);         
    [enhimg,cimg2] =  fft_enhance_cubs(enhimg,24); 
    blksze = 5;   thresh = 0.085;                  
    normim = ridgesegment(enhimg, blksze, thresh);
    oimg1 = ridgeorient(normim, 1, 3, 3);          
    
    [enhimg,cimg1] =  fft_enhance_cubs(img, -1);
    [normim, mask] = ridgesegment(enhimg, blksze, thresh);
    oimg2 = ridgeorient(normim, 1, 3, 3); 
    [freq, medfreq] = ridgefreq(normim, mask, oimg2, 32, 5, 5, 15);
    binim = ridgefilter(normim, oimg2, medfreq.*mask, 0.5, 0.5, 1) > 0;
end