from flask import Flask, request, redirect, render_template, url_for
import mysql.connector


app = Flask(__name__)
db_config = {
    'user': 'root',
    'password': 'ironhack',
    'host': 'localhost',
    'database': 'test_python'
} 

@app.route('/')
def index():
    return render_template('oxedecor.html')


if __name__ == '__main__':
     app.run(debug=True)