%Reward function for both the vehicle and pedestrian

function [rew1, rew2] = gridworld_rew(s_new1, s_new2, params)

    %Get inputs from main function
    sg_A1 = params.sg_A1;
    sg_A2 = params.sg_A2;
    rew_goal = params.rew_goal;
    rew_trans = params.rew_trans;
    rew_crash = params.rew_crash;

    rew1 = 0;
    rew2 = 0;

    %% Checking for goal states
    %Check for goal
    if((s_new1(1) == sg_A1(1)) && (s_new1(2) == sg_A1(2)))
        rew1 = rew1 + rew_goal;
    else 
        rew1 = rew1 + rew_trans;
    end

    %% Checking for other transistions
    %Check for other transitions
    if (abs(s_new1(1) - sg_A1(1)) == 1)
        rew1 = rew1 + (4 * rew_trans);
    elseif (abs(s_new1(1) - sg_A1(1)) == 2)
        rew1 = rew1 + (3 * rew_trans);
    elseif (abs(s_new1(1) - sg_A1(1)) == 3)
        rew1 = rew1 + (2 * rew_trans);
    end

    %Check for other transitions
    if (abs(s_new1(2) - sg_A1(2)) == 1)
        rew1 = rew1 + (4 * rew_trans);
    elseif (abs(s_new1(2) - sg_A1(2)) == 2)
        rew1 = rew1 + (3 * rew_trans);
    elseif (abs(s_new1(2) - sg_A1(2)) == 3)
        rew1 = rew1 + (2 * rew_trans);
    end

    %% Without Intent Comm. 
    %Check for crash
    if ((s_new1(1) == s_new2(1)) && (s_new1(2) == s_new2(2)))
        rew1 = rew1 + rew_crash;
        rew2 = rew2 + (0.2*rew_crash);
    else 
        rew1 = rew1 + rew_trans;
        rew2 = rew2 + rew_trans;
    end

 
    %% With Intent Comm.
%     %Check for goal
%     if((s_new2(1) == sg_A2(1)) && (s_new2(2) == sg_A2(2)))
%         rew2 = rew2 + rew_goal;
%     else
%         rew2 = rew2 + rew_trans;
%     end
% 
%     %Check for crash
%     if ((s_new1(1) == s_new2(1)) && (s_new1(2) == s_new2(2)))
%         rew1 = rew1 + rew_crash;
%     else 
%         rew1 = rew1 + rew_trans;
%         rew2 = rew2 + rew_trans;
%     end
    
    %% Check for other transitions
    if (abs(s_new2(1) - sg_A2(1)) == 1)
        rew2 = rew2 + (4 * rew_trans);
    elseif (abs(s_new2(1) - sg_A2(1)) == 2)
        rew2 = rew2 + (3 * rew_trans);
    elseif (abs(s_new2(1) - sg_A2(1)) == 3)
        rew2 = rew2 + (2 * rew_trans);
    else
        rew2 = rew2 + rew_trans;
    end

    %Check for other transitions
    if (abs(s_new2(2) - sg_A2(2)) == 1)
        rew2 = rew2 + (4 * rew_trans);
    elseif (abs(s_new2(2) - sg_A2(2)) == 2)
        rew2 = rew2 + (3 * rew_trans);
    elseif (abs(s_new2(2) - sg_A2(2)) == 3)
        rew2 = rew2 + (2 * rew_trans);
    else
        rew2 = rew2 + rew_trans;
    end 
end