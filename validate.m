clc;
clear all;
close all;

a = load('C:/Users/Admin/Desktop/citrusimage3/Data Training/trainset.mat');
B  = load('C:/Users/Admin/Desktop/citrusimage3/Data Testing/testset.mat');




        
input_dir = 'C:/Users/Admin/Desktop/citrusimage3/Data Testing';



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
    [r,c]=size(img);    mr=zeros(r,c);
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

 mri_train= mri_train1;
 mbi_train=mbi_train1;
 mgi_train=mgi_train1;
 label_train=label_train1
 
c1 = a.mri_train;
c2 = a.mbi_train;
c3 = a.mgi_train;
Train_Data = [c1 c2  c3];


s1 = B.mri_test;
s2 = B.mbi_test;
s3 = B.mgi_test;
sample_Data = [s1 s2  s3];
group=[1 2 3 4 5 6 7 8 9 10 11  12 13 14 15];
class1 = knnclassify(sample_Data, Train_Data, group);
% class2=knnclassify(sample_Data,Train_Data,group);



