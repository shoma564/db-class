from flask import Flask, render_template, request
import mysql.connector, datetime, re


app = Flask(__name__)

@app.route("/")
def index():
    return render_template('index.html')




@app.route("/result", methods=["POST"])
def result():
    password = request.form["password"]
    user = request.form["user"]

    db=mysql.connector.connect(host="mysql", user="root", password="root", database="admininfo")
    cursor=db.cursor(buffered=True)

    #cursor.execute("INSERT INTO slack VALUES (%s, %s, %s, %s, %s, %s, %s)", (0 ,webhook_url, Cname, Cid, token, user, sub_date))
    #iru = cursor.execute("select exists (select * from admininfo where user = '%s')",('user',))
    cursor.execute("select password from admininfo where user = %s", (user,))
    iru = cursor.fetchall()
    iru = str(iru)
    iru = re.sub(r"[^0-9a-zA-Z]", "", iru)

    print(iru)
    db.commit()

    if iru == password:
        return render_template("logsuc.html", password = password, user = user)
    else:
        return render_template("logfail.html", password = password, user = user)


@app.route("/touroku")
def touroku():
    return render_template("touroku.html")

@app.route("/toures", methods=["POST"])
def toures():
    password = request.form["password"]
    user = request.form["user"]

    db=mysql.connector.connect(host="mysql", user="root", password="root", database="admininfo")
    cursor=db.cursor(buffered=True)

    cursor.execute("INSERT INTO admininfo VALUES (%s, %s, %s)", (0, user, password))
    db.commit()


    return render_template("tousuc.html", user = user, password = password)



if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80, debug=True)
