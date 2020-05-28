originalVideo = VideoReader('G:\parkour.mp4');
compressedVideo =VideoReader('G:\parkourbs16qac160.avi');
error = [];
while hasFrame(originalVideo)
    x = readFrame(originalVideo);
    y = readFrame(compressedVideo);
    x = rgb2gray(x);
    y = rgb2gray(y);
    mse = mean(mean(x-y).^2);
    error = [error mse];
end

disp('Mean Square Error: ');
disp(mean(error));
