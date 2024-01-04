from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import pymysql
import uuid
from datetime import datetime
import json
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
    relatedRisk = db.Column(db.Float)
    prevalence = db.Column(db.Float)
    category = db.Column(db.Enum)
    bunch = db.Column(db.Integer)
    diseaseId = db.Column(
        db.String(255), db.ForeignKey('ydr_disease.diseaseId'))


# 问卷细节表
class PollDetail(db.Model):
    __tablename__ = "ydr_polldetail"
    __table_args__ = (
        db.PrimaryKeyConstraint('diseaseId', name='ydr_disease_diseaseId'),
        db.PrimaryKeyConstraint('pollId', name='ydr_poll_pollId')
    )

    diseaseId = db.Column(
        db.String(255), db.ForeignKey('ydr_disease.diseaseId'))
    pollId = db.Column(db.String(255), db.ForeignKey('ydr_poll.pollId'))
    riskScore = db.Column(db.Integer)


# 风险细节表
class riskDetail(db.Model):
    __tablename__ = "ydr_riskdetail"
    __table_args__ = (
        db.PrimaryKeyConstraint('riskId', name='ydr_risk_riskId'),
        db.PrimaryKeyConstraint('pollId', name='ydr_poll_pollId')
    )

    riskId = db.Column(
        db.String(255), db.ForeignKey('ydr_risk.riskId'))
    pollId = db.Column(db.String(255), db.ForeignKey('ydr_poll.pollId'))


def insert_risk(diseaseId, model, riskFile):
    with open(riskFile, 'r', encoding='utf-8') as f:
        risks = json.load(f)
        for item in risks:
            print(item)
            risk = model(description=item['description'],
                         relatedRisk=item['relatedRisk'],
                         prevalence=item['prevalence'],
                         category=item['category'],
                         bunch=item['bunch'], diseaseId=diseaseId
                         )
            db.session.add(risk)
            db.session.commit()


if __name__ == '__main__':
    with app.app_context():

        # # 插入疾病数据
        # with open('./data/disease.json', 'r', encoding='utf-8') as f:
        #     disease = json.load(f)

        # ill_list = []
        # for item in disease:
        #     ill = Disease(diseaseName=item)
        #     ill_list.append(ill)
        #     print(item)
        # db.session.add_all(ill_list)
        # db.session.commit()

        # 插入风险数据
        # 膀胱癌
        bladderId = Disease.query.filter_by(
            diseaseName='膀胱癌').first().diseaseId
        insert_risk(bladderId, Risk, './data/bladder.json')
        # 乳腺癌
        breastId = Disease.query.filter_by(
            diseaseName='乳腺癌').first().diseaseId
        insert_risk(breastId, Risk, './data/breast.json')
        # 宫颈癌
        cervicalId = Disease.query.filter_by(
            diseaseName='宫颈癌').first().diseaseId
        insert_risk(cervicalId, Risk, './data/cervical.json')
        # 大肠癌
        colonId = Disease.query.filter_by(
            diseaseName='大肠癌').first().diseaseId
        insert_risk(colonId, Risk, './data/colon.json')
        # 肾癌
        kidneyId = Disease.query.filter_by(
            diseaseName='肾癌').first().diseaseId
        insert_risk(kidneyId, Risk, './data/kidney.json')
        # 肺癌
        lungId = Disease.query.filter_by(
            diseaseName='肺癌').first().diseaseId
        insert_risk(lungId, Risk, './data/lung.json')
        # 卵巢癌
        ovarianId = Disease.query.filter_by(
            diseaseName='卵巢癌').first().diseaseId
        insert_risk(ovarianId, Risk, './data/ovarian.json')
        # 胰腺癌
        pancreaticId = Disease.query.filter_by(
            diseaseName='胰腺癌').first().diseaseId
        insert_risk(pancreaticId, Risk, './data/pancreatic.json')
        # 前列腺癌
        prostateId = Disease.query.filter_by(
            diseaseName='前列腺癌').first().diseaseId
        insert_risk(prostateId, Risk, './data/prostate.json')
        # 黑色素瘤
        melanomaId = Disease.query.filter_by(
            diseaseName='黑色素瘤').first().diseaseId
        insert_risk(melanomaId, Risk, './data/melanoma.json')
        # 胃癌
        stomachId = Disease.query.filter_by(
            diseaseName='胃癌').first().diseaseId
        insert_risk(stomachId, Risk, './data/stomach.json')
        # 子宫癌
        uterineId = Disease.query.filter_by(
            diseaseName='子宫癌').first().diseaseId
        insert_risk(uterineId, Risk, './data/uterine.json')
        # COPD
        copdId = Disease.query.filter_by(
            diseaseName='支气管炎/肺气肿').first().diseaseId
        insert_risk(copdId, Risk, './data/copd.json')
        # 糖尿病
        diabetesId = Disease.query.filter_by(
            diseaseName='糖尿病').first().diseaseId
        insert_risk(diabetesId, Risk, './data/diabetes.json')
        # 心血管疾病
        heartId = Disease.query.filter_by(
            diseaseName='心血管疾病').first().diseaseId
        insert_risk(heartId, Risk, './data/heart.json')
        # 骨质疏松
        osteoporosisId = Disease.query.filter_by(
            diseaseName='骨质疏松').first().diseaseId
        insert_risk(osteoporosisId, Risk, './data/osteoporosis.json')
        # 中风
        strokeId = Disease.query.filter_by(
            diseaseName='中风').first().diseaseId
        insert_risk(strokeId, Risk, './data/stroke.json')
