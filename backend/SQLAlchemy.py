from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import pymysql
import uuid
from datetime import datetime
pymysql.install_as_MySQLdb()

app = Flask(__name__)


class Config(object):
    """配置参数"""
    # 设置连接数据库的URL
    user = 'root'
    password = 1
    database = 'ydr'
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://%s:%s@127.0.0.1:3306/%s' % (
        user, password, database)

    # 设置sqlalchemy自动更跟踪数据库
    SQLALCHEMY_TRACK_MODIFICATIONS = True

    # 查询时会显示原始SQL语句
    app.config['SQLALCHEMY_ECHO'] = True

    # 禁止自动提交数据处理
    app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = False


# 读取配置
app.config.from_object(Config)

# 创建数据库sqlalchemy工具对象
db = SQLAlchemy(app)


# 用户表
class User(db.Model):
    __tablename__ = "ydr_user"

    userId = db.Column(db.String(255), primary_key=True, unique=True)
    userName = db.Column(db.String(255))
    age = db.Column(db.Integer)
    sex = db.Column(db.Enum)


# 问卷表
class Poll(db.Model):
    __tablename__ = "ydr_poll"

    pollId = db.Column(db.String(255), primary_key=True,
                       unique=True, default=uuid.uuid4)
    description = db.Column(db.String(255))
    userId = db.Column(db.String(255))
    time = db.Column(db.DateTime, onupdate=datetime.now, default=datetime.now)


# 疾病表
class Disease(db.Model):
    __tablename__ = "ydr_disease"

    diseaseId = db.Column(db.String(255), primary_key=True,
                          unique=True, default=uuid.uuid4)
    diseaseName = db.Column(db.String(255), unique=True)


# 风险表
class Risk(db.Model):
    __tablename__ = "ydr_risk"

    riskId = db.Column(db.String(255), primary_key=True,
                       unique=True, default=uuid.uuid4)
    description = db.Column(db.String(255))
    relatedRisk = db.Column(db.Double)
    prevalence = db.Column(db.Double)
    category = db.Column(db.Enum)
    bunch = db.Column(db.Integer)
    diseaseId = db.Column(
        db.String(255), db.ForeignKey('ydr_disease.diseaseId'))


# 问卷细节表
class PollDetail(db.Model):
    __tablename__ = "ydr_polldetail"

    diseaseId = db.Column(
        db.String(255), db.ForeignKey('ydr_disease.diseaseId'))
    pollId = db.Column(db.String(255), db.ForeignKey('ydr_poll.pollId'))
    riskScore = db.Column(db.Integer)


# 风险细节表
class riskDetail(db.Model):
    __tablename__ = "ydr_riskdetail"

    riskId = db.Column(
        db.String(255), db.ForeignKey('ydr_risk.riskId'))
    pollId = db.Column(db.String(255), db.ForeignKey('ydr_poll.pollId'))


if __name__ == '__main__':
    with app.app_context():
        # 插入一条角色数据
        user1 = User(userId='123456789098765432',
                     userName='测试', age='38', sex='male')
        db.session.add(user1)
        db.session.commit()
