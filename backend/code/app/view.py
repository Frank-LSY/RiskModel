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
                        category=item['category'],
                        bunch=item['bunch'], diseaseId=diseaseId
                        )
            db.session.add(risk)
            db.session.commit()

    return api_response(code=201, message='insert success')


# 插入肝癌评分
@app.route('/insertliver')
def insert_liver():
    from .model import LiverProb

    with open('../data_sep/liver_score_prob.json', 'r', encoding='utf-8') as f:
        risks = json.load(f)
        for item in risks:
            print(item)
            liverprob = LiverProb(model=item['model'],
                                  score=item['score'],
                                  year=item['year'],
                                  probability=item['probability'],
                                  )
            db.session.add(liverprob)
            db.session.commit()

    return api_response(code=201, message='insert success')


# 插入假人数据
@app.route('/poll_feature')
def poll_feature():
    from .model import Poll, PollFeature

    with open('../data_sep/poll.json', 'r', encoding='utf-8') as f:
        polls = json.load(f)
        for item in polls:
            print(item)
            pollid = Poll.query.filter_by(
                userId=item["userId"]).first().pollId
            poll = PollFeature(
                pollId=pollid,
                age=item['age'],
                sex=item['sex'],
                smoking_status=item['smoking_status'],
                smoking_yearly=item['smoking_yearly'],
                smoking_daily=item['smoking_daily'],
                bmi=item['bmi'],
                lung_cancer_history=item['lung_cancer_history'],
                personal_cancer_history=item['personal_cancer_history'],
                AFP=item['AFP'],
                MMEF=item['MMEF'],
                CEA=item['CEA'],
                CRP=item['CRP'],
                drinking=item['drinking'],
                exercise=item['exercise'],
                diabetes=item['diabetes'],
                AST=item['AST'],
                ALT=item['ALT'],
                HBV=item['HBV'],
                HCV=item['HCV']

            )
            db.session.add(poll)
            db.session.commit()

    return api_response(code=201, message='insert success')


# 插入心血管假数据
@app.route('/card_features')
def card_features():
    from .model import Poll, CardFeature

    with open('../data_sep/card.json', 'r', encoding='utf-8') as f:
        polls = json.load(f)
        for item in polls:
            print(item)
            pollid = Poll.query.filter_by(
                userId=item["userId"]).first().pollId
            poll = CardFeature(
                pollId=pollid,
                age=item['age'],
                sex=item['sex'],
                olive_oil=item['olive_oil'],
                green_veges=item['green_veges'],
                other_veges=item['other_veges'],
                berries=item['berries'],
                fruits=item['fruits'],
                processed_meat=item['processed_meat'],
                fish=item['fish'],
                chicken=item['chicken'],
                cheese=item['cheese'],
                butter=item['butter'],
                beans=item['beans'],
                grains=item['grains'],
                dessert=item['dessert'],
                nuts=item['nuts'],
                precooked_food=item['precooked_food'],
                drinking=item['drinking'],
                exercise=item['exercise'],
                smoking_status=item['smoking_status'],
                quit_year=item['quit_year'],
                second_smoke=item['second_smoke'],
                sleep=item['sleep'],
                bmi=item['bmi'],
                cholesterol=item['cholesterol'],
                HDL=item['HDL'],
                systolic_bp=item['systolic_bp'],
                diastolic_bp=item['diastolic_bp'],
                FBG=item['FBG'],
                HbA1C=item['HbA1C']

            )
            db.session.add(poll)
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
            score=score/2
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
        }
        serialized_users.append(serialized_user)

        return api_response(code=200, message='success', data=serialized_users)
    else:
        return api_response(code=404, message='该用户不在数据库中！', data=[])


# 获取某用户的所有问卷
@app.route('/user_polls')
def get_polls():
    from .model import Poll

    userId = request.args.get('userId')
    polls = Poll.query.filter_by(userId=userId).all()
    if len(polls) > 0:
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
    else:
        return api_response(code=404, message='没有问卷！', data=[])


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


# 计算某问卷，心血管疾病分数
@app.route('/card_score')
def card_score():
    from .model import CardFeature
    from .calculator.card import card_score

    pollId = request.args.get('pollId')             # 问卷id
    print('from web: ', pollId)
    cardPoll = CardFeature.query.filter_by(pollId=pollId).first()
    serialized_card_poll = {
        'pollId': pollId,
        'age': cardPoll.age,
        'sex': cardPoll.sex,
        'olive_oil': cardPoll.olive_oil,
        'green_veges': cardPoll.green_veges,
        'other_veges': cardPoll.other_veges,
        'berries': cardPoll.berries,
        'fruits': cardPoll.fruits,
        'processed_meat': cardPoll.processed_meat,
        'fish': cardPoll.fish,
        'chicken': cardPoll.chicken,
        'cheese': cardPoll.cheese,
        'butter': cardPoll.butter,
        'beans': cardPoll.beans,
        'grains': cardPoll.grains,
        'dessert': cardPoll.dessert,
        'nuts': cardPoll.nuts,
        'precooked_food': cardPoll.precooked_food,
        'drinking': cardPoll.drinking,
        'exercise': cardPoll.exercise,
        'smoking_status': cardPoll.smoking_status,
        'quit_year': cardPoll.quit_year,
        'second_smoke': cardPoll.second_smoke,
        'sleep': cardPoll.sleep,
        'bmi': cardPoll.bmi,
        'cholesterol': cardPoll.cholesterol,
        'HDL': cardPoll.HDL,
        'lipid_drug': cardPoll.lipid_drug,
        'systolic_bp': cardPoll.systolic_bp,
        'diastolic_bp': cardPoll.diastolic_bp,
        'bp_drug': cardPoll.bp_drug,
        'FBG': cardPoll.FBG,
        'HbA1C': cardPoll.HbA1C,
        'diabetes': cardPoll.diabetes
    }

    mepa_score, physical_score, nichotine_score, sleep_score, bmi_score, cholesterol_score, glucose_score, bp_score, avg_score = card_score(
        serialized_card_poll)
    return api_response(code=200, message='success', data=[{
        'ori_data': serialized_card_poll,
        'mepa_score': mepa_score,
        'physical_score': physical_score,
        'nichotine_score': nichotine_score,
        'sleep_score': sleep_score,
        'bmi_score': bmi_score,
        'cholesterol_score': cholesterol_score,
        'glucose_score': glucose_score,
        'bp_score': bp_score,
        'avg_score': avg_score
    }])
