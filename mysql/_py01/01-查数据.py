from pymysql import connect

class JD(object):
    def __init__(self):
        self.conn = connect(host='localhost', port=3306, user='root', password='',database='jing_dong', charset='utf8')
        self.cursor = self.conn.cursor()
    
    def __del__(self):
        self.cursor.close()
        self.conn.close()

    def excute_sql(self, sql):
       self.cursor.execute(sql)
       for temp in self.cursor.fetchall():
           print(temp)

    def show_all_items(self):
        """显示所有的商品"""
        sql = "select * from goods;"
        self.excute_sql(sql)
        
    def show_all_brands(self):
        """显示所有的商品品牌"""
        sql = "select name from goods_brand;"
        self.excute_sql(sql)

    def show_all_cates(self):
        """显示所有的商品分类"""
        sql = "select name from goods_cates;"
        self.excute_sql(sql)

    @staticmethod
    def print_menu():
        print("----------------------JD--------------------------")
        print("1:所有商品")
        print("2:所有商品分类")
        print("3:所有商品品牌分类")
        num = input("请输入功能对于的序号:")
        return num
       
    def run(self):
        while True:
            num = self.print_menu()
            if num == "1":
                self.show_all_items()
            elif num =="2":
                self.show_all_cates()
            elif num == "3":
                self.show_all_brands() 
            else:
                print("输入有误，重新输入")
    




def main():
    #1. 创建一个京东商城对象
    jd = JD()


    #2. 调用这个对象的run方法
    jd.run()


if __name__ == "__main__":
    main()
