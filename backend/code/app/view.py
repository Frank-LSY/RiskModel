# views.py

from flask import jsonify, request
from .model import db
from config import Config
from sqlalchemy import func
import random


def create_app():
    from flask import Flask
    app = Flask(__name__)
    app.config.from_object(Config)
    db.init_app(app)
    return app


app = create_app()


def api_response(code=204, message='no content', data=[]):
    response = {
        'code': code,
        'message': message,
        'data': data
    }
    return jsonify(response)


# 随机插入几条问卷详细数据
@app.route('/insertpoll')
def insert_poll():
    from .model import Poll, PollDetail, Risk, RiskDetail, Disease
    polls = Poll.query.all()
    diseases = Disease.query.all()

    # 随机向 poll detail 表插入
    for poll in polls:
        pollId = poll.pollId
        for disease in diseases:
            diseaseId = disease.diseaseId
            diseaseName = disease.diseaseName
            # 随机插入风险分数
            randScore = round(random.uniform(0, 7), 2)
            pollDetailEntry = PollDetail(
                diseaseId=diseaseId,
                pollId=pollId,
                riskScore=randScore
            )
            db.session.add(pollDetailEntry)
            db.session.commit()

            # 随机向 risk detail 表插入
            risks = Risk.query.filter_by(
                diseaseId=diseaseId
            ).order_by(Risk.bunch.asc()).all()

            # risk 有多大
            risks_size = Risk.query.with_entities(func.max(Risk.bunch)).filter_by(
                diseaseId=diseaseId
            ).scalar()
            risks_length = len(risks)
            # print(diseaseName, risks_size, risks_length)
            print(risks[0])
            bunch_list = []

            # 随机选几个
            rand_add_risk = random.randint(0, risks_size)
            for i in range(rand_add_risk):
                rand_entry = random.randint(0, risks_length-1)
                if risks[rand_entry].bunch in bunch_list:
                    continue
                else:
                    bunch_list.append(risks[rand_entry].bunch)
                    riskDetailEntry = RiskDetail(
                        riskId=risks[rand_entry].riskId,
                        diseaseId=diseaseId,
                        pollId=pollId
                    )
                    db.session.add(riskDetailEntry)
                    db.session.commit()

    return api_response(code=201, message='insert success')


# 获取所有用户
@app.route('/users')
def get_users():
    from .model import User  # 延迟导入，解决循环导入问题
    users = User.query.all()
    serialized_users = []

    for user in users:
        serialized_user = {
            'userId': user.userId,
            'userName': user.userName,
            'age': user.age,
            'sex': user.sex
        }
        serialized_users.append(serialized_user)

    return api_response(code=200, message='success', data=serialized_users)

# 获取某个用户


@app.route('/user')
def get_user():
    from .model import User  # 延迟导入，解决循环导入问题
    userId = request.args.get('userId')
    user = User.query.filter_by(userId=userId).first()
    serialized_users = []

    serialized_user = {
        'userId': user.userId,
        'userName': user.userName,
        'age': user.age,
        'sex': user.sex
    }
    serialized_users.append(serialized_user)

    return api_response(code=200, message='success', data=serialized_users)


# 获取某用户的所有问卷
@app.route('/user_polls')
def get_polls():
    from .model import Poll

    userId = request.args.get('userId')
    polls = Poll.query.filter_by(userId=userId).all()
    serialized_polls = []

    for poll in polls:
        serialized_poll = {
            'pollId': poll.pollId,
            'description': poll.description,
            'userId': poll.userId,
            'time': poll.time
        }
        serialized_polls.append(serialized_poll)

    return api_response(code=200, message='success', data=serialized_polls)


# 获取某疾病的所有风险
@app.route('/risks')
def get_risks():
    from .model import Disease, Risk

    diseaseName = request.args.get('diseaseName')
    diseaseId = Disease.query.filter_by(
        diseaseName=diseaseName).first().diseaseId
    risks = Risk.query.filter_by(
        diseaseId=diseaseId
    ).order_by(Risk.bunch.asc()).all()
    serialized_risks = []

    for risk in risks:
        serialized_risk = {
            'diseaseName': diseaseName,
            'description': risk.description,
            'category': risk.category,
            'bunch': risk.bunch
        }
        serialized_risks.append(serialized_risk)

    return api_response(code=200, message='success', data=serialized_risks)


# 获取某疾病，同一类别的所有风险
@app.route('/bunch_risks')
def get_bunch_risks():
    from .model import Risk

    diseaseId = request.args.get('diseaseId')
    bunch = request.args.get('bunch')
    risks = Risk.query.filter_by(
        diseaseId=diseaseId, bunch=bunch
    ).all()
    serialized_risks = []

    for risk in risks:
        serialized_risk = {
            'description': risk.description,
            'category': risk.category,
            'bunch': risk.bunch
        }
        serialized_risks.append(serialized_risk)

    return api_response(code=200, message='success', data=serialized_risks)


# 获取某问卷，所有疾病单风险


@app.route('/poll_details')
def get_poll_detail():
    from .model import PollDetail, Disease

    pollId = request.args.get('pollId')
    pollDetails = PollDetail.query.filter(
        PollDetail.pollId == pollId).all()
    serialized_pollDetails = []

    for pollDetail in pollDetails:
        diseaseIName = Disease.query.filter_by(            # 疾病id
            diseaseId=pollDetail.diseaseId).first().diseaseName
        serialized_pollDetail = {
            'diseaseName': diseaseIName,
            'diseaseId': pollDetail.diseaseId,
            'riskScore': pollDetail.riskScore
        }
        serialized_pollDetails.append(serialized_pollDetail)

    return api_response(code=200, message='success', data=serialized_pollDetails)


# 获取某问卷，某疾病，所有风险
@app.route('/poll_risks')
def get_risks_detail():
    from .model import Risk, RiskDetail

    pollId = request.args.get('pollId')             # 问卷id
    diseaseId = request.args.get('diseaseId')   # 疾病名

    riskIds = RiskDetail.query.filter_by(
        diseaseId=diseaseId, pollId=pollId).with_entities(RiskDetail.riskId).all()
    riskIds_ = [item[0] for item in riskIds]
    risks = Risk.query.filter(Risk.riskId.in_(
        riskIds_)).order_by(Risk.bunch.asc()).all()
    serialized_risks = []

    for risk in risks:
        serialized_risk = {
            'description': risk.description,
            'category': risk.category,
            'rr': risk.relatedRisk,
            'bunch': risk.bunch
        }
        serialized_risks.append(serialized_risk)

    return api_response(code=200, message='success', data=serialized_risks)
