# 计算饮食分数
def calc_diet_score(sex, olive_oil, green_veges, other_veges,
                    berries, fruits, processed_meat,
                    fish, chicken, cheese, butter,
                    beans, grains, dessert, nuts,
                    precooked_food, drinking):
    diet_score = 0
    if olive_oil >= 30:
        diet_score += 1
    if green_veges >= 525:
        diet_score += 1
    if other_veges >= 150:
        diet_score += 1
    if berries >= 300:
        diet_score += 1
    if fruits >= 150:
        diet_score += 1
    if processed_meat >= 0 and processed_meat <= 255:
        diet_score += 1
    if fish >= 200:
        diet_score += 1
    if chicken >= 0 and chicken <= 430:
        diet_score += 1
    if cheese >= 0 and cheese <= 120:
        diet_score += 1
    if butter >= 0 and butter <= 70:
        diet_score += 1
    if beans >= 300:
        diet_score += 1
    if grains >= 300:
        diet_score += 1
    if dessert >= 0 and dessert <= 120:
        diet_score += 1
    if nuts >= 120:
        diet_score += 1
    if precooked_food >= 0 and precooked_food <= 1:
        diet_score += 1
    if sex == 'female' and drinking == 1:
        diet_score += 1
    if sex == 'male' and (drinking == 1 or drinking == 2):
        diet_score += 1

    if diet_score >= 15:
        mepa_score = 100
    elif diet_score >= 12:
        mepa_score = 80
    elif diet_score >= 8:
        mepa_score = 50
    elif diet_score >= 4:
        mepa_score = 25
    else:
        mepa_score = 0
    return mepa_score


# 计算锻炼分数
def calc_physical_score(exercise):
    if exercise >= 150:
        physical_score = 100
    elif exercise >= 120:
        physical_score = 90
    elif exercise >= 90:
        physical_score = 80
    elif exercise >= 60:
        physical_score = 60
    elif exercise >= 30:
        physical_score = 40
    elif exercise >= 1:
        physical_score = 20
    else:
        physical_score = 0

    return physical_score


# 计算尼古丁分数
def calc_smoking_score(smoking_status, quit_year, second_smoke):
    if smoking_status == 'current':
        smoking_score = 0
    elif smoking_status == 'never':
        if second_smoke == 'yes':
            smoking_score = 80
        else:
            smoking_score = 100
    else:
        if quit_year >= 5:
            if second_smoke == 'yes':
                smoking_score = 55
            else:
                smoking_score = 75
        elif quit_year >= 1:
            if second_smoke == 'yes':
                smoking_score = 50
            else:
                smoking_score = 30
        elif quit_year >= 0 and quit_year <= 1:
            if second_smoke == 'yes':
                smoking_score = 5
            else:
                smoking_score = 25

    return smoking_score


# 计算睡眠分数
def calc_sleep_score(sleep):
    print(type(sleep))
    if sleep >= 10:
        sleep_score = 40
    elif sleep >= 9:
        sleep_score = 90
    elif sleep >= 7:
        sleep_score = 100
    elif sleep >= 6:
        sleep_score = 70
    elif sleep >= 5:
        sleep = 40
    elif sleep >= 4:
        sleep_score = 20
    else:
        sleep_score = 0
    return sleep_score


# 计算 BMI 分数
def calc_bmi_score(bmi):
    if bmi >= 40:
        bmi_score = 0
    elif bmi >= 35:
        bmi_score = 15
    elif bmi >= 30:
        bmi_score = 30
    elif bmi >= 25:
        bmi_score = 70
    else:
        bmi_score = 100

    return bmi_score


# 血脂单位换算
def convert_cholesterol(cholesterol):
    return cholesterol*0.02586


# 计算血脂分数
def calc_lipids_score(cholesterol, lipid_drug):
    if cholesterol > 70:
        cholesterol = convert_cholesterol(cholesterol)
    if cholesterol >= 5.69:
        cholesterol_score = 0
    elif cholesterol >= 4.91:
        cholesterol_score = 20
    elif cholesterol >= 4.14:
        cholesterol_score = 40
    elif cholesterol >= 3.37:
        cholesterol_score = 60
    else:
        cholesterol_score = 100

    if lipid_drug == 'yes':
        cholesterol_score -= 20

    if cholesterol_score >= 0:
        return cholesterol_score
    else:
        return 0


# 血糖单位换算
def convert_FBG(FBG):
    return FBG/18


# 计算血糖分数
def calc_glucose_score(FBG, HbA1C, diabetes):
    if diabetes == 'no':
        if FBG > 50:
            FBG = convert_FBG(FBG)
        if FBG >= 5.5 or HbA1C >= 5.7:
            glucose_score = 60
        else:
            glucose_score = 100
    if diabetes == 'insulin' or diabetes == 'tablet' or diabetes == 'diet':
        if HbA1C >= 10:
            glucose_score = 0
        elif HbA1C >= 9:
            glucose_score = 10
        elif HbA1C >= 8:
            glucose_score = 20
        elif HbA1C >= 7:
            glucose_score = 30
        else:
            glucose_score = 40

    return glucose_score


# 计算血压分数
def calc_bp_score(systolic_bp, diastolic_bp, bp_drug):
    if systolic_bp >= 160 or diastolic_bp >= 100:
        bp_score = 0
    elif systolic_bp >= 140 or diastolic_bp >= 90:
        bp_score = 25
    elif systolic_bp >= 130 or diastolic_bp >= 80:
        bp_score = 50
    elif systolic_bp >= 120:
        bp_score = 75
    else:
        bp_score = 100

    if bp_drug == 'yes':
        bp_score -= 20

    if bp_score >= 0:
        return bp_score
    else:
        return 0


# 计算心血管分数
def card_score(card_feature):
    print(card_feature)
    mepa_score = calc_diet_score(sex=card_feature['sex'],
                                 olive_oil=card_feature['olive_oil'],
                                 green_veges=card_feature['green_veges'],
                                 other_veges=card_feature['other_veges'],
                                 berries=card_feature['berries'],
                                 fruits=card_feature['fruits'],
                                 processed_meat=card_feature['processed_meat'],
                                 fish=card_feature['fish'],
                                 chicken=card_feature['chicken'],
                                 cheese=card_feature['cheese'],
                                 butter=card_feature['butter'],
                                 beans=card_feature['beans'],
                                 grains=card_feature['grains'],
                                 dessert=card_feature['dessert'],
                                 nuts=card_feature['nuts'],
                                 precooked_food=card_feature['precooked_food'],
                                 drinking=card_feature['drinking']
                                 )
    physical_score = calc_physical_score(exercise=card_feature['exercise'])
    nichotine_score = calc_smoking_score(smoking_status=card_feature['smoking_status'],
                                         quit_year=card_feature['quit_year'],
                                         second_smoke=card_feature['second_smoke'])
    sleep_score = calc_sleep_score(sleep=card_feature['sleep'])
    bmi_score = calc_bmi_score(bmi=card_feature['bmi'])
    cholesterol_score = calc_lipids_score(
        cholesterol=card_feature['cholesterol'], lipid_drug=card_feature['lipid_drug'])
    glucose_score = calc_glucose_score(
        FBG=card_feature['FBG'], HbA1C=card_feature['HbA1C'], diabetes=card_feature['diabetes'])
    bp_score = calc_bp_score(
        systolic_bp=card_feature['systolic_bp'], diastolic_bp=card_feature['diastolic_bp'], bp_drug=card_feature['bp_drug'])
    avg_score = (mepa_score+physical_score+nichotine_score+sleep_score +
                 bmi_score+cholesterol_score+glucose_score+bp_score)/8
    print(mepa_score, physical_score, nichotine_score,
          sleep_score, bmi_score, cholesterol_score, glucose_score, bp_score)

    return mepa_score, physical_score, nichotine_score, sleep_score, bmi_score, cholesterol_score, glucose_score, bp_score, avg_score
