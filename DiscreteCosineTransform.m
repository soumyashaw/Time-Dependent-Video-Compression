clear all
x = imread('G:\cake80.jpg');
x1 = x(:,:,1);
x2 = x(:,:,2);
x3 = x(:,:,3);
%x = rgb2gray(x);
[a,b,c] = size(x);
bs =  16;
Q_dc = 4;
Q_ac = 160;
H = ones(bs)*Q_ac;
H(1,1) = Q_dc;
y1 = zeros(a,b);
y2 = y1;
y3 = y1;
for i = 1:bs:a-bs+1
    for j = 1:bs:b-bs+1
        xb = x1(i:i+bs-1, j:j+bs-1);
        xb_dct = dct2(xb);
        xb_q = round(xb_dct./H);
        xb_iq = H.*xb_q;
        xb_idct = idct2(xb_iq);
        y1(i:i+bs-1,j:j+bs-1) = xb_idct;
        
        xb = x2(i:i+bs-1, j:j+bs-1);
        xb_dct = dct2(xb);
        xb_q = round(xb_dct./H);
        xb_iq = H.*xb_q;
        xb_idct = idct2(xb_iq);
        y2(i:i+bs-1,j:j+bs-1) = xb_idct;
        
        xb = x3(i:i+bs-1, j:j+bs-1);
        xb_dct = dct2(xb);
        xb_q = round(xb_dct./H);
        xb_iq = H.*xb_q;
        xb_idct = idct2(xb_iq);
        y3(i:i+bs-1,j:j+bs-1) = xb_idct;
    end
end
y(:,:,1) = y1;
y(:,:,2) = y2;
y(:,:,3) = y3;
y = uint8(y);
%mse = mean(mean(x-y).^2)
imwrite(y,'G:\cake160.jpg');
