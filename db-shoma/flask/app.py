from flask import Flask, render_template, request
import mysql.connector, datetime


app = Flask(__name__)

@app.route("/")
def index():
    return render_template('index.html')




@app.route("/result", methods=["POST"])
def result():
    password = request.form["password"]
    user = request.form["user"]

    db=mysql.connector.connect(host="mysql", user="root", password="root", database="slack")
    cursor=db.cursor()

    cursor.execute("INSERT INTO slack VALUES (%s, %s, %s, %s, %s, %s, %s)", (0 ,webhook_url, Cname, Cid, token, user, sub_date))
    db.commit()



    return render_template("form.html", webhook_url = webhook_url, Cid = Cid, token = token, user = user, Cname = Cname)



if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80, debug=True)
