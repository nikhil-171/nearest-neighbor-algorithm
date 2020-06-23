function winner = proj4(dataSet, testData)
n = length(dataSet.data1);
a = (testData(1)-mean(dataSet.data1))/std(dataSet.data1);
b = (testData(2)-mean(dataSet.data2))/std(dataSet.data2);
c = normalize(dataSet.data1);
e = normalize(dataSet.data2);
label= convertCharsToStrings(dataSet.label);
for i=1: n
   if label(i)== dataSet.name1
       x1(i)= c(i);
       y1(i)= e(i);
   else
       x2(i)= c(i);
       y2(i)= e(i);
   end
end
figure(1)
plot(x1,y1,'Marker','o','LineStyle','none');
hold on 
plot(x2,y2,'Marker','x','LineStyle','none');
plot(a,b,'Marker','*','LineStyle','none');
legend(dataSet.name1,dataSet.name2,'TestData')

%part2
for i=1:n
distance(i)= sqrt((testData(1)-c(i))^2+(testData(2)-e(i))^2);
end
[sortedDistance,origInd]=sort(distance,'ascend');
h=0;
k=0;
indOfClosestPts=origInd(1:3);
labelOfClosestPts=dataSet.label(indOfClosestPts);

for g=1:3
if strcmp(labelOfClosestPts(g),dataSet.name1)
    h=h+1;
elseif strcmp(labelOfClosestPts(g),dataSet.name2)
    k=k+1;
end
end
if h>=2
    winner= dataSet.name1;
else 
    winner= dataSet.name2;
end
end

