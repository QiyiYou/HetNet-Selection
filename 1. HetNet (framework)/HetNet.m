%N = [10,10,20];
%rate = [10,2,11];
%p = [0.0018,0.0025,0.002];

N = [1000,1000,3000];
rate = [7000000000,2000000000,1000000000];
p = [0.001,0.001,0.001];


% 1:wm   2:ce  3:wl
s_1 = randi([1,1],1,N(1)); %1��ֻ��ѡwm
s_2 = randi([1,2],1,N(2));
s_3 = randi([1,3],1,N(3));


pi = zeros(3,3);  %pi(a,i) ��a�����򣬵�i��ѡ��
pi_average = zeros(1,3); %pi_average(a) a����ƽ��



K = 20;
for k = 1:K
    [pi, pi_average] = cal_pi( N, rate, p, s_1, s_2, s_3, pi, pi_average );
   
    %1�������û��ѡ��
    
    %2����
    for i = 1:N(2)
        if pi(2,s_2(i))<pi_average(2)
            if (pi_average(2)-pi(2,s_2(i)))/pi_average(2) > rand()
                for j = 1:2
                    if pi(2,j)>pi(2,s_2(i))
                        s_2(i) = j;
                        break;
                    end
                end
            end
        end
    end
    
    %3����
    for i = 1:N(3)
        if pi(3,s_3(i))<pi_average(3)
            if (pi_average(3)-pi(3,s_3(i)))/pi_average(3) > rand()
                for j = 1:3
                    if pi(3,j)>pi(3,s_3(i))
                        s_3(i) = j;
                        break;
                    end
                end
            end
        end
    end

end



