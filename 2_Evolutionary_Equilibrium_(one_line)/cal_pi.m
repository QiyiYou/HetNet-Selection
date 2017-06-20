function [ pi, pi_average, x, y ] = cal_pi( N, rate, p, s_1, s_2, s_3, pi, pi_average, x, y )
    num = zeros(3,3); %num(a,i) ��a�����򣬵�i��ѡ�������
    num(1,1) =  N(1);
    for i = 1:N(2) %2��
        num(2,s_2(i)) = num(2,s_2(i))+1;
    end
    for i = 1:N(3) %3��
        num(3,s_3(i)) = num(3,s_3(i))+1;
    end
    
    num_1 = num(1,1)+num(2,1)+num(3,1);
    pi(1,1) = utility( rate(1)/ num_1 ) - p(1)*num_1;
    pi(2,1) = pi(1,1);
    pi(3,1) = pi(1,1);
    
    num_2 = num(2,2) + num(3,2);
    pi(2,2) = utility( rate(2)/ num_2 ) - p(2)*num_2;
    pi(3,2) = pi(2,2);
    
    num_3 = num(3,3);
    pi(3,3) = utility( rate(3)/ num_3 ) - p(3)*num_3;
    
    
    pi_average(1) = pi(1,1);
    pi_average(2) = (pi(2,1)*num(2,1)+pi(2,2)*num(2,2))/N(2);
    pi_average(3) = (pi(3,1)*num(3,1)+pi(3,2)*num(3,2)+pi(3,3)*num(3,3))/N(3);
    
    %disp([num(2,1)/N(2),num(3,1)/N(3)]);
    x = [x;num(2,1)/N(2)];
    y = [y;num(3,1)/N(3)];
    
end

