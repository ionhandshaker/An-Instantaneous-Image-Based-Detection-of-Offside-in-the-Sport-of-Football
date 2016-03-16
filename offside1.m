 function output=offside1(imagefile,position)

 i=imagefile;

r=red(i);
d=black(i);
cen=ball(i);
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
count=0;
 pos=position;
% pos=4;
attack=distd(pos);
for k=1:rconn.NumObjects
    defending_player=dist(k);
    if (defending_player(1)>attack(1))
        count=count+1;
    end
end
if(count>1)
sdp=red_stats(rconn.NumObjects-1).Centroid;
for k=1:dconn.NumObjects
    goal_score=dark_stats(k).Centroid;
    if(goal_score(1)>sdp(1))
       output=k;
    end
    
end
end
if(count==1)

for k=1:dconn.NumObjects
    goal_score=dark_stats.Centroid;
    if(goal_score(1)>attack(1))
        output=k;
    end
end
end
    
    

