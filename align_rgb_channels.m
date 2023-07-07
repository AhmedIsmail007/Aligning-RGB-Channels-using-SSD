%Read the image
img = imread('course1image.jpg');

%Get the height and the width of the full image
[height, width] = size(img);

%Get the height and the width for each channel (R, G, B)
%floor(height/3) rounds 'channel_height' and 'channel_width' to the nearest integer less than or equal to that element
channel_height = floor(height/3);
channel_width = floor(width);

%Get B, G, and R channels in separate matrices
B = img(1:channel_height, 1:channel_width);
G = img(channel_height+1:2*channel_height, 1:channel_width);
R = img(2*channel_height+1:3*channel_height, 1:channel_width);

%Get center coordinates of each channel
center_height = (channel_height/2) - 25;
center_width = (channel_width/2) - 25;

%Get Reference Green Channel center region (51x51) in double type
ref_img_region = double(G(center_height : (center_height+50) , center_width : (center_width+50)));

%Get the offset for R and B channels over green channel
red_offset = offset(double(R(center_height : (center_height+50) , center_width : center_width+50)), ref_img_region);
blue_offset = offset(double(B(center_height : (center_height+50) , center_width : center_width+50)), ref_img_region);

%Get R and B channels after shifting using circshift function
shifted_red = circshift(R, red_offset);
shifted_blue = circshift(B, blue_offset);

%Put the three channels on top of each other
ColorImg_aligned = cat(3, shifted_red, G, shifted_blue);

%Print final aligned image
imshow(ColorImg_aligned);

%Declare 'offset' function to get the minimum offset for R and B channels using "Sum of squared differences (SSD)"
function smallest_offset = offset(channel, ref_region)

    %Initialize 'MIN' variable to infinity at begging to compare it with small numbers and select the smallest offset number
    %Do not initialize 'MIN' to 0, because 0 is already a small number
    minimum_offset = inf;
    for x = -10:10
        for y = -10:10
            
            temp = circshift(channel, [x,y]);
            ssd = sum(sum((ref_region - temp).^2, 'all'));
            
            if ssd < minimum_offset
                smallest_offset = [x,y];
                % Update minimum_offset
                minimum_offset = ssd; 
            end
        end
    end
end
