% Initialization of coordinates matrix
x=zeros(1,101);
y=zeros(1,101);
z=zeros(1,101);

x1=zeros(1,101);
y1=zeros(1,101);
z1=zeros(1,101);
    
hold on;

%Calculation of 100 circle points
for i=1:100
    x(i)=sin(2*pi*i/100);
    y(i)=cos(2*pi*i/100);
end
x(101)=x(1);
y(101)=y(1);

plot3(x,y,z);

%Creating circle points matrix
points=[x;y;z];

%Rotating circle by 2ð in total (ð/18 at a time)
for r=1:36 
   
    %Transformation matrix, y axis
    Rthetay=[cos(r*pi/18) 0 -sin(r*pi/18); 0 1 0 ; -sin(r*pi/18) 0 cos(r*pi/18)];
    %Transformation matrix, x axis
    Rthetax=[1 0 0; 0 cos(r*pi/18) -sin(r*pi/18); 0 sin(r*pi/18) cos(r*pi/18)];
    pointsy=Rthetay*points;
    pointsx=Rthetax*points;
    
    %Vector of coordinates x,y,z after transformation for y axis
    for i=1:101
        x(i)=pointsy(1,i);
        y(i)=pointsy(2,i);
        z(i)=pointsy(3,i);
        
    %Vector of coordinates x,y,z after transformation for x axis
        x1(i)=pointsx(1,i);
        y1(i)=pointsx(2,i);
        z1(i)=pointsx(3,i);
    end
    
    plot3(x,y,z);
    plot3(x1,y1,z1);
    
end

axis equal;
