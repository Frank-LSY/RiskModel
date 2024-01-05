from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import pymysql
import uuid
from datetime import datetime
import json

from database import db, Poll, Disease, Risk, PollDetail, RiskDetail, Config

app = Flask(__name__)

# # 读取配置
# app.config.from_object(Config)
# # 创建数据库sqlalchemy工具对象
# db = SQLAlchemy(app)


if __name__ == '__main__':
    with app.app_context():
        disease = Disease.query.all()
        print(disease)