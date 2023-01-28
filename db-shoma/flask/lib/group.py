import mysql.connector, datetime, re

class Group:

    def __init__(self):
        '''
        Constructor
        '''

    @classmethod
    def group_add(cls, user_id, group_name):
        '''
        新しいグループの追加
        '''
        db=mysql.connector.connect(host="mysql", user="root", password="root", database="tmcit")
        cursor=db.cursor(buffered=True)
        # conn = DatabaseConnection.get_connection()
        #cursor.execute("INSERT INTO userinfo VALUES (NULL, %s, %s, %s, NULL, now(), now(), NULL)", (user_name, user_password, user_mailaddress))
        cursor.execute("INSERT INTO groupinfo VALUES (%s, NULL , now(), now() , %s)", (user_id , group_name))
        db.commit()
        return True
