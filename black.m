function output=black(imagefile)
i=imagefile;
i1=rgb2gray(i);
b=im2bw(i1,0.25);
com=imcomplement(b);
dil=imdilate(com,strel('line',14,100));
e=imdilate(dil,strel('disk',2));
t=bwareaopen(e,400);
t=imfill(t,'holes');
output=imerode(t,strel('line',22,90));
