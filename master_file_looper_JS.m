function [outputText] = master_file_looper(mainDir, kilosortDir, varargin)
  h = tic;

  % Extract out subfolder names
  fileList = dir(mainDir);
  dirIdx = [fileList.isdir];
  dirList = fileList(dirIdx);
  dirNames = {dirList(3:end).names}; % Start from 3 to exclude '.' and '..'

  % Main loop per folder
  for i = 1:length(dirNames)
    % Create channel map in each folder
    cd(kilosortDir)
    create_channel_map_fun([mainDir filesep dirnames{i}]);

    % Run main KiloSort file for each folder
    master_kilosort_fun([mainDir filesep dirnames{i}], kilosortDir);
  end
  totTime = toc(h);
  fprintf('Full program finished in %d seconds', totTime)
end
