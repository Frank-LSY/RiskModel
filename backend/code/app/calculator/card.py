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
    print(sleep)
    if sleep >= 0 and sleep < 4:
        sleep_score = 0
    elif sleep >= 4 and sleep < 5:
        sleep_score = 20
    elif sleep >= 5 and sleep < 6:
        sleep_score = 40
    elif sleep >= 6 and sleep < 7:
        sleep_score = 70
    elif sleep >= 7 and sleep < 9:
        sleep = 100
    elif sleep >= 9 and sleep < 10:
        sleep_score = 90
    elif sleep >= 10:
        sleep_score = 40
    print(sleep_score)
    return sleep_score


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
    print(mepa_score, physical_score, nichotine_score, sleep_score)

    return mepa_score, physical_score, nichotine_score, sleep_score
