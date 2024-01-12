# views.py

from flask import jsonify, request
from .model import db
from config import Config
from sqlalchemy import func
import random
import json


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


# 插入风险数据
@app.route('/insertrisk')
def insert_risk():
    from .model import Risk, Disease

    riskName = request.args.get('riskName')
    diseaseName = request.args.get('diseaseName')
    diseaseId = Disease.query.filter_by(
        diseaseName=diseaseName).first().diseaseId

    with open(f'../data_sep/{riskName}.json', 'r', encoding='utf-8') as f:
        risks = json.load(f)
        for item in risks:
            print(item)
            risk = Risk(description=item['description'],
                        relatedRisk=item['relatedRisk'],
                        prevalence=item['prevalence'],
                        category=item['category'],
                        bunch=item['bunch'], diseaseId=diseaseId
                        )
            db.session.add(risk)
            db.session.commit()

    return api_response(code=201, message='insert success')


@app.route('/calc_lung')
def calc_lung():
    from .model import Poll, PollDetail, Risk, RiskDetail, Disease, LungProb, LungDetail
    polls = Poll.query.all()
    diseases = Disease.query.all()
    diseaseName = '肺癌'
    diseaseId = Disease.query.filter_by(
        diseaseName=diseaseName).first().diseaseId
    smokes = Risk.query.filter_by(bunch=1, diseaseId=diseaseId).all()
    for poll in polls:
        pollId = poll.pollId
        # 随机生成是否吸烟，吸烟严重程度
        randIndex = random.randint(0, len(smokes)+4)
        score = 0
        serialized_smoke = {}
        if randIndex > len(smokes)-1:
            isSmoke = 'NEVER'
            status = 'never'
        else:
            smoke = smokes[randIndex]
            riskDetailEntry = RiskDetail(
                riskId=smoke.riskId,
                diseaseId=diseaseId,
                pollId=pollId
            )
            db.session.add(riskDetailEntry)
            db.session.commit()
            score += smoke.relatedRisk
            if smoke.description.startswith('仍在吸烟'):
                status = 'current'
            else:
                status = 'former'
            if '15' in smoke.description:
                isSmoke = 'LIGHT'
            else:
                isSmoke = 'HEAVY'
            serialized_smoke = {
                'diseaseName': 'lung',
                'description': smoke.description,
                'category': smoke.category,
                'bunch': smoke.bunch,
                'relatedrisk': smoke.relatedRisk
            }
        if isSmoke == 'NEVER':
            risks = Risk.query.filter(
                Risk.diseaseId == diseaseId, Risk.bunch != 1, Risk.description.like(
                    '不吸烟%')
            ).order_by(Risk.bunch.asc()).all()
        elif isSmoke == 'LIGHT':
            risks = Risk.query.filter(
                Risk.diseaseId == diseaseId, Risk.bunch != 1, Risk.description.like(
                    '轻度吸烟%')
            ).order_by(Risk.bunch.asc()).all()
        elif isSmoke == 'HEAVY':
            risks = Risk.query.filter(
                Risk.diseaseId == diseaseId, Risk.bunch != 1, Risk.description.like(
                    '重度吸烟%')
            ).order_by(Risk.bunch.asc()).all()
        risks_size = 8
        risks_length = len(risks)
        bunch_list = []

        # 随机选几个
        rand_add_risk = random.randint(0, risks_size)
        for i in range(rand_add_risk):
            rand_entry = random.randint(0, risks_length-1)
            if risks[rand_entry].bunch in bunch_list:
                continue
            else:
                score += risks[rand_entry].relatedRisk
                bunch_list.append(risks[rand_entry].bunch)
                riskDetailEntry = RiskDetail(
                    riskId=risks[rand_entry].riskId,
                    diseaseId=diseaseId,
                    pollId=pollId
                )
                db.session.add(riskDetailEntry)
                db.session.commit()

        # 往 poll记录表里插入
        pollDetailEntry = PollDetail(
            diseaseId=diseaseId,
            pollId=pollId,
            riskScore=score/2
        )
        db.session.add(pollDetailEntry)
        db.session.commit()
        # 往 lung 记录表里插入
        probability = LungProb.query.filter_by(
            year='five', smoke=isSmoke, point=score).first().probability
        LungDetailEntry = LungDetail(
            pollId=pollId,
            status=status,
            intensity=isSmoke,
            probability=probability,
            score = score/2
        )
        db.session.add(LungDetailEntry)
        db.session.commit()

    return api_response(code=201, message='insert success', data=[{
        'score': score,
        'prob': probability
    }])


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
            if diseaseName == '肺癌':
                # smokes = Risk.query.filter_by(bunch=1).all()
                continue
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
    if user:
        serialized_users = []

        serialized_user = {
            'userId': user.userId,
            'userName': user.userName,
            'age': user.age,
            'sex': user.sex
        }
        serialized_users.append(serialized_user)

        return api_response(code=200, message='success', data=serialized_users)
    else :
        return api_response(code=404,message='该用户不在数据库中！',data=[])


# 获取某用户的所有问卷
@app.route('/user_polls')
def get_polls():
    from .model import Poll

    userId = request.args.get('userId')
    polls = Poll.query.filter_by(userId=userId).all()
    if len(polls)>0:
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
    else :
        return api_response(code=404,message='没有问卷！',data=[])


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
            'bunch': risk.bunch,
            'relatedrisk': risk.relatedRisk
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


# 获取某问卷，肺癌，概率
@app.route('/lung_details')
def get_lung_details():
    from .model import LungDetail

    pollId = request.args.get('pollId')             # 问卷id

    lungDetail = LungDetail.query.filter_by(pollId=pollId).first()
    serialized_lung_detail = {
        'status': lungDetail.status,
        'intensity': lungDetail.intensity,
        'probability': lungDetail.probability,
        'score': lungDetail.score,
    }

    return api_response(code=200, message='success', data=[serialized_lung_detail])
