clear
close all


I_1 = 1;
I_2 = 1000000000;

w_1 = 10;
w_2 = 2;

E_1 = 1/2*I_1*w_1^2;
E_2 = 1/2*I_2*w_2^2;

w_f = (w_1*I_1 + w_2*I_2)/(I_1+I_2);

E_c = E_1 + E_2 - 1/2*(I_1 + I_2)*w_f^2;

E_AY = 1/2*I_1*(w_1^2 - w_2^2);


dt = 0.0001;
t = 0:dt:2;
tSteps = length(t);
w_1_o = w_1;
w_2_o = w_2;

tau_c = 10;
W = NaN(tSteps,2);
W(1,:) = [w_1 w_2];

for i = 2:length(t)
	
	alpha_1 = -tau_c/I_1;
	W(i,1) = W(i-1,1) + alpha_1*dt;
	
	alpha_2 = tau_c/I_2;
	W(i,2) = W(i-1,2)+ alpha_2*dt;
	
	if abs(W(i,1)-W(i,2))<0.001
		tau_c = 0;
	end
	
	E(i,1) = abs(W(i,1) - W(i,2))*tau_c*dt;
	
	
end
	
figure
grid on
hold on
plot(t,E)
sum(E)
	