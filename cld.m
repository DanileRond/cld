function descriptor = prog2(image)

%% Partitioning (8x8 blocks)

% rgbImage = imread('C:\Users\Omar\Desktop\UPC\3B\PIV\Lab\Prog1-CBIR\UKentuckyDatabase\UKentuckyDatabase/ukbench00000.jpg');
% %RGB to YCbCr
yCbCrImage = rgb2ycbcr(image);

% Get the dimensions of the image
[rows, columns, numberOfColorBands] = size(yCbCrImage);
blockSizeR = rows/8; % Rows in block.
blockSizeC = columns/8; % Columns in block.s

% Figure out the size of each block in rows.
% Most will be blockSizeR but there may be a remainder amount of less than that.
wholeBlockRows = floor(rows / blockSizeR);
blockVectorR = [blockSizeR * ones(1, wholeBlockRows)];
% Figure out the size of each block in columns.
wholeBlockCols = floor(columns / blockSizeC);
blockVectorC = [blockSizeC * ones(1, wholeBlockCols)];

% Create the cell array, ca. 
% Each cell (except for the remainder cells at the end of the image)
% in the array contains a blockSizeR by blockSizeC by 3 color array.
% This line is where the image is actually divided up into blocks.
ca = mat2cell(yCbCrImage, blockVectorR, blockVectorC, numberOfColorBands);  %Contiene en cada celda de la matriz un bloque de 8x8

%% Representative color selection (for each block)

RepresentativeColorMatrix = zeros(wholeBlockRows,wholeBlockCols,3);
for i = 1:wholeBlockRows
    for j = 1:wholeBlockCols
              avg = mean(mean(ca{i,j}));
              RepresentativeColorMatrix(i,j,:) = [avg(1), avg(2), avg(3)];
    end
end

%% DCT and zig-zag scan
YCoeff = zig_zag(dct2(RepresentativeColorMatrix(:, :, 1)));
CbCoeff = zig_zag(dct2(RepresentativeColorMatrix(:, :, 2)));
CrCoeff = zig_zag(dct2(RepresentativeColorMatrix(:, :, 3)));

%% Color descriptor
descriptor = [YCoeff(1:6), CbCoeff(1:3), CrCoeff(1:3)];
    
end