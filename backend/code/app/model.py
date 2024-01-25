from flask_sqlalchemy import SQLAlchemy
import uuid
from datetime import datetime
import json

db = SQLAlchemy()

# 用户表


class User(db.Model):
    __tablename__ = "ydr_user"

    userId = db.Column(db.String(255), primary_key=True, unique=True)
    userName = db.Column(db.String(255))


# 问卷表
class Poll(db.Model):
    __tablename__ = "ydr_poll"

    pollId = db.Column(db.String(255), primary_key=True,
                       unique=True, default=uuid.uuid4)
    description = db.Column(db.String(255))
    userId = db.Column(db.String(255), db.ForeignKey('ydr_user.userId'))
    time = db.Column(db.DateTime, onupdate=datetime.now, default=datetime.now)


# 问卷 feature 表
class PollFeature(db.Model):
    __tablename__ = "ydr_pollfeatures"

    pollId = db.Column(db.String(255), db.ForeignKey('ydr_poll.pollId'), primary_key=True,
                       unique=True)
    age = db.Column(db.Integer)
    sex = db.Column(db.Enum('male', 'female'))
    smoking_status = db.Column(db.Enum('never', 'former', 'current'))
    smoking_yearly = db.Column(db.String(255))
    smoking_daily = db.Column(db.String(255))
    bmi = db.Column(db.Float)
    lung_cancer_history = db.Column(db.Enum('yes', 'no'))
    personal_cancer_history = db.Column(db.Enum('yes', 'no'))
    AFP = db.Column(db.Float)
    MMEF = db.Column(db.Integer)
    CEA = db.Column(db.Float)
    CRP = db.Column(db.Float)
    drinking = db.Column(db.Enum('never', 'occasional', 'regular', 'heavy'))
    exercise = db.Column(db.Integer)
    diabetes = db.Column(db.Enum('yes', 'no'))
    AST = db.Column(db.Float)
    ALT = db.Column(db.Float)
    HBV = db.Column(db.Enum('yes', 'no'))
    HCV = db.Column(db.Enum('yes', 'no'))


# 心血管 feature 表
class CardFeature(db.Model):
    __tablename__ = "ydr_cardfeatures"

    pollId = db.Column(db.String(255), db.ForeignKey('ydr_poll.pollId'), primary_key=True,
                       unique=True)
    age = db.Column(db.Integer)
    sex = db.Column(db.Enum('male', 'female'))
    olive_oil = db.Column(db.Float)
    green_veges = db.Column(db.Float)
    other_veges = db.Column(db.Float)
    berries = db.Column(db.Float)
    fruits = db.Column(db.Float)
    processed_meat = db.Column(db.Float)
    fish = db.Column(db.Float)
    chicken = db.Column(db.Float)
    cheese = db.Column(db.Float)
    butter = db.Column(db.Float)
    beans = db.Column(db.Float)
    grains = db.Column(db.Float)
    dessert = db.Column(db.Float)
    nuts = db.Column(db.Float)
    precooked_food = db.Column(db.Integer)
    drinking = db.Column(db.Integer)
    exercise = db.Column(db.Float)
    smoking_status = db.Column(db.Enum('never', 'former', 'current'))
    quit_year = db.Column(db.Integer)
    second_smoke = db.Column(db.Enum('yes', 'no'))
    sleep = db.Column(db.Float)
    bmi = db.Column(db.Float)
    cholesterol = db.Column(db.Float)
    HDL = db.Column(db.Float)
    systolic_bp = db.Column(db.Integer)
    diastolic_bp = db.Column(db.Integer)
    FBG = db.Column(db.Float)
    HbA1C = db.Column(db.Float)


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
    category = db.Column(db.Enum('life', 'work', 'family',
                         'diet', 'history', 'medicine'))
    bunch = db.Column(db.Integer)
    diseaseId = db.Column(
        db.String(255), db.ForeignKey('ydr_disease.diseaseId'))


# 问卷细节表
class PollDetail(db.Model):
    __tablename__ = "ydr_polldetail"
    __table_args__ = (
        db.PrimaryKeyConstraint('diseaseId', 'pollId',
                                name='ydr_polldetail_pkey'),
    )

    diseaseId = db.Column(
        db.String(255), db.ForeignKey('ydr_disease.diseaseId'))
    pollId = db.Column(db.String(255), db.ForeignKey('ydr_poll.pollId'))
    riskScore = db.Column(db.Integer)


# 风险细节表
class RiskDetail(db.Model):
    __tablename__ = "ydr_riskdetail"
    __table_args__ = (
        db.PrimaryKeyConstraint('riskId', 'diseaseId',
                                'pollId', name='ydr_riskdetail_pkey'),
    )

    riskId = db.Column(
        db.String(255), db.ForeignKey('ydr_risk.riskId'))
    diseaseId = db.Column(
        db.String(255), db.ForeignKey('ydr_disease.diseaseId'))
    pollId = db.Column(db.String(255), db.ForeignKey('ydr_poll.pollId'))


# 肺癌分数表
class LungProb(db.Model):
    __tablename__ = 'ydr_lungscoreprob'
    id = db.Column(db.Integer, primary_key=True, unique=True)
    year = db.Column(db.String(255))
    smoke = db.Column(db.Enum('NEVER', 'LIGHT', 'HEAVY'))
    point = db.Column(db.Integer)
    probability = db.Column(db.Float)


# 肝癌分数表
class LiverProb(db.Model):
    __tablename__ = 'ydr_liverscoreprob'
    __table_args__ = (
        db.PrimaryKeyConstraint(
            'model', 'score', 'year', 'probability', name='ydr_lungdetail_pkey'),
    )

    model = db.Column(db.String(255))
    score = db.Column(db.Integer)
    year = db.Column(db.Enum('five', 'ten'))
    probability = db.Column(db.Float)


# 肺癌细节表
class LungDetail(db.Model):
    __tablename__ = "ydr_lungdetail"
    __table_args__ = (
        db.PrimaryKeyConstraint(
            'pollId', name='ydr_lungdetail_pkey'),
    )

    pollId = db.Column(db.String(255), db.ForeignKey('ydr_poll.pollId'))
    status = db.Column(db.String(255))
    intensity = db.Column(db.String(255))
    probability = db.Column(db.Float)
    score = db.Column(db.Float)
