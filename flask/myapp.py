import pyrebase
from flask import Flask,session,render_template,request,redirect,g,url_for
import os
from flask_mysqldb import MySQL
import datetime


app=Flask(__name__)
#For connecting to firebase storage
firebaseConfig ={ 
  'apiKey': "AIzaSyDgaOfDfTjaOW0LroxJN1zT53DkovlPrSQ",
  'authDomain': "intern-baf81.firebaseapp.com",
  'databaseURL': "https://intern-baf81.firebaseio.com",
  'projectId': "intern-baf81",
  'storageBucket': "intern-baf81.appspot.com",
  'messagingSenderId': "123288211550",
  'appId': "1:123288211550:web:ef22c5bb20b07dc6b2a4cf",
  'measurementId': "G-WB6VQ4C4TX"
}



firebase=pyrebase.initialize_app(firebaseConfig)
storage=firebase.storage()

#for connection to Xampp mysql
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'pwdpwd'
app.config['MYSQL_DB'] = 'dezzex'


mysql = MySQL(app)


app.secret_key=os.urandom(24)

#Generating url for Index page 
@app.route('/')
def blank():
    return redirect(url_for('index'))

#Displaying the index page
@app.route('/index')
def index():
    return render_template('index.html')


#Taking the user data and storing it it the database
@app.route('/register',methods=['POST'])
def register():
    if request.method =="POST":
        f_name = request.form['Full_name']
        email = request.form['Email']
        DOB = request.form['Date_of_birth']
        phone_number= request.form['Mobile_number']
        passport_number = request.form['Passport_number']
        profile_photo = request.files['Profile']
        storage.child(phone_number+'/'+phone_number+'.jpg').put(profile_photo)
        reg_time=datetime.datetime.now()
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO tbl_user (Id, Full_name, Date_of_birth, Mobile_number, Email, Passport_number, Reg_time) VALUES (NULL, %s, %s, %s, %s, %s,%s)", (f_name,DOB,phone_number,email,passport_number,reg_time))
        cur.execute("INSERT INTO tbl_login (Id, Username, Password) VALUES (NULL, %s, %s)",(phone_number,phone_number))
        mysql.connection.commit()
        return render_template('sucess.html')

    

#If the user sucessfully registers it shows this page.
@app.route('/sucess')
def sucess():
    return render_template('sucess.html')



#Displaying the login page
@app.route('/login')
def login():
    return render_template('login.html',error="")


#Validating the user
@app.route('/validate',methods=['POST'])
def validate():
    if request.method == "POST":
        user=request.form['Username']
        pwd=request.form['Password']
        cur=mysql.connection.cursor()
        cur.execute("Select * from tbl_login where username="+user)
        data=cur.fetchall()
        if data:
            for item in data:
                if pwd==item[2]:
                    session['user']=user
                    return redirect(url_for('dashboard',username=user))
        return render_template('login.html',error='Incorrect username or passowrd')



#Displaying the users Dashboard
@app.route('/dashboard/<username>')
def dashboard(username):
    if g.user:
        cur=mysql.connection.cursor()
        cur.execute("Select * from tbl_user where Mobile_number="+username)
        data=cur.fetchall()
        for item in data:
            storage.child(item[3]+'/'+item[3]+'.jpg').download('static/img/x.jpg')
        return render_template('dashboard.html',data=data,user=session['user'])
    return redirect(url_for('login'))



@app.before_request
def before_request():
    g.user=None
    if 'user' in session:
        g.user=session['user']


#Dropsession of the user
@app.route('/dropsession')
def dropsession():
    session.pop('user',None)
    return render_template('login.html')


if __name__ == '__main__':
    app.run()
