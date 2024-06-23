import uuid
from datetime import datetime
import json
from db_config import db
from database import db, Poll, Disease, Risk, PollDetail, RiskDetail, Config



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
