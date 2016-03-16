for j=1516:1525
i=read(v,j);
g=imcrop(i,[50 30 224 400]);
r=red(g);
d=black(g);
cen=ball(g);
red_stats=regionprops(r,'Centroid');
dark_stats=regionprops(d,'Centroid');
rconn=bwconncomp(r);
dconn=bwconncomp(d);
for k=1:rconn.NumObjects
h=red_stats(k).Centroid;
dif1=cen(1)-h(1);
dif2=cen(2)-h(2);
tot=hypot(dif1,dif2);
dist(k)=tot;
end
for k=1:dconn.NumObjects
h=dark_stats(k).Centroid;
dif1=cen(1)-h(1);
dif2=cen(2)-h(2);
tot=hypot(dif1,dif2);
distd(k)=tot;
end

for k=1:dconn.NumObjects
if(distd(k)>11 && distd(k)<17)
pos=k;
possesion_dist=distd(k);
end
end

  if(distd(pos)>13&&distd(pos)<17)
    im=g;
    frame=j;
    offside_striker=offside1(im,pos);
  end
end



for z=frame+1:1529
    u=read(v,j);
    c=imcrop(u,[50 30 224 400]);
    b=black(c);
    loc=ball(c);
    mex_stats=regionprops(b,'Centroid');
    bconn=bwconncomp(b);
    for k=1:bconn.NumObjects
h=mex_stats(k).Centroid;
dif1=cen(1)-h(1);
dif2=cen(2)-h(2);
tot=hypot(dif1,dif2);
mexd(k)=tot;
    end
if(mexd(offside_striker-1)<30)
    foul=u;
    imshow(u)
    title(['OFFSIDE']);
end
end




    
