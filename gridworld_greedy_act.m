%Finds the best action for each agent given their current state

function [val_max1, val_max2, an_A1, an_A2] = gridworld_greedy_act(N_grid, so_A1, so_A2, N_act_A1, N_act_A2, params)

    %Create loop for calculating the max value and best action for vehicle
    act_val1 = zeros(1,N_act_A1);
    a = zeros(1,N_act_A1);

    for i = 1:N_act_A1
        a(i) = i;                                                           %Set action equal to each loop number
        s_new1 = gridworld_trans(N_grid, a(i), 5, so_A1, so_A2);            %Calculates the new state based on the action in the loop
        [act_val1(i), ~] = gridworld_rew(s_new1, so_A2, params);            %Calculates the reward at the new state given the current action   
    end

    %Check to see which action gives the highest reward for vehicle
    [M,I] = max(act_val1(i));

    if (s_new1(1) == 4)
        an_A1 = 3;
        M = 8;
    elseif (s_new1(2) == 4)
        an_A1 = 1;
        M = 8;
    elseif (s_new1(1) == 1)
        an_A1 = 1;
        M = 2;
    else
        an_A1 = a(I);
    end

    %% With Intent Communication
%     %Create loop for calculating the max value and best action for pedestrian
%     act_val2 = zeros(1,N_act_A2);
%     b = zeros(1,N_act_A2);
% 
%     for j = 1:N_act_A2
%         b(j) = j;                                                           %Set action equal to each loop number
%         s_new2 = gridworld_trans(N_grid, 4, b(j), so_A1, so_A2);            %Calculates the new state based on the action in the loop
%         [~, act_val2(j)] = gridworld_rew(so_A1, s_new2, params);            %Calculates the reward at the new state given the current action
%     end
% 
%     %Check to see which action gives the highest reward for vehicle
%     [N,J] = max(act_val2);
% 
%     if (s_new2(1) == 2)
%         an_A2 = 2;
%         N = 8;
%     elseif (s_new2(2) == 3)
%         an_A2 = 4;
%         N = 8;
%     elseif (s_new2(2) == 4)
%         an_A2 = 4;
%         N = 6;
%     else
%         an_A2 = b(J);
%     end

    %% Without Intent Communication
    an_A2 = randi(5);
    s_new2 = gridworld_trans(N_grid, 4, an_A2, so_A1, so_A2);
    N = gridworld_rew(so_A1, s_new2, params);

    %Returns the max values for both vehicle and pedestrian
    val_max1 = M;
    val_max2 = N;

end