%Gridworld transition function for both agents

function [s_new1, s_new2] = gridworld_trans(N_grid, ai_A1, ai_A2, so_A1, so_A2)

    %Inputs from main function
    dir1 = ai_A1;
    dir2 = ai_A2;

    %Calculate the next state for each agent
    s_new1 = zeros(2,1);
    s_new2 = zeros(2,1);

    %Determines new states based on old states and current action for vehicle
    switch dir1
        case 1      %Forward
            s_new1(1) = so_A1(1);
            s_new1(2) = so_A1(2) + 1;

        case 2      %Left
            s_new1(1) = so_A1(1) - 1;
            s_new1(2) = so_A1(2);

        case 3      %Right
            s_new1(1) = so_A1(1) + 1;
            s_new1(2) = so_A1(2);

        case 4      %Stay
            s_new1(1) = so_A1(1);
            s_new1(2) = so_A1(2);
    end

    %Determines new states based on old states and current action for
    %pedestrian
    switch dir2
        case 1      %Forward
            s_new2(1) = so_A2(1);
            s_new2(2) = so_A2(2) + 1;

        case 2      %Left
            s_new2(1) = so_A2(1) - 1;
            s_new2(2) = so_A2(2);

        case 3      %Right
            s_new2(1) = so_A2(1) + 1;
            s_new2(2) = so_A2(2);

        case 4      %Backward
            s_new2(1) = so_A2(1);
            s_new2(2) = so_A2(2) - 1;

        case 5      %Stay
            s_new2(1) = so_A2(1);
            s_new2(2) = so_A2(2);
    end

    %Saturate the states if on boundaries
    s_new1(1) = max([1,min([N_grid,s_new1(1)])]);
    s_new1(2) = max([1,min([N_grid,s_new1(2)])]);
    s_new2(1) = max([1,min([N_grid,s_new2(1)])]);
    s_new2(2) = max([1,min([N_grid,s_new2(2)])]);
end
        