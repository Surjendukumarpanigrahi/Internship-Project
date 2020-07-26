# Internship-Project
Sir as you said I have done the registartion form.
I have stored the data in xampp mysql database
For the image I have used free firebase storage.For every time a new user registers I am storing his/her image as phonenumber.jpg in firebase.
Then when the user logs in its automatically downloads his/her photo according to his/her phone number and putting the image in image folder which is in the static folder of the app.

And lastly I hosted it in online AWS EC2 cloud.
The link is 18.224.165.77

In there I face a problem when logging into the dashboard.It sucessfully registers but when you try to login it gives some server error.But when I resart it it works and after sometime it doesn't.I think its something in the ubuntu AWS.

So I think its the problem in AWS instance.


I am going to share a screen recording of the project and there you can see the my project is working properly.

##code run instructions

open cmd
#Go to the folder where you put the code
#unrar the dezzex.rar which is the virtual enviornment.

cd Intern
#activate the virtual enviornment

dezzex\scripts\activate

#Go to flask Folder

cd flask
#then run the program

python myapp.py

