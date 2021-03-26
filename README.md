# Classification_of_fruits_on_the_basis_of_color_using_KNN
A simple program for classification of fruits on basis of color using KNN.

training.m - It contains a training code in which data is taken from data training in the form of jpg form and resizing them into 256 by 256 size as a preproess. Then separates out the R, G & B part into it and then using mean function for each color code and strcmp i.e. string comparision we assign the label and this how training data is created and in final we save all the data into trainset.mat file along with labels.

testing.m - testing dataset is assigned to it and using the same process of training all kind of preprocessing and all other steps are done and that testing data is saved into test.mat file.

validate.m - This code featches the both training.mat and testing.mat and using some preprocess and all other things, use the knnclassify function, classify them into 3 groups

