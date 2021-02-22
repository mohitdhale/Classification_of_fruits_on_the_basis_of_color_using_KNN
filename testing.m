
%function[output]=signature(img)
input_dir = 'C:/Users/Admin/Desktop/CitrusImage3/Data Testing';


filenames = dir(fullfile(input_dir, '*.jpg'));



images = [];
k=1;
 
for n = 1:length(filenames)

    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    img = imresize(img,[256,256]);
 figure, imshow(img);title('Selected Image');

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
   
    mri_test1(k,256:768)=mri;
    mbi_test1(k,256:768)=mbi;
    mgi_test1(k,256:758)=mgi;
label_test1(k,1:256)=i;
k=k+1;
   end
  
 
 mri_test= mri_test1;
 mbi_test=mbi_test1;
 mgi_test=mgi_test1;
 label_test=label_test1

save('C:/Users/Admin/Desktop/citrusimage3/Data Testing/testset.mat','mri_test','mbi_test','mgi_test','label_test');

    
    
   

        


    

