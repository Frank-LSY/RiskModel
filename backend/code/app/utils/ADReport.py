from reportlab.pdfgen import canvas
from reportlab.lib.units import inch
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, PageTemplate, Frame, Paragraph
from reportlab.lib import colors
from reportlab.pdfbase import pdfmetrics   # 注册字体
from reportlab.pdfbase.ttfonts import TTFont # 字体类
from reportlab.platypus import Table, SimpleDocTemplate, Paragraph, Image  # 报告内容相关类
from reportlab.lib.pagesizes import letter  # 页面的标志尺寸(8.5*inch, 11*inch)
from reportlab.lib.styles import getSampleStyleSheet  # 文本样式
from reportlab.graphics.charts.barcharts import VerticalBarChart  # 图表类
from reportlab.graphics.charts.legends import Legend  # 图例类
from reportlab.graphics.shapes import Drawing  # 绘图工具
from reportlab.lib.units import cm  # 单位：cm
import matplotlib.pyplot as plt
import pandas as pd
from math import pi
import os

class ADReportGenerator:
    def __init__(self):
        #字体包录入
        pdfmetrics.registerFont(TTFont('SimHei', 'SimHei.ttf'))
        # pdfmetrics.registerFont(TTFont('YaHei', './Yahei.ttf'))
        # pdfmetrics.registerFont(TTFont('YaHeiBold', './YaheiBold.ttf'))
        
        self.page_width = 612
        self.page_height = 792
        self.title_font = "SimHei"
        self.content_font = "SimHei"
        self.info_size = 15
        self.title_size = 30
        self.content_size = 20
        self.blue_color = colors.HexColor('#e5f2fe')

        self.df = pd.DataFrame({
                'group': ['A'],
                '时间定向力': [4],
                '地点定向力': [5],
                '物品名回忆': [1],
                '计算能力': [3],
                '记忆能力': [5],
                '常识基础': [1]
        })
        self.area_id = "相城区"
        self.title_text = "AD筛查报告"

        self.subtitle_text_12 = "影像所见"
        self.subtitle_text_13 = "初步印象"
        self.subtitle_text_14 = "眼底成像"
        self.subtitle_text_11 = "基本信息"

        self.subtitle_text_21 = "基本信息"
        self.subtitle_text_22 = "AD综合分析 (共19/30分)"
        self.subtitle_text_23 = "AD总体结果"
        self.subtitle_text_24 = "综合建议"

        self.chart_data_1= [["时间定向力", "4分"],
                        ["地点定向力", "5分"],
                        ["物品名回忆", "1分"],
                        ["计算能力", "3分"],
                        ["记忆能力", "5分"],
                        ["常识基础", "1分"]]
        self.chart_data_2 = [["认知功能", "认知功能障碍"],
                        ["认知功能障碍", "中等"]]
        self.info_name = "周五"
        self.info_gender = "男"
        self.info_age = "63周岁"
        self.info_id = "2024030801"
        self.info_date = "2024.04.15"
        self.info_test = "MMSE测试"
        self.info_category = "精神病科"

        self.info_left = "OD(右眼)"
        self.info_right = "OS(左眼)"

        self.sugg_text = "多参加室外活动，四周后复查。"

        self.diag_right = "糖尿病视网膜病变"
        self.diag_left = "高血压视网膜病变"

        self.impress_right = "无"
        self.impress_left = "无"

        self.doctor_name = "Zane"
    
        self.title_text_width = pdfmetrics.stringWidth(self.title_text, self.title_font, self.title_size)

    # 网格虚拟操作，后期删除
    def _draw_grid(self, pdf_canvas, grid_size):
        pdf_canvas.setStrokeColorRGB(0, 0, 0)  # 设置网格线颜色为黑色
        for x in range(0, int(self.page_wid), grid_size):
            pdf_canvas.line(x, 0, x, self.page_hei)
        for y in range(0, int(self.page_hei), grid_size):
            pdf_canvas.line(0, y, self.page_wid, y)
    
    # 绘制雷达图
    def _gen_radar_chart(self, dataframe, filename):
        # 中文包
        plt.rcParams['font.family']=['SimHei']
        plt.rcParams['font.sans-serif'] = ['SimHei']

        # 变量类别
        categories = list(dataframe)[1:]
        # 变量类别个数
        N = len(categories)

        # 绘制数据的第一行
        values = dataframe.loc[0].drop('group').values.flatten().tolist()
        # 将第一个值放到最后，以封闭图形
        values += values[:1]

        # 设置每个点的角度值，六边形需要六个角度
        angles = [n / float(N) * 2 * pi + pi/6 for n in range(N)]
        angles += angles[:1]

        # 初始化极坐标网格 设为透明
        ax = plt.subplot(111, polar=True, frameon = False)
        ax.grid(False)

        # 设置x轴的标签
        plt.xticks(angles[:-1], categories, color='black', size=15, rotation = 50)

        # 设置标签显示位置12345
        ax.set_rlabel_position(0)

        # 设置y轴的标签
        plt.yticks([])
        
        ax.plot(angles, values, linewidth=1, linestyle='solid', color='blue')

        # 添加数据标签
        for i in range(len(angles)-1):
            angle_mid = angles[i]
            plt.text(angle_mid, values[i]+0.3, str(values[i]), color='blue', ha='center')

        for i in range(N):
            for j in range(1, 6):
                ax.plot([angles[i], angles[(i+1)%N]], [j, j], color='grey', linewidth=1, alpha=0.1)

        for i in range(N):
            ax.plot([angles[i], angles[(i+1)%N]], [0, 5], color='grey', linewidth=1, alpha=0.1)

        for i in range(N):
            for j in range(1,5):
                if j % 2 == 0:
                    a = [angles[i], angles[(i+1)%N], angles[(i+1)%N], angles[i]]
                    b = [j-1, j-1, j ,j]
                    ax.fill(a,b,'grey', alpha=0.3)

        #标签与x轴轴距
        ax.tick_params(axis='x', pad=25)

        plt.savefig(filename, format='png', dpi=100, bbox_inches='tight', pad_inches=0.1)
        plt.close()
    
    # 在宽度中间的位置绘制标题
    def _draw_centered_width_string(self, pdf_canvas, text, font_name, font_size, need_height):
        pdfmetrics.registerFont(TTFont(font_name, f"{font_name}.ttf"))
        pdf_canvas.setFont(font_name, font_size)
        
        text_width = pdfmetrics.stringWidth(text, font_name, font_size)

        # 计算字符串在页面中的位置
        x = (self.page_width - text_width) / 2
        pdf_canvas.drawString(x, need_height, text)
    
    # 在绘制标题后面绘制附属序号
    def _draw_title_subscript_string(self, pdf_canvas, text, font_size, title_text_width, page_wid, need_height):
        pdfmetrics.registerFont(TTFont(font_name, f"{font_name}.ttf"))
        pdf_canvas.setFont(font_name, font_size)
        
        text_width = pdfmetrics.stringWidth(text, font_name, font_size)
        
        # 计算字符串在页面中的位置
        x = title_text_width/2 + self.page_width/2 +20
        
        pdf_canvas.drawString(x, need_height, text)
    
    # 竖向关键字表格
    def _draw_table_vertical(self, c, table_data, col_widths, row_heights, x, y):
        # 定义表格数据和样式
        table = Table(table_data, colWidths=col_widths, rowHeights=row_heights)
        custom_color = colors.HexColor('#e5f2fe')

        table_style = TableStyle([('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                                  ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
                                  ('FONTNAME', (0, 0), (-1, -1),'SimHei'),
                                  ('BACKGROUND', (0, 0), (0, -1), custom_color),
                                  ('GRID', (0, 0), (-1, -1), 1, 'lightgrey')])
        table.setStyle(table_style)
        table.wrapOn(c, 0, 0)
        # 将表格绘制到 Canvas 上
        table.drawOn(c, x, y)
    
    # 横向关键字表格
    def _draw_table_horizon(self, c, table_data, col_widths, row_heights, x, y):
        # 定义表格数据和样式
        table = Table(table_data, colWidths=col_widths, rowHeights=row_heights)
        custom_color = colors.HexColor('#e5f2fe')

        table_style = TableStyle([('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                                  ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
                                  ('FONTNAME', (0, 0), (-1, -1),'SimHei'),
                                  ('BACKGROUND', (0, 0), (-1, 0), custom_color),
                                  ('GRID', (0, 0), (-1, -1), 1, 'lightgrey')])
        table.setStyle(table_style)
        table.wrapOn(c, 0, 0)
        # 将表格绘制到 Canvas 上
        table.drawOn(c, x, y)
    
    # 绘制副标题
    def _draw_sub_title(self, pdf_canvas, text, font_name, font_size, height, font_color):
        pdfmetrics.registerFont(TTFont(font_name, f"{font_name}.ttf"))
        pdf_canvas.setFont(font_name, font_size)
        pdf_canvas.setFillColor(font_color)  # 设置字体颜色
        text_width = pdfmetrics.stringWidth(text, font_name, font_size)
        pdf_canvas.drawString(50, height, text)
    
    # 绘制蓝色正方形
    def _draw_blue_square(self, c, x, y, size):
        blue_color = colors.HexColor('#e5f2fe')  # 自定义的蓝色
        c.setFillColor(blue_color)
        c.setStrokeColor(blue_color)  # 设置边框颜色为透明
        c.rect(x, y, size, size, fill=1)
        #c.setStrokeColor(blue_color)  # 设置边框颜色为透明

    # 绘制基本信息内容
    def _draw_info(self, pdf_canvas, text, font_name, font_size, width, height, font_color):
        pdfmetrics.registerFont(TTFont(font_name, f"{font_name}.ttf"))
        pdf_canvas.setFont(font_name, font_size)
        pdf_canvas.setFillColor(font_color)  # 设置字体颜色
        text_width = pdfmetrics.stringWidth(text, font_name, font_size)
        pdf_canvas.drawString(width, height, text)
    
    # 绘制canvas
    def generate_report(self, output_file, save_path):
        # 创建一个Canvas对象
        file_path = os.path.join(save_path, output_file)
        pdf = canvas.Canvas(file_path)

        # 执行绘制操作
        # 雷达图
        self._gen_radar_chart(self.df, 'radar_chart.png')

        #AD报告
        self._draw_centered_width_string(pdf, self.title_text, self.title_font, self.title_size, self.page_height)

        #绘制 基本信息
        self._draw_blue_square(pdf, 25, 750, 20)
        self._draw_sub_title(pdf, self.subtitle_text_21, self.content_font, self.content_size, 750, 'black')
        self._draw_info(pdf,"检查单号："+self.info_id, self.content_font, self.info_size, 50, 710, 'black')
        self._draw_info(pdf,"姓名："+self.info_name, self.content_font, self.info_size, 50, 680, 'black')
        self._draw_info(pdf,"测试项目："+self.info_test, self.content_font, self.info_size, 50, 650, 'black')
        self._draw_info(pdf,"性别："+self.info_gender, self.content_font, self.info_size, 250, 680, 'black')
        self._draw_info(pdf,"申请科室："+self.info_category, self.content_font, self.info_size, 250, 650, 'black')
        self._draw_info(pdf,"年龄："+self.info_age, self.content_font, self.info_size, 400, 680, 'black')
        self._draw_info(pdf,"检查日期："+self.info_date, self.content_font, self.info_size, 400, 650, 'black')

        #绘制 眼底成像
        self._draw_blue_square(pdf, 25, 600, 20)
        self._draw_sub_title(pdf, self.subtitle_text_14, self.content_font, self.content_size, 600, 'black')
        self._draw_info(pdf, self.info_right, self.content_font, self.info_size, 130, 570, font_color='black')
        self._draw_info(pdf, self.info_left, self.content_font, self.info_size, 400, 570, 'black')
        # pdf.drawImage('righteye.png', 70, 380, width=180, height=180)
        # pdf.drawImage('lefteye.png', 350, 380, width=180, height=180)

        #绘制 影像所见
        self._draw_blue_square(pdf, 25, 320, 20)
        self._draw_sub_title(pdf,self.subtitle_text_12, self.content_font, self.content_size, 320, 'black')
        self._draw_info(pdf, "右眼："+self.diag_right, self.content_font, self.info_size, 50, 290, 'black')
        self._draw_info(pdf, "左眼："+self.diag_left, self.content_font, self.info_size, 50, 270, 'black')
            
        #绘制 初步印象
        self._draw_blue_square(pdf, 25, 220, 20)
        self._draw_sub_title(pdf, self.subtitle_text_13, self.content_font, self.content_size, 220, 'black')
        self._draw_info(pdf, "右眼："+self.impress_right, self.content_font, self.info_size, 50, 190, 'black')
        self._draw_info(pdf, "左眼："+self.impress_left, self.content_font, self.info_size, 50, 170, 'black')

        # 新的一页
        pdf.showPage()

        #绘制 综合分析 chart1 radar
        self._draw_blue_square(pdf, 25, 750, 20)
        self._draw_sub_title(pdf, self.subtitle_text_22, self.content_font, self.content_size, 750, 'black')
            #chart1
        self._draw_table_vertical(pdf, self.chart_data_1, 75, 40, 50, 490)
            #雷达图
        pdf.drawImage('radar_chart.png', 250, 460, width=300, height=280)

        #绘制 总体结果 chart2
        self._draw_blue_square(pdf, 25, 430, 20)
        self._draw_sub_title(pdf, self.subtitle_text_23, self.content_font, self.content_size, 430, 'black')
            #chart2
        self._draw_table_horizon(pdf, self.chart_data_2, 250, 50, 50, 310)

        #绘制 综合建议
        self._draw_blue_square(pdf, 25, 270, 20)
        self._draw_sub_title(pdf, self.subtitle_text_24, self.content_font, self.content_size, 270, 'black')
        self._draw_info(pdf, self.sugg_text, self.content_font, self.info_size, 50, 230, 'black')

        #结尾 医生签字 日期
        self._draw_info(pdf,"医生签字："+self.doctor_name, self.content_font, self.info_size, 430, 80, 'black')
        self._draw_info(pdf,"日期："+self.info_date, self.content_font, self.info_size, 430, 50, 'black')
        
        # 结束绘制
        pdf.save()

        return file_path


if __name__ == '__main__':
    # 实例化类
    report_generator = ADReportGenerator()
    # 生成报告
    pdf_file_path = report_generator.generate_report("AD筛查报告.pdf", "./")
