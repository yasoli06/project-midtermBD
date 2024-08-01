from flask import Flask, request, redirect, render_template, url_for
import mysql.connector


app = Flask(__name__)
db_config = {
    'user': 'root',
    'password': 'ironhack',
    'host': 'localhost',
    'database': 'oxedecor'
} 

@app.route('/')
def index():
    return render_template('oxedecor.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        address = request.form['address']
        phone = request.form['phone']
        email = request.form['email']
        password = request.form['password']

        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()
        query = "INSERT INTO customers (name, address, phone, email) VALUES (%s, %s, %s, %s)"
        try:
            cursor.execute(query, (username,address, phone, email))
            conn.commit()
        except:
            conn.rollback()
        cursor.close()
        return redirect(url_for('success'))

    return render_template('register.html')

@app.route('/success')
def success():
    return "Registration successful =D"

if __name__ == '__main__':
     app.run(debug=True)