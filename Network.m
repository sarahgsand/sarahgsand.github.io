%Network.m
%Author: Sarah Sanderson     Date: 12 Nov 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%A network of colored circles. 
%The network is a unidirectional star network with two base nodes (the 
%innermost and outermost circles).
%The circles between them determine their color based on the values of the
%base nodes.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INPUT: User-inputted RGB values for the innermost and outermost circles.
%OUTPUT: Plot of the gradient from the outermost circle to the innermost
%circle. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
%Create concentric circle parameters
r = 1:-0.005:0.2;
angle = 0:0.01:2*pi;
x = zeros(length(r),length(angle));
y = x;
for i = 1:length(r)
    x(i,:) = r(i)*cos(angle);
    y(i,:) = r(i)*sin(angle);
end

%Color Interaction.
colors = zeros(length(r),3);
again = 1;
while again
    rbg1 = input('Input color 1 as RGB.\n');
    colors(1,:) = [rbg1(1)/255,rbg1(2)/255,rbg1(3)/255];
    rbg2 = input('Input color 2 as RGB.\n');
    colors(length(r),:) = [rbg2(1)/255,rbg2(2)/255,rbg2(3)/255];
    fill(x(1,:),y(1,:),colors(1,:),'LineStyle','none')
    hold on
    axis equal
    drawnow
    for j = 1:(length(r)-2)
        colors(1+j,:) = (length(r)-j)/length(r)*colors(1,:)+j/length(r)*colors(length(r),:);
        fill(x(j+1,:),y(j+1,:),colors(j+1,:),'LineStyle','none')
        drawnow
        pause(0.25)
    end
    fill(x(length(r),:),y(length(r),:),colors(length(r),:),'LineStyle','none')
    again = input('Again? [1 = yes, 0 = no]\n');
end
clear