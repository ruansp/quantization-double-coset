%Fundamental Domain with T

%Date 9/25/17

clear 
close all
clc



u1 = [1;0];
u2 = [0;1];

u2 = [0.6;1.2];
u2 = u2/norm(u2);

d = 4;

p1 = u1*0;
p2 = u1*d;
p3 = u2*d;
p4 = u1*d + u2*d;
p5 = -u1*d;
p6 = -u2*d;
p7 = -u1*d + u2*d;
p8 = -u1*d - u2*d;
p9 = u1*d - u2*d;

p10 = u1*d + u2*d*2;
p11 = u1*d - u2*d*2;
p12 = u2*d*2;
p13 = -u2*d*2;
p14 = -u1*d + u2*d*2;
p15 = -u1*d - u2*d*2;
p16 = u1*d*2;
p17 = u1*d*2 + u2*d;
p18 = u1*d*2 - u2*d;
p19 = -u1*d*2 + u2*d;
p20 = -u1*d*2 - u2*d;
p21 = -u1*d*2;
p22 = u1*d*2 + u2*d*2;
p23 = u1*d*2 - u2*d*2;
p24 = -u1*d*2 + u2*d*2;
p25 = -u1*d*2 - u2*d*2;


m = 9; %number of elements in P1
nothers = 16;


for ii = 1 : m+nothers;
    storestring = ['P1q(:,ii) = p',num2str(ii),';'];
    eval(storestring);
end


%Augment p1 group with theta = 0 third coordinate
P1q = [P1q ;zeros(1,m+nothers)];

clearvars -except P1 P1q org m d nothers

figure(1)
%plot3(P1q(1,1:m),P1q(2,1:m),P1q(3,1:m),'b*');shg
hold on
plot3(P1q(1,m+1:end),P1q(2,m+1:end),P1q(3,m+1:end),'r*');shg
grid on
set(gca,'xlim',[-d d]*4,'ylim',[-d d]*4)
xlabel('X')
ylabel('Y')
title('Parallelogramatic Lattice for p_1')
zlabel('\theta')
set(gca,'view',[-163 52])

%build P1 group from P1 q-coordinates
P1 = zeros(3,3,m+nothers);
for ii = 1 : (m+nothers)
    P1(:,:,ii) = se2_g(P1q(:,ii));
end

nx = 75;
ny = 75;
nt = 40;

x = linspace(-3*d,3*d,nx);
y = linspace(-3*d,3*d,ny);
theta = linspace(-3.1,3.1,nt);
[X,Y,THETA] = ndgrid(x,y,theta);
xv = X(:);
yv = Y(:);
thetav = THETA(:);
xlims = [min(x) max(x)];
ylims = [min(y) max(y)];
zlims = [min(theta) max(theta)];

q = [xv';yv';thetav'];
G = se2_g(q);

nG = size(G,3);
nP1 = size(P1,3);
% method = 1;

d = zeros(nG,nP1);
hw = waitbar(0,'wait');
for ii = 1 : nP1
g1invg2 = matrixmultiplication3Dfun(se2_inv(P1(:,:,ii)),G);
x= se2_log(g1invg2);
d(:,ii) = sqrt(x(1,:).^2+x(2,:).^2+x(3,:).^2);
waitbar(ii/nP1)
end
close(hw)

[~,imin] = min(d,[],2);
ifundamental = find(imin==1);

figure(2)
plot3(xv(ifundamental),yv(ifundamental),thetav(ifundamental),'b*')
set(gca,'xlim',xlims,'ylim',ylims,'zlim',zlims)
grid on
xlabel('X')
ylabel('Y')
zlabel('\theta')
title('Fundamental Domain for p_1')

%% Now, Using the Fundamental Domain, Tile the rest of the space

%First, grab all Rotation from corresponding fundamental domain
gF = G(:,:,ifundamental);
qF = q(:,ifundamental);
npts_fundamental = length(ifundamental); %# of points in fundamental domain

%allocate space for new version of so(3)
qTiles = zeros(3,npts_fundamental*nP1);

figure(3)
subplot(1,2,1)
plot3(q(1,:),q(2,:),q(3,:),'b*')
grid on
set(gca,'xlim',xlims,'ylim',ylims,'zlim',zlims)

subplot(1,2,2)
%store fundamental domain
ii = 1;
qTiles(:,1+npts_fundamental*(ii-1):npts_fundamental*ii) = qF;
disp('.........')
disp(['Adding Copy #',num2str(ii),' of F to SE(2)'])
plot3(qF(1,:),qF(2,:),qF(3,:),'b*')
hold on
for ii = 2 : nP1
Ftranslated = se2_c(matrixmultiplication3Dfun(P1(:,:,ii),gF)); 
qtiles(:,1+npts_fundamental*(ii-1):npts_fundamental*ii) = Ftranslated;
disp('.........')
disp(['Adding Copy #',num2str(ii),' of F to SE(2)'])
plot3(Ftranslated(1,:),Ftranslated(2,:),Ftranslated(3,:),'b*')
set(gca,'xlim',xlims,'ylim',ylims,'zlim',zlims)
grid on
pause(0.25)

end








