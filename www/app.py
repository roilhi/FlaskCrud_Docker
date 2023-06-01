from flask import Flask, request, render_template, redirect ,url_for, flash
#import mariadb
from flask_mysqldb import MySQL
app = Flask(__name__)

# Conexión MySQL (MariaDB)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'psswd'
app.config['MYSQL_DB'] = 'ejemplo_db'
mysql = MySQL(app)

# Sesión de servidor (mem)
app.secret_key = 'mysecretkey'

'''
config = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'password': 'psswd',
    'database': 'datos'
}
    # conectarse a la base MariaDB usando mariadb
    conn = mariadb.connect(**config)
    # crear un nuevo cursor
    cur = conn.cursor()
'''

@app.route('/')
def Index():
    cur = mysql.connection.cursor()
    cur.execute('SELECT ID_empleado,Nombre,Apellido,Telefono,Edad,Domicilio FROM empleados')
    data = cur.fetchall()
    return render_template('index.html', contacts=data)

@app.route('/add_contact', methods=['POST'])
def add_contact():
    if request.method == 'POST':
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        telefono = request.form['telefono']
        domicilio = request.form['domicilio']
        edad = request.form['edad']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO empleados (Nombre,Apellido,Telefono,Edad,Domicilio) VALUES (%s,%s,%s,%s,%s)", 
                    (nombre,apellido,telefono,edad,domicilio))
        mysql.connection.commit()
        flash('Empleado agregado satisfactoriamente')
    return redirect(url_for('Index'))

@app.route('/edit/<id>')
def get_contact(id):
    cur = mysql.connect.cursor()
    cur.execute("SELECT ID_empleado,Nombre,Apellido,Telefono,Edad,Domicilio FROM empleados WHERE ID_empleado = %s", [id])
    data = cur.fetchall()
    print(data[0])
    return render_template('edit-contact.html',contact = data[0])

@app.route('/update/<id>', methods = ['POST'])
def update_contact(id):
    if request.method == 'POST':
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        telefono = request.form['telefono']
        domicilio = request.form['domicilio']
        edad = request.form['edad']
        cur = mysql.connection.cursor()
        cur.execute(""" 
        UPDATE empleados
        SET Nombre = %s,
            Apellido = %s,
            Telefono = %s,
            Edad = %s,
            Domicilio = %s
        WHERE ID_empleado = %s  
        """, (nombre,apellido,telefono,edad,domicilio,id))
    flash('Empleado actualizado satisfactoriamente')
    mysql.connection.commit()
    return redirect(url_for('Index'))

@app.route('/delete/<string:id>')
def delete_contact(id):
    cur = mysql.connection.cursor()
    cur.execute('DELETE FROM empleados WHERE ID_empleado = {0}'.format(id))
    mysql.connection.commit()
    flash('Empleado removido satisfactoriamente')
    return redirect(url_for('Index'))

if __name__=='__main__':
    app.run(host='0.0.0.0', debug=True)
    #app.run(port=3000, debug=True)


