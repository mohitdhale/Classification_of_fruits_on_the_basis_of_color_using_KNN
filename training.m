
%function[output]=signature(img)
input_dir = '\Data training';
filenames = dir(fullfile(input_dir, '*.jpg'));



images = [];
k=1;
 
for n = 1:length(filenames)

    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    img = imresize(img,[256,256]);
% figure, imshow(img);title('Selected Image');

    r=img(:,:,1);
    
    b=img(:,:,2);
    
    g=img(:,:,3);
   
    m1=mean(mean(r));
   [r,c]=size(img);
   mr=zeros(r,c);
   mb=zeros(r,c);
   mg=zeros(r,c);
    m2=mean(mean(b));
    
    m3=mean(mean(g));
   mri=m1+m2+m3/m1;
   mbi=m1+m2+m3/m2;
   mgi=m1+m2+m3/m3;
   
    mri_train1(k,256:768)=mri;
    mbi_train1(k,256:768)=mbi;
    mgi_train1(k,256:758)=mgi;
label_train1(k,1:256)=i;
k=k+1;
   end
  
 if strcmp(filename(6),'O')
        label_train1(k)=1;
    elseif strcmp(filename(6),'N')
        label_train1(k)=2;
    else
        label_train1(k)=3;
    end
    
    k=k+1;
    train_vec(:,n)=[mri mbi mgi].';
 mri_train= mri_train1;
 mbi_train=mbi_train1;
 mgi_train=mgi_train1;
 label_train=label_train1

save('/Data Training/trainset.mat','mri_train','mbi_train','mgi_train','label_train');

    
    
   

        


    

