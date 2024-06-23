<template>
  <div
    class="flex flex-wrap justify-evenly divide-y-4 divide-gray-700 divide-double"
  >
    <div class="mt-3 mb-1 w-4/5 flex flex-wrap justify-start">
      <SvgIcon
        :iconName="props.iconName"
        :class="[
          'fill-gray-700 w-6 h-6 rounded-full ring-2 ring-offset-2',
          props.bg,
          props.ring,
        ]"
      ></SvgIcon>
      <div class="font-semibold text-gray-700 text-lg px-4">{{ name }}</div>
    </div>
    <!-- 吃 -->
    <div class="w-4/5 h-cinquantedeux overflow-auto" v-if="name === '健康饮食'">
      <div class="font-semibold text-gray-700 py-1">通过饮食实现日常健康</div>
      <div class="text-gray-600 py-1 text-sm">
        健康的饮食和生活方式是您对抗心血管疾病的最佳武器。请记住，最重要的是您选择的整体模式。让健康饮食成为您日常生活的一部分，从而为您的健康和心脏带来长期益处。
      </div>
      <div class="font-semibold text-gray-700 py-1">为健康制定计划</div>
      <div class="text-gray-600 py-1 text-sm">
        健康饮食需要计划，但稍加考虑就能让生活更美好。少吃垃圾食品，多吃原生食品。我们建议您每天从每个基本食物类别中摄取多种营养丰富的食物。为了获得所需的营养，应多选择蔬菜、水果、富含纤维的全麦面包和谷物以及脱脂或低脂乳制品等食物。
      </div>
      <div class="font-semibold text-gray-700 py-1">了解健康饮食</div>
      <div class="text-gray-600 py-1 text-sm">
        健康饮食有五个可衡量的组成部分。为了预防心脏病和中风，您应该采用整体健康的饮食模式，包括①水果和蔬菜;②每周200g的鱼（最好是油性鱼）;
        ③富含纤维的全谷物; ④每天少于 15克的钠，以及⑤限制添加糖或含糖饮料的摄入。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        您所吃的食物（以及数量）会影响其他可控的健康因素：胆固醇、血压、糖尿病和体重。为了保持健康的体重，饮食要与运动量相协调，这样摄入多少卡路里，就能消耗多少卡路里。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        选择营养丰富的食物--含有维生素、矿物质、纤维和其他营养物质，但热量较低--而不是营养不良的食物。
      </div>
      <div class="font-semibold text-gray-700 py-1">水果和蔬菜</div>
      <div class="text-gray-600 py-1 text-sm">
        所有水果和蔬菜都含有维生素、矿物质和其他营养物质，有助于预防心脏病、癌症和其他疾病。摄入各种营养素的最佳方法是多吃不同颜色的水果和蔬菜。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        远离水果饮料或果汁，以及添加糖的罐装和冷冻水果。
      </div>
      <div class="font-semibold text-gray-700 py-1">鱼类</div>
      <div class="text-gray-600 py-1 text-sm">
        鲑鱼、鲭鱼、鲱鱼、湖鳟鱼、沙丁鱼和长鳍金枪鱼等肥鱼富含两种欧米伽-3
        脂肪酸：二十碳五烯酸 (EPA) 和二十二碳六烯酸
        (DHA)，这两种脂肪酸对减少心脏病有明显的益处。
      </div>
      <div class="font-semibold text-gray-700 py-1">肉类之外...</div>
      <div class="text-gray-600 py-1 text-sm">
        我们还建议食用豆腐和其他形式的大豆、菜籽、核桃和亚麻籽及其油。这些食物含有另一种欧米伽-3
        脂肪酸--α-亚麻酸（ALA）。
      </div>
      <div class="font-semibold text-gray-700 py-1">钠</div>
      <div class="text-gray-600 py-1 text-sm">
        烹饪时，应选择少盐或无盐的食材。要降低血压，每天的钠摄入量应不超过
        24克。最好将每日摄入量降至 15克，因为这样可以进一步降低血压。
      </div>
      <div class="font-semibold text-gray-700 py-1">脂肪</div>
      <div class="text-gray-600 py-1 text-sm">
        饱和脂肪应占每天总热量的 7% 以下（举例来说，如果您每天需要约 2,000
        卡路里，那么饱和脂肪应不超过 140 卡路里。也就是每天大约摄入 16
        克饱和脂肪）。对于需要降低胆固醇的人来说，饱和脂肪应减少到不超过总热量的
        5%至 6%。对于每天摄入 2,000 卡路里的人来说，饱和脂肪约为 13 克。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        选择去皮的瘦肉和家禽，在烹饪时不要添加饱和脂肪和反式脂肪。选择无脂、1%
        脂肪和低脂奶制品。将午餐肉或其他加工熟食限制在每周两份(250g)以下。尽量每周摄入四份(120g)或更多的坚果、豆类和种子。
      </div>
    </div>
    <!-- 动 -->
    <div class="w-4/5 h-cinquantedeux overflow-auto" v-if="name === '适量运动'">
      <div class="font-semibold text-gray-700 py-1">积极锻炼</div>
      <div class="text-gray-600 py-1 text-sm">
        近 80%
        的美国成年人没有参加他们需要的体育锻炼，尽管我们知道这很重要。活跃的生活是您能送给自己和所爱之人的最有价值的礼物之一。简而言之，每天进行体育锻炼可以延长寿命，提高生活质量。如果您每周至少进行五次
        30
        分钟的适度体育锻炼（如快步走），您几乎可以保证自己过上更健康、更满意的生活，同时降低患心脏病、中风和糖尿病的风险。家长们，你们的孩子每天都需要
        60
        分钟的活动时间。当您积极参加体育锻炼时，您也在为下一代树立健康生活的榜样。
      </div>
      <div class="font-semibold text-gray-700 py-1">建议的体育锻炼</div>
      <div class="text-gray-600 py-1 text-sm">
        所有成年人每周至少应进行 150 分钟（2 小时 30
        分钟）的体育锻炼，包括中等强度的活动或每周至少 75 分钟的剧烈活动。<span
          class="font-semibold"
          >成年人每周还应至少两天进行增强肌肉和骨骼的活动。</span
        >
      </div>
      <div class="text-gray-600 py-1 text-sm">
        如果您是一名残疾成年人，您应该向您的医疗保健提供者咨询适合您能力的体育活动量和类型。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        有规律的体育锻炼所带来的益处与体重无关，对整体健康和体能至关重要。有一些体育锻炼总比没有好。最好的体育锻炼是能够让人乐于经常进行的活动。
      </div>
    </div>
    <!-- 烟 -->
    <div class="w-4/5 h-cinquantedeux overflow-auto" v-if="name === '不要吸烟'">
      <div class="font-semibold text-gray-700 py-1">无烟生活</div>
      <div class="text-gray-600 py-1 text-sm">
        戒烟对健康的益处几乎是立竿见影的，在戒烟后的几年内，您患中风和冠状动脉疾病的风险与非吸烟者相似。吸烟者罹患多种慢性疾病的风险较高，包括动脉粥样硬化--动脉中脂肪物质的堆积--可导致冠心病和中风。控制或逆转动脉粥样硬化是预防未来心脏病发作或中风的重要一环。
      </div>
      <div class="font-semibold text-gray-700 py-1">吸烟与健康</div>
      <div class="text-gray-600 py-1 text-sm">
        在美国，吸烟是导致过早死亡的最重要的可预防原因。吸烟者罹患心血管疾病的风险很高。吸烟者患心脏病的风险是不吸烟者的两到四倍。吸烟也是冠心病患者心源性猝死的一个强大的独立风险因素；吸烟者的风险大约是不吸烟者的两倍。吸烟还与其他风险因素共同作用，大大增加了冠心病的风险。抽雪茄或烟斗的人似乎死于冠心病（可能还有中风）的风险更高，但他们的风险没有吸烟者那么大。即使是不吸烟的人，接触他人的烟雾也会增加患心脏病的风险。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        戒烟并不容易。事实上，很多人说这就像失去了最好的朋友。但是，从吸烟者到非吸烟者，只要一个改变，就会对您未来的健康产生巨大的影响。好消息是，现在戒烟还为时不晚。戒烟后，你的心脏会感谢你，所以不要再浪费时间了。
      </div>
    </div>
    <!-- 睡 -->
    <div class="w-4/5 h-cinquantedeux overflow-auto" v-if="name === '充足睡眠'">
      <div class="text-gray-600 py-1 text-sm">
        每晚所需的优质睡眠时间各不相同，但一般来说，成年人应保证 7 到 9
        小时的睡眠时间。影响所需睡眠时间的因素包括年龄、怀孕、早育或更年期。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        睡眠时，整个免疫、神经、骨骼和肌肉系统都在进行关键的处理、恢复和强化。优质睡眠还能改善情绪、记忆力和推理能力。
      </div>
      <div class="font-semibold text-gray-700 py-1">什么是优质睡眠？</div>
      <div class="text-gray-600 py-1 text-sm">
        它是持续的、足够长的、能恢复精力的睡眠。理想情况下，您应该经历所有五个睡眠阶段的多个周期。这些阶段从昏昏欲睡开始，经过深度睡眠直至快速眼动期（即快速动眼期）--此时大脑最活跃，您会做梦。快速眼动期会影响学习和记忆。在床上翻来覆去睡
        12 个小时还不如不间断地睡 7 个小时。
      </div>
      <div class="font-semibold text-gray-700 py-1">
        您会在周末等特定日子里挤出更多睡眠时间吗？
      </div>
      <div class="text-gray-600 py-1 text-sm">
        这可能弊大于利。睡眠不规律的人会增加患严重健康问题的风险。
      </div>
      <div class="font-semibold text-gray-700 py-1">有睡眠问题？</div>
      <div class="text-gray-600 py-1 text-sm">
        小小的行为改变就能帮助您睡个好觉。如果您的睡眠问题持续存在，请去看专业医生，以排除呼吸或健康问题。
      </div>
    </div>
    <!-- 重 -->
    <div class="w-4/5 h-cinquantedeux overflow-auto" v-if="name === '控制体重'">
      <div class="font-semibold text-gray-700 py-1">减轻体重，获得健康</div>
      <div class="text-gray-600 py-1 text-sm">
        人体由水、脂肪、蛋白质、碳水化合物以及各种维生素和矿物质组成。如果脂肪过多，尤其是腰部脂肪过多，就会增加患高血压、高胆固醇和糖尿病等健康问题的风险。这会增加患心脏病和中风的风险。
      </div>
      <div class="font-semibold text-gray-700 py-1">从最简单的开始</div>
      <div class="text-gray-600 py-1 text-sm">
        如果您超重或肥胖，您可以通过成功减肥并保持体重来降低患心脏病和中风的风险。只需减轻
        5-10斤，就能显著降低血压。首先要了解根据您的年龄、性别和运动量，建议您摄入多少卡路里。然后跟踪你的卡路里摄入量--你会了解到很多关于你的习惯的信息。将您摄入的食物热量与您的运动量所消耗的能量热量进行比较。这是一个平衡摄入卡路里和消耗卡路里的问题，要学会制定相应的计划。
      </div>
      <div class="font-semibold text-gray-700 py-1">了解 体重指数(BMI)</div>
      <div class="text-gray-600 py-1 text-sm">
        BMI 是 "身体质量指数
        "的缩写，是一个评估体重相对于身高的公式。它是衡量身体组成的一个有用的间接指标，因为在大多数人身上，它与体脂高度相关。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        BMI 是衡量成年男性和女性体重健康与否的良好指标，与体型大小无关。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        - BMI在 25 以下被认为是健康的
      </div>
      <div class="text-gray-600 py-1 text-sm">
        - BMI超过 25 会显著增加健康风险
      </div>
      <div class="text-gray-600 py-1 text-sm">
        - 超重的定义是BMI在 25.0 至 30.0 之间。BMI约为 25 kg/㎡
        相当于超出理想体重约 10%。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        - 肥胖的定义是BMI大于或等于 30.0，或超重约
        25斤或更多。极度肥胖是指BMI达到或超过 40。
      </div>
      <div class="font-semibold text-gray-700 py-1">了解健康体重</div>
      <div class="text-gray-600 py-1 text-sm">
        超重不利于健康。它会增加患心脏病、中风、糖尿病、高血压和高血脂的风险。体重指数达到或超过
        25（超重或肥胖）的人，即使没有其他风险因素，也更有可能罹患心血管疾病。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        如果身体脂肪过多，尤其是腰部脂肪过多，心脏出现问题的风险就会更高。过重的体重会增加心脏的工作量。它还会升高血压、血胆固醇和甘油三酯水平，降低高密度脂蛋白（好）胆固醇水平。体重过重还可能导致糖尿病。减轻
        10 斤体重就能降低患心脏病的风险。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        减肥的最佳方法是将健康饮食和定期体育锻炼正确地结合起来。这意味着消耗的热量要多于摄入的热量。设定一个目标，争取每周至少减掉一斤（消耗的热量比摄入的热量多
        3500
        卡路里）。这听起来似乎不多，但随着时间的推移，足以降低血压和血胆固醇，并有助于控制血糖水平。关键是要养成健康的生活习惯，这将有助于你终生保持体重。
      </div>
    </div>
    <!-- 脂 -->
    <div class="w-4/5 h-cinquantedeux overflow-auto" v-if="name === '控制血脂'">
      <div class="font-semibold text-gray-700 py-1">了解胆固醇</div>
      <div class="text-gray-600 py-1 text-sm">
        当您控制胆固醇时，您就给了动脉保持畅通的最佳机会。胆固醇是一种蜡状物质，我们的身体用它来制造细胞膜和某些激素，但如果坏胆固醇（低密度脂蛋白）过高，它就会与白细胞结合，在静脉和动脉中形成斑块。这些堵塞物会导致心脏病和中风。
      </div>
      <div class="font-semibold text-gray-700 py-1">改善胆固醇水平</div>
      <div class="text-gray-600 py-1 text-sm">
        血液中约 75% 的胆固醇是由肝脏和人体细胞制造的。另外 25%
        来自食物。控制胆固醇水平是保持心脏健康的关键。您可以采取以下措施：食用胆固醇、反式脂肪和饱和脂肪含量低且纤维含量高的健康食品；安排胆固醇筛查，保持健康检查的及时性；锻炼身体，提高身体制造好胆固醇的能力；保持健康的体重。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        随着血液中胆固醇的升高，冠心病和中风的风险也会增加。如果存在其他风险因素（如高血压和吸烟），这种风险会进一步增加。一个人的胆固醇水平还受年龄、性别、遗传和饮食的影响。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        如果您有高血脂，保持健康的生活方式非常重要。控制高血压，避免吸烟。健康饮食。经常参加体育锻炼。保持健康的体重。控制或延缓糖尿病的发生。遵医嘱服药。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        采取这些措施有助于降低罹患心脏病和中风的风险。如果您仍然需要药物来降低血液中的胆固醇，那么健康的饮食和积极的生活方式将有助于降低您的胆固醇，改善您的整体心血管健康状况。
      </div>
    </div>
    <!-- 糖 -->
    <div class="w-4/5 h-cinquantedeux overflow-auto" v-if="name === '控制血糖'">
      <div class="font-semibold text-gray-700 py-1">了解血糖</div>
      <div class="text-gray-600 py-1 text-sm">
        如果您的空腹血糖水平低于
        6.1(mmol/dL)，说明您的血糖处于健康范围。否则，您的结果可能表明您患有糖尿病或糖尿病前期。我们吃下的大部分食物都会转化为葡萄糖（或血糖），供身体用作能量。您的身体会分泌一种叫做胰岛素的激素，它就像一个载体，将食物中的能量带入您的细胞。
      </div>
      <div class="font-semibold text-gray-700 py-1">改善血糖</div>
      <div class="text-gray-600 py-1 text-sm">
        当发现糖尿病或糖尿病前期时，医生可能会开出改变饮食习惯、控制体重、运动计划和药物的处方，以控制血糖。糖尿病患者定期体检至关重要。与您的医疗保健提供者密切合作，控制您的糖尿病，并控制任何其他风险因素。您可以采取以下措施：减少汽水、糖果和含糖甜点的摄入量；进行中等强度的有氧运动，以帮助身体对胰岛素做出反应；服用药物或胰岛素（如果有处方）。
      </div>
      <div class="font-semibold text-gray-700 py-1">血糖与您的健康</div>
      <div class="text-gray-600 py-1 text-sm">
        糖尿病是心脏病发作的主要风险因素。如果您患有糖尿病，请务必与您的医疗保健提供者合作控制糖尿病，并尽可能控制其他风险因素。2
        型糖尿病是最常见的糖尿病。从历史上看，被诊断为 2
        型糖尿病的主要是中年人。但如今，青少年和年轻成年人患 2
        型糖尿病的速度惊人。这与这一人群肥胖和缺乏运动的发病率不断上升有关，而肥胖和缺乏运动都是
        2 型糖尿病的危险因素。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        糖尿病如不及时治疗，会导致许多严重的医疗问题，包括心脏病和中风。因此，了解糖尿病的症状和风险因素，并采取适当措施预防和治疗胰岛素抵抗和糖尿病非常重要。
      </div>
      <div class="text-gray-600 py-1 text-sm">
        您可以通过以下方法控制血糖水平：达到并保持健康的体重、遵循健康的饮食计划、定期进行体育锻炼、以及按照医生的处方服药。
      </div>
    </div>
    <!-- 压 -->
    <div class="w-4/5 h-cinquantedeux overflow-auto" v-if="name === '控制血压'">
      <div class="font-semibold text-gray-700 py-1">了解高血压</div>
      <div class="text-gray-600 py-1 text-sm">
        高血压是一种疾病。尽管它通常没有任何症状，但如果不加以治疗，高血压会对健康造成致命的影响。约有
        1.03
        亿美国成年人患有高血压，其中许多人并不知道自己患有高血压，也没有典型的症状。
      </div>
      <div class="font-semibold text-gray-700 py-1">改善高血压</div>
      <div class="text-gray-600 py-1 text-sm">
        高血压是可以控制的。无论您的血压是高还是正常（正常是指收缩压小于 120
        mmHg，舒张压小于 80 mmHg或小于
        120/80）。为了心血管的健康，我们需要调整生活方式，以下是您可以采取的措施：食用有益心脏健康的低钠饮食；定期参加体育锻炼；保持健康的体重；限制饮酒和避免吸烟。
      </div>
      <div class="font-semibold text-gray-700 py-1">血压与健康</div>
      <div class="text-gray-600 py-1 text-sm">
        高血压会给您的身体带来额外的负担，尤其是心脏、血管和肾脏。它会增加中风、心脏病发作、肾衰竭和心力衰竭的风险。高血压会增加心脏的工作负荷，导致心肌变厚、变硬。当高血压与肥胖、吸烟、高血脂或糖尿病同时存在时，心脏病发作或中风的风险会增加数倍。您可以通过减肥、增加体育锻炼、限制钠摄入量、限制饮酒量、不吸烟和服用医生处方的药物来帮助降低血压。
      </div>
    </div>
  </div>
</template>

<script setup>
const props = defineProps({
  iconName: String,
  bg: String,
  ring: String,
  name: String,
});
</script>
