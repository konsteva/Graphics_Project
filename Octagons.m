%Coordinates matrix initiallization
x=zeros(1,9);
y=zeros(1,9);
z=ones(1,9);

%Transformation matrix
r=1;
Rtheta=[cos(2*r*pi/10) -sin(2*r*pi/10) 0; sin(2*r*pi/10) cos(2*r*pi/10) 0; 0 0 1];
Tv=[1 0 5; 0 1 5; 0 0 1];
Tv_1=[1 0 -5; 0 1 -5; 0 0 1];

hold on;

%Calculation of initial octagon points
for i=1:8 
    x(i)=cos(2*i*pi/8)+7;
    y(i)=sin(2*i*pi/8)+7;
end
x(9)=x(1);
y(9)=y(1);

%Creation of point matrix
points=[x;y;z];

for r=1:10 
    
    %Transformation for rotation around the center (5,5)
    M=Tv*Rtheta*Tv_1;
    points=M*points;
    %??????????? ???? ????????????? x,y
    for i=1:9
        x(i)=points(1,i);
        y(i)=points(2,i);
    end
    
    plot(x,y);
    plot(-x,y);
    plot(-x,-y);
    plot(x,-y);
    
end

axis equal;