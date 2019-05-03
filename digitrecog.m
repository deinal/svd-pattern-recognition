
disp('Welcome! This is the pattern recignition bot beep boop')
disp('------------------------------------------------------')

ise = evalin('base', 'exist(''U'',''var'') == 1');
if ~ise
    f = waitbar(0,'Calculating training data...');
    U = zeros(784, 784, 10);
    for i = 1:10
        file = ['trainingdata/digit' num2str(i-1) '.mat'];
        U(:, :, i) = svddigit(file);
        waitbar(i/10,f,'Calculating training data...')
    end
    close(f)
end

addpath(genpath('/testdata/'));

prompt = 'Write filename of your digit image or r for a random number: ';
usr = input(prompt, 's');

prompt = 'Integer value for cut-off parameter k: ';
k = input(prompt);

if strcmp(usr, 'r')
    loadmnist('t10k-images.idx3-ubyte');
    rng = randi([1 10000]);
    z = ans(:, rng);
    dispimage(z)
    z = rot90(fliplr(reshape(z, 28, 28)));
else
    z = imagematrix(usr);
    if z == 0 
        return
    end
    imshow(mat2gray(z), 'InitialMagnification', 'fit')
    z = rot90(fliplr(z));
end
z = reshape(z, 784, 1);

r = zeros(1, 10);
for i = 1:10
    r(1, i) = residual(k, z, U(:, :, i));
end

minimum = min(r);
disp(['Relative residual = ', num2str(minimum)])
disp(['Predicted number = ', num2str(find(r==minimum)-1)])

function imdata = imagematrix(filename)
    imdata = imread(filename);
    imdata = imcomplement(imdata);
    imdata = rgb2gray(imdata);
    imdata = im2double(imdata);
    s = size(imdata);
    if s(1, 1) ~= s(1, 2)
        disp('Error: Imagefile is not square')
        imdata = 0;
        return
    elseif s(1, 1) ~= 28
        imdata = imresize(imdata, 28/s(1, 1));
    end
end

function U = svddigit(filename)
    load(filename);
    D = D';
    [U, ~, ~] = svd(D);
end

function r = residual(k, z, U)
    r = norm((eye(784, 784) - U(:, 1:k)*U(:, 1:k)')*z)/norm(z);
end

function dispimage(z)
    mi = 28;
    im = reshape(z, mi, mi);
    im = mat2gray(im);
    imshow(im, 'InitialMagnification', 'fit')
end
