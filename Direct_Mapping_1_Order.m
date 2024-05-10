function Direct_Mapping_1_Order(im, Factor)
    [rows, cols, channels] = size(im);
    newRows = round(rows * Factor);
    newCols = round(cols * Factor);
    new_im = zeros(newRows, newCols, channels, 'uint8');
    for k = 1:channels
        for i = 1:newRows
            for j = 1:newCols
                orig_i = round(i / Factor);
                orig_j = round(j / Factor);
                if orig_i == 0
                    orig_i = 1;
                end
                if orig_j == 0
                    orig_j = 1;
                end
                if orig_i > rows
                    orig_i = rows;
                end
                if orig_j > cols
                    orig_j = cols;
                end
                new_im(i, j, k) = im(orig_i, orig_j, k);
            end
        end
    end
    figure, imshow(im), title('Original');
    figure, imshow(new_im), title('Resized');
end
