clear all;close all;clc;

m = 20;
n = 10;
r = 0.01;
map=[1 1 1;0 0 5/5;0 0 4/5;0 0 3/5;0 0 2/5;0 0 1/5;0 0 0;1/5 0 0;2/5 0 0;3/5 0 0;4/5 0 0;5/5 0 0];

ambientbar                                  = ones(m,n)*25;

hx = [1,7,11,15];
hy = [1,1,1,5];

cx = [20,8,1,4];
cy = [10,10,9,10];

for i = 1:4
ambientbar(hx(i),hy(i)) = 50;
ambientbar(cx(i),cy(i)) = 0;
end

picture1                  = ones(22,12)*(25); % Dikali 0 untuk lingkungan dingin, 50 untuk lingkungan panas
picture1(2:21,2:11)       = ambientbar;
picture2                  = picture1;
picture2(find(picture1==0))  = 2;
picture2(find(picture1==25)) = 7;
picture2(find(picture1==50)) = 12;
picture2(1,1:end)   = 1;
picture2(end,1:end) = 1;
picture2(1:end,1)   = 1;
picture2(1:end,end) = 1;

image(picture2)
colormap(map)
axis equal
axis off
M(1) = getframe;

for x = 2:1000
picture3 = picture1;
for i = 2 : 21
for j = 2 : 11
    picture1(i,j) = (1-8*r)*picture1(i,j) + r*(picture3(i-1,j)+picture3(i-1,j+1)+picture3(i,j+1)+picture3(i+1,j+1)+picture3(i+1,j)+picture3(i+1,j-1)+picture3(i,j-1)+picture3(i-1,j-1));
end
end

for i = 1:4
picture1(hx(i)+1,hy(i)+1) = 50;
picture1(cx(i)+1,cy(i)+1) = 0;
end

picture2                  = picture1;
picture2(find((picture1>=0)&(picture1<4.6)))     = 2;
picture2(find((picture1>=4.6)&(picture1<9.2)))   = 3;
picture2(find((picture1>=9.2)&(picture1<13.8)))  = 4;
picture2(find((picture1>=13.8)&(picture1<18.4))) = 5;
picture2(find((picture1>=18.4)&(picture1<23)))   = 6;
picture2(find((picture1>=23)&(picture1<=27)))    = 7;
picture2(find((picture1>27)&(picture1<=31.6)))   = 8;
picture2(find((picture1>31.6)&(picture1<=36.2))) = 9;
picture2(find((picture1>36.2)&(picture1<=40.8))) = 10;
picture2(find((picture1>40.8)&(picture1<=45.4))) = 11;
picture2(find((picture1>45.4)&(picture1<=50)))   = 12;
picture2(1,1:end)   = 1;
picture2(end,1:end) = 1;
picture2(1:end,1)   = 1;
picture2(1:end,end) = 1;

image(picture2)
colormap(map)
axis equal
axis off
M(i) = getframe;
end