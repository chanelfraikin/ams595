%% Task 1

f1 = figure; % Creates the first figure 
f2 = figure; % Creates the second figure 

figure(f1); hold on;
figure(f2); hold on;

% The outside for-loop increases the number of points tested by 100 points
% for each iteration
for n = 1:100:10000
    tic;
    count = 0;
    % The inside for-loop tests n points
    for i = 1:n
        x = rand;
        y = rand;
        % The if statement tests whether the random points are within the
        % quarter circle
        if y <= sqrt(1-x^2)
            count = count + 1;
        end
    end
    % Calculate the difference from Pi and plot the results
    diff = pi - count/n * 4;
    figure(f1);
    plot(n, diff, 'b*');
    
    % Calculate the time the program took for each n and plot the results
    elapsed_time = toc;
    figure(f2);
    plot(n, elapsed_time, 'o');
    
end

% Configure Figure 1 with labels
figure(f1)
yline(0);
hold off;
xlabel('Number of Points');
ylabel('Difference between Pi and Computed Value');
title('Number of Points vs Difference in Value');

% Configure Figure 2 with labels
figure(f2)
hold off;
xlabel('Number of Points');
ylabel('Computation Time');
title('Number of Points vs Computation Time');


%% Task 2

computed_pi = 0; % Initialize the variable that we will compute for pi
N = 2; % number of significant figures
n = 0;
count = 0;

% the while loop compares a rounded computed value for pi to a
% rounded value for pi. The loop continues until the rounded values are
% equal
while computed_pi ~= round(3.1415926535897932384626433832795028841971693...
        ,N,"significant")
    x = rand;
    y = rand;

    % The if statement tests whether the random points are within the
    % quarter circle and adds to the count
    if y <= sqrt(1-x^2)
        count = count + 1;
    end

    computed_pi = count/n * 4;
    % round the computed pi to N significant digits
    computed_pi = round(computed_pi,N,"significant"); 
    n = n + 1; % Increment the number of points for the next iteration

end    
% print out the computed value of pi that round to the correct number of
% significant figures and the number of iterations it took to get to that
% value
computed_pi
n

%% Task 3
function computed_pi = compute_pi(N)
    % Initialize variables
    computed_pi = 0; 
    n = 0;
    count = 0;
    
    figure;
    hold on;
    
    % Plot quarter circle
    % Generate angles
    theta = linspace(0, pi/2, 100);

    plot(cos(theta), sin(theta));
    grid on;
    xlabel('x')
    ylabel('y')


    % the while loop rounds the computed value for pi and compares it to a
    % rounded value for pi. The loop continues until the rounded values are
    % equal
    while round(computed_pi,N,"significant") ~= round(3.14159265359...
            ,N,"significant") 
        x = rand;
        y = rand;
        

        % The if statement tests whether the random points are within the
        % quarter circle and adds to the count
        if y <= sqrt(1-x^2)
            count = count + 1;
            % plot blue stars if the points are within the quarter circle
            plot(x,y,'b*')
        else
            % plot green stars if the points are not within the quarter circle
            plot(x,y,'r*')
        end
    
        computed_pi = count/n * 4;
        n = n + 1; % Increment the number of points for the next iteration
    
    end
    % Round the computed_pi to the correct number of significant figures
    computed_pi = round(computed_pi,N,"significant");
    
    % Create text display on graph for rounded computed pi
    text_to_display = ['Computed Pi: ', num2str(computed_pi)];
    text(0.8, 0.8, text_to_display, 'FontSize', 12, 'FontWeight', 'bold');
    end


compute_pi(4)

