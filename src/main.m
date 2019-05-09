
disp('Welcome! This is the pattern recignition bot beep boop')
disp('------------------------------------------------------')

prompt = 'Write "test" for testing one number or "graph" for data collection: ';
usr = input(prompt, 's');

if strcmp(usr, 'graph')
    prompt = 'Filename of your digit image: ';
    usr = input(prompt, 's');
    prompt = 'Integer value for cut-off parameter k: ';
    k = input(prompt);
    graph(usr, k)
elseif strcmp(usr, 'test')
    prompt = 'Filename of your digit image or "r" for a random number: ';
    usr = input(prompt, 's');
    prompt = 'Integer value for cut-off parameter k: ';
    k = input(prompt);
    result = digitrecog(usr, k, true);
    disp(['Relative residual = ', num2str(result(2))])
    disp(['Predicted number = ', num2str(result(1))])
else
    disp('Invalid input')
end

function graph(filename, k)
    x = linspace(0, k, k+1);
    y = ones(2, k+1);
    for i = 2:k+1
        y(:, i) = digitrecog(filename, i-1, false);
    end
    assignin('base', 'y', y)
    plot(x, y(2, :), 'r', 'LineWidth', 2)
    legend(filename)
    xlabel('k')
    ylabel('Relative residual')
    grid on
end
