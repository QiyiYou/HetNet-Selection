%N = [10,10,20];
%rate = [10,2,11];
%p = [0.0018,0.0025,0.002];

N = [1000,1000,3000];
rate = [10000000000,2000000000,7000000000];
p = [0.01,0.01,0.01];

%wn_2: 2��wn��ռ��
%wn_3: 3��wn��ռ�� �������3�����˶���ѡ��ce ���ֻ��wn��wl����ѡ��
[wn_2_set,wn_3_set]=meshgrid(0.1:0.2:0.9, 0.1:0.2:0.9);


for m=1:25 %ѡȡ��25����ֱ�ͼ
   
    wn_2 = wn_2_set(m);
    wn_3 = wn_3_set(m);


    % 1:wm   2:ce  3:wl
    s_1 = randi([1,1],1,N(1)); %1��ֻ��ѡwm

    s_2 = zeros(1,N(2));
    wn_2_num = int32(wn_2*N(2));
    for i=1:wn_2_num
        s_2(i) = 1;
    end
    for i=wn_2_num+1:N(2)
        s_2(i) = 2;
    end

    s_3 = zeros(1,N(3));
    wn_3_num = int32(wn_3*N(3));
    for i=1:wn_3_num
        s_3(i) = 1;
    end
    for i=wn_3_num+1:N(3)
        s_3(i) = 3;
    end


    pi = zeros(3,3);  %pi(a,i) ��a�����򣬵�i��ѡ��
    pi_average = zeros(1,3); %pi_average(a) a����ƽ��


    x=[];
    y=[];


    K = 20;
    for k = 1:K
        [pi, pi_average, x, y] = cal_pi( N, rate, p, s_1, s_2, s_3, pi, pi_average, x, y );

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
                    if pi(3,1)>pi(3,s_3(i))
                        s_3(i) = 1;
                    elseif pi(3,3)>pi(3,s_3(i))
                        s_3(i) = 3;
                    end

                end
            end
        end

    end

    %plot(x,y,'.')
    %plot(x,y)
    values = spcrv([x';y'],3);
    plot(values(1,:),values(2,:));

    xlabel('x^{(2)}_{wm}')
    ylabel('x^{(3)}_{wm}')
    axis([0.1 0.8 0.1 0.8])
    hold on

end

point=plot(x(end),y(end),'o','MarkerSize',8);
legend(point);




