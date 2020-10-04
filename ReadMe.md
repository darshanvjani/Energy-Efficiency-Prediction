Problem Statement:
Predicting Energy Efficiency Of A Structure 
 
Description:
An end to end mobile app and a web app which will help structural engineers in predicting the energy efficiency of a building. 
Energy Efficiency is a function of different architecture parameters , it tells us how good a structure is in storing the thermal energy it has in terms of temperature. 
This will result in building a more effective structure in storing the heat/cold results in an overall reduction in the cost of heating, ventilation, and air conditioning of the building.

---------------------------------------------------
File description:

-> ml_model.ipynb is our colab file in which we have studied our data and trained our machine learning model.

-> backed_preprocessing is a python script which we have used for our backend preprocessing pipeline.

-> main.dart is our flutter file for creating our apk.

Folder description:

-> Dataset folder has ENB2012_data.xlsx which is the dataset we have used for our model it has 8 features and 2 target variable(heating_load,cooling_load).
-> Explorary Data Analysis is already done is the colab file.

-> Pickle_file:It contain two pickle file from which rf_model.pkl is the trained model, while scaler.pkl is the preprocessing model for the data coming from the apk through api call. 

---------------------------------------------------

Deployment:
-> We have deployed our model on aws ec2 instance.We made one API using that we communicate between mobile app and webapp.


