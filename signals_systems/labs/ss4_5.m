%4.5
a1=[1,1.5,0.5];
b1=[1,-2];
[r1,p1]=residue(b1,a1);
H=freqs(b1,a1);
plot(H);