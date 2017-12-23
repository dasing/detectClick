function detectClick(srcDir, dstDir)

    files = [ dir([srcDir '/' '*.jpg']); dir([srcDir '/' '*.JPG']); dir([srcDir '/' '*.png']); dir([srcDir '/' '*.jpeg'])];
    fprintf('get %d files\n', length(files));
    for i = 1: length(files)
        fprintf('process %s\n', files(i).name);
        [~, name, ext ] = fileparts(files(i).name);
        [fp, errMsg] = fopen( [dstDir '/' name '.txt'], 'w');
        if( fp < 0 )
            disp(errMsg)
        end
        
        img = imread(fullfile( srcDir, files(i).name));
        imshow(img);
        fig=get(groot, 'CurrentFigure');
        while(~isempty(fig))
            try
                [x_pos, y_pos] = ginput(1);
                %fprintf(fp, '%s', [ 'chair,' ]);
                fprintf(fp, '%d, %d\n', [ round(x_pos), round(y_pos) ]);
                fprintf('writing : %d, %d to file\n', [ round(x_pos), round(y_pos) ]);
            catch
                break
            end
            
            
        end
        fclose(fp);
    end
end