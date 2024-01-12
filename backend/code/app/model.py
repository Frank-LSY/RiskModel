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
    age = db.Column(db.Integer)
    sex = db.Column(db.Enum('男性', '女性'))


# 问卷表
class Poll(db.Model):
    __tablename__ = "ydr_poll"

    pollId = db.Column(db.String(255), primary_key=True,
                       unique=True, default=uuid.uuid4)
    description = db.Column(db.String(255))
    userId = db.Column(db.String(255), db.ForeignKey('ydr_user.userId'))
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
