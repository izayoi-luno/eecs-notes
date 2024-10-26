function homomorphic(h)%H is an image
    HSV_h=rgb2hsv(h);%hsv,spatial,3d
    H_h=HSV_h(:,:,1);
    S_h=HSV_h(:,:,2);
    V_h=HSV_h(:,:,3);%2d
    [M,N]=size(V_h);%matrix dimensions
    HSV_H=fft2(log(double(V_h)+eps));%dft of ln(i) 
    rh=2.3        %high    parameter  maxchange
    rl=0.3      %low     parameter  minchange
    c=8         %scale, variatiob shapeness    parameter   function slope sharpness
    d0=70;       %gfliter cutoff f cutoff freq
    F=zeros(M,N);
    Z=zeros(M,N);
    for u=1:M
        for v=1:N
            D=(u-M/2)^2+(v-N/2)^2;
            F(u,v)=(rh-rl)*(1-exp(-c*(D/d0^2)))+rl;
            Z(u,v)=F(u,v)*HSV_H(u,v);    %  Z=F*H
        end
    end
    B=zeros(M,N,3);
    z=real(exp(ifft2(Z))); % output of matrix of v 
    B(:,:,1)=H_h;
    B(:,:,2)=S_h;
    B(:,:,3)=z;
    B=hsv2rgb(B);
    figure
    subplot(1,2,1)
    imshow(h)
    subplot(1,2,2)
    imshow(B)
end
