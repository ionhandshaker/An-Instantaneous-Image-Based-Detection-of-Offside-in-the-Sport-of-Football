function output=red(imagefile)
i=imagefile;
imR=i(:,:,1);
imG=i(:,:,2);
imB=i(:,:,3);
im1=imsubtract(imR,imB);
im2=imsubtract(imR,imG);
im=imadd(im1,im2);
output=im2bw(im,graythresh(im));
output=bwareaopen(output,53);

