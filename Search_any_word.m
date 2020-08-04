clc
file_name=input('Enter file name with path:\n','s');
file=fileread(file_name);
fprintf('File read success\n');
signs={'.',',',':',';','"','-','/','?','!','&'};
file_R=replace(file,signs,'');
fprintf('Different signs are removed\n');
split_words=split(file_R);
fprintf('Word Cell formed\n');
info_words=tabulate(split_words);
word_data=categorical(info_words(:,1));
word=input('Enter word:\n','s');
[logic, position]=ismember(word,word_data);

 if logic==1
      Searched_word=string(info_words(position(),1));
      No_times_appear=cell2mat(info_words(position(),2));
      Percentage=cell2mat(info_words(position(),3));
      fprintf('Word:\tTimes:\tPercentage:\n%s\t\t%d\t\t%f\n',Searched_word,No_times_appear,Percentage);
       subplot(1,2,1)
      bar(categorical(Searched_word),No_times_appear,0.04);
      subplot(1,2,2)
      bar(categorical(Searched_word),Percentage,0.04);
      fileID=fopen('word_data.csv','a+');
      fprintf(fileID,'%s,%d,%f\n',Searched_word, No_times_appear,Percentage);
      fclose(fileID);
     
 else
     disp('word not found');
 end
    
 clear