%Prelimenary Dec-MDP model
%Will probably be missing some semi-important stuff right now
%Based on MDP framework; only difference will be the addition of
%observations and the number of actions that have to be accounted for

clear 
close all
clc

%% Gridworld Parameters

N_grid = 5;                 %Number of grids in one direction
N_state = N_grid * N_grid;  %Total number of states (square gridworld)
N_act_A1 = 4;               %Number of actions for vehicle (forward, left, right, stop)
N_act_A2 = 5;               %Number of actions for pedestrian (forward, left, right, backwards, stop)

si_A1 = [1;1];              %Initial state of vehicle
si_A2 = [4;4];              %Initial state of pedestrian

ai_A1 = 3;                  %Initial action of vehicle (right)
ai_A2 = randi(5);           %Initial action of pedestrian (randomized)

sg_A1 = [5;5];              %Goal state of vehicle
%With Intent Communication
sg_A2 = [1;2];              %Goal state of pedestrian
%With Intent Communication

rew_goal = 10;              %Reward for getting to the goal for each agent
rew_trans = 2;              %Reward for each successful transition for each agent
rew_crash = -100;           %Reward for the vehicle and pedestrian colliding

gamma = 0.9;                %Discount factor

%Create parameter list to be used across functions
params.N_grid = N_grid;
params.N_state = N_state;
params.N_act_A1 = N_act_A1;
params.N_act_A2 = N_act_A2;
params.si_A1 = si_A1;
params.si_A2 = si_A2;
params.ai_A1 = ai_A1;
params.ai_A2 = ai_A2;
params.sg_A1 = sg_A1;
%With Intent Communication
params.sg_A2 = sg_A2;
%With Intent Communication
params.rew_goal = rew_goal;
params.rew_trans = rew_trans;
params.rew_crash = rew_crash;
params.gamma = gamma;

%% Algorithm Execution

iter = 10;                 %Number of iterations allowed until program stops

rew_eval1 = zeros(iter,1);   %Initialize the reward vector
rew_eval2 = zeros(iter,1);

%Set initial old states
so_A1 = si_A1;
so_A2 = si_A2;
params.so_A1 = so_A1;
params.so_A2 = so_A2;

for i = 2:iter
    %Calculate the best action for each agent and calculate the max value
    %for those actions
    [val_max1, val_max2, an_A1, an_A2] = gridworld_greedy_act(N_grid, so_A1, so_A2, N_act_A1, N_act_A2, params);
    
    %Set the new values for the actions to the old values
    ai_A1 = an_A1;
    ai_A2 = an_A2;
    
    %Send max values to an array for the agents
    rew_eval1(i) = rew_eval1(i-1) + val_max1;
    rew_eval2(i) = rew_eval2(i-1) + val_max2;
    
    %Calculate new states for each agent 
    [s_new1, s_new2] = gridworld_trans(N_grid, ai_A1, ai_A2, so_A1, so_A2);
    
    %Set old states equal to new states
    so_A1 = s_new1
    so_A2 = s_new2
      
    if((s_new1(1) == sg_A1(1)) && (s_new1(2) == sg_A1(2))) 
        break;
    end
    
    
end

rew_eval1
rew_eval2

x = 1:1:iter;

figure
plot(x,rew_eval1,x,rew_eval2)

title('Agent Reward Plots')
xlabel('Iteration Number')
ylabel('Reward Value')
legend('Agent 1 (Vehicle)', 'Agent 2 (Human)')


















