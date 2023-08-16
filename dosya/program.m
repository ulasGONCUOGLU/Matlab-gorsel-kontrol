close all; clear all;

A=imread('C:\Users\ulasg\Desktop\G�r�nt� i�leme 2\�dev\9.png');
B=rgb2gray(A);
C=B>50;
figure,imshow(B);
figure,imshow(C);







close all; clear all;

A=imread('C:\Users\ulasg\Desktop\G�r�nt� i�leme 2\�dev\9.png');
A=rgb2gray(A);
B=A>10;
C=[1 1 1 1 1 1 1 1 1; 0 0 0 0 0 0 0 0 0; -1 -1 -1 -1 -1 -1 -1 -1 -1];
D = filter2(B, C, 'full');

figure,imshow(A);
figure,imshow(B);
figure,imshow(D);






close all; clear all;
F=zeros(5);
F(3,3)=1;
W=[1 2 3;4 5 6;7 8 9];
C=conv2(F,W,'Same');
D=conv2(F,W,'Full');






close all; clear all;

A = imread('C:\Users\ulasg\Desktop\G�r�nt� i�leme 2\�dev\13.png');
B=rgb2gray(A); %i�lem yapabilmek i�in grey seviyeye d�n��t�rd�m

z = double(B); 
h = 1/10*ones(10,10); %metal borular i�erisindeki so�uk b�l�mleri yok etmek i�in gri seviyeye �evirdim
y=imfilter(z,h); %gri seviye ayarlanacak alan�n boyutu i�in

C=y>150; %resmi tam siyah ve beyaz olacak forma �evirdim


figure,imshow(C); %sayma i�lemi yap�lacak resmin son hali

% buradan sonras�n� sitesinden ald�m 
%https://www.elektrikport.com/makale-detay/matlab-ile-goruntu-isleme-1-elektrikport-akademi/8196#ad-image-0


I=uint8(C); %formasyonunu d�zenledim (resmin t�r�n�)

BW = im2bw(I, graythresh(I)); %resimde kenarlar� bularak ye�il ile i�aretliyor
B = bwboundaries(BW);
figure; imshow(BW); %i�aretlenmi� resmi g�steriyor
text(10,10,strcat('\color{red}bulunan s�n�rlar:',num2str(length(B))))
hold on;
for k = 1:length(B) %ye�il alan�n u�lar� birle�tirilmi� alan kadar d�ng� saymak i�in san�r�m k i�erisinde ka� adet kenar oldu�u yaz�yor
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 1)
end








clear all;
close all;
A=imread('C:\Users\ulasg\Desktop\G�r�nt� i�leme 2\�dev\13.png');
[m,n]=size(A);
B=zeros(m,n);
for i=1:m
    for j=1:n
        if(A(i,j)>120)
            B(i,j)=0;
        else
            B(i,j)=1;
        end;
    end;
end;

figure,imshow(B);










close all; clear all;
B=imread('C:\Users\ulasg\Desktop\G�r�nt� i�leme 2\�dev\13.png');

C=rgb2gray(B);

figure,imshow(C);

[x y]=meshgrid(1:243,1:207);

F=100*sin(2*pi/5*x+2*pi/5*y);

G=double(C)+F;

figure,imshow(G,[]);

H=fftshift(fft2(G));

figure,imshow(mat2gray(log(1+abs(H))));