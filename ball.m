function ti=ball(imagefile)
i=imagefile;
i1=rgb2gray(i);
b=im2bw(i1,0.65);
dil=imdilate(b,strel('disk',1));
B = bwboundaries(dil,'noholes');
stats=regionprops(dil,'Area','Centroid');


for k = 1:length(B)
  boundary = B{k};
  delta_sq = diff(boundary).^2;
  perimeter = sum(sqrt(sum(delta_sq,2)));
  area = stats(k).Area;
  metric = 4*pi*area/perimeter^2;
if metric > 1
 if (area >15  && area <25 )
ti=stats(k).Centroid;

end
end
end


