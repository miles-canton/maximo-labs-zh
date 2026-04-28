#  视觉检查

视觉检查模型(资产分析师)

!!! note
    按照此流程演示如何创建和使用上面 Monitor 部分中的 MVI 模型。

沉淀池需要持续监控真菌生长或其他不需要的碎片。操作员使用 Maximo Visual Inspection 检查储罐。摄像头将全天候 24 小时张贴在储罐周围,节省操作员每小时检查储罐的时间。
 
演示:我是设施的资产分析师,被分配开发可以识别脏污储罐的模型。开发的模型需要高度准确,因为它们将使用 IBM Maximo 集成到我们的资产管理解决方案中。


## 创建数据集


资产分析师必须创建数据集以聚合储罐图像并标记表示脏污和清洁储罐的数据。首先,我们需要通过上传图像数据集并标记或分类数据集中的图像来教模型它正在寻找什么。示例图像可以在 [Box 文件夹](https://ibm.box.com/s/y5eh9l2t38fkddk856y96zfz0jc3ke0q)中找到,但数据集已经加载。<br> 

1. 使用以下 [URL](https://gtmdemo.visualinspection.mviwwdemo.gtm-pat.com/#/) 访问 Maximo Visual Inspection
![setup assets](img/MVI00016.png)
2. 点击 `Get Started`,您应该看到数据集页面。在此演示中,我们将向您展示如何创建模型以自动检查沉淀池清洁度。我们已经预先上传了一个包含图像的数据集。
![setup assets](img/MVI00017.png)
3. 在搜索栏中输入 `tank` 以筛选此数据集。
4. 点击 `Tank 1 Training` 图像以打开数据集。
![setup assets](img/MVI0002.png)
5. 选择 `Select Files`,然后选择 `All` 以选择所有图像。
6. 点击 `Label`,然后点击 `Objects`。这是训练数据集,用于教模型识别 `clean` 与 `dirty` 储罐。图像中可能有多个储罐,因此我们将创建一个对象检测模型,在其中我们可以标记图像中的多个对象。图像已经被标记。
![setup assets](img/MVI0003.png)
7. 从左侧显示的图像中选择一个 `clean tank` 图像。
8. 选择 `clean`,选择 `draw box` 图标,并在表示 `clean tank` 的图像部分周围 `draw a box`。这将使用表示 `clean tank` 的部分注释图像。
![setup assets](img/MVI00018.png)
9. 选择一个图像以查看如何在图像中标记对象。标签 `clean` 和 `dirty` 已经创建,如右侧所示。如果需要另一个标签,您将点击 `add label`。
10. 使用 `dirty` 和 `clean` 储罐重复标记所有图像
![setup assets](img/MVI0005.png)
11. 根据需要选择 `dirty` 或 `clean`,选择 `Box and draw` 在表示正确储罐的图像部分周围绘制一个框。
12. 使用面包屑返回 `Tank 1 Training`。
13. 选择所有图像并点击 `Augment Data`。您现在已经标记了 15 张图像(14 张清洁和 7 张脏污)。要训练高精度的深度学习模型,数据集应该具有各种各样和大量的图像。MVI 提供了通过应用多个滤镜来增强初始图像的能力。
![setup assets](img/MVI0006.png)
14. 选择滤镜 `Sharpen`、`Crop`、`Rotate`、`Vertical` 和 `Horizontal` 翻转以生成 255 张额外图像。
![setup assets](img/MVI0007.png)
15. 您可以点击 `cancel` 并导航到已创建的 `augmented dataset`。
![setup assets](img/MVI00022.png)

图像增强可防止模型过度拟合上传的少数图像,并可以提高模型的准确性。此功能降低了资产分析师的数据采集和标记成本。请注意,注释也会在增强图像上继承。

1. 导航到名为 `Tank 1 Augmented – DO NOT DELETE` 的新数据集,并使用对象上的筛选器,识别 270 张图像、252 张标记有清洁储罐的图像和 126 张脏污储罐的图像。您的数据集可能以不同的顺序显示。
![setup assets](img/MVI0008.png)


## 训练模型

我们准备训练模型。
1. 点击标记为 `Train Model` 的按钮。
2. 选择 `Object detection`,确保选择了 `Faster R-CNN`。通常您会点击训练模型 - 模型已经创建,因此显示名为 `DO NOT DELETE: OBJECT DETECTION MODEL FOR TANKS` 的模型
![setup assets](img/MVI0010.png)

!!! note
    警告:如果您点击 `Train model` 按钮,完成训练将需要 30 分钟。

MVI 提供了解决用例所需的几种类型的模型。有图像分类来分类整个图像,对象检测模型来识别图像中的一个或多个对象,以及动作检测模型来检测动作。对于此用例,参考框架中可能有多个储罐,因此我们将训练对象检测模型。对于演示,显示演示系统中已经预训练的模型。

1. 从左侧导航栏中选择 `Models`。
![setup assets](img/MVI0011.png)
2. 使用搜索栏查找 `DO NOT DELETE:  OBJECT DETECTION MODEL FOR TANKS` 模型
![setup assets](img/MVI0012.png)
![setup assets](img/MVI0013.png)

作为资产分析师,我可以查看训练模型的特征。点击训练模型以查看模型指标,如准确度、mAP、精确度、召回率、IoU、损失图和混淆矩阵。验证部署的模型。

1. 从部署页面点击模型。
![setup assets](img/MVI0030.png)
2. 从左侧导航栏中选择"Deployed models"。
![setup assets](img/MVI0031.png)
3. 使用搜索栏查找"DO NOT DELETE:  OBJECT DETECTION MODEL FOR TANKS"模型
![setup assets](img/MVI0032.png)
4. 访问 [box 文件夹](https://ibm.box.com/s/ozscdc8xp6fuh7z2ndxhjunx8fk0aznh)上的验证图像
5. 从 `clean` 文件夹下载图像。
![setup assets](img/MVI0033.png)
![setup assets](img/MVI0034.png)
6. 拖放图像以进行验证。使用经过验证的模型,您可以在 Maximo Monitor 中构建仪表板,该仪表板将显示来自实时摄像头馈送的储罐检查结果,如上面 Monitor 部分所示。
![setup assets](img/MVI0035.png)
![setup assets](img/MVI0036.png)
![setup assets](img/MVI0037.png)


## 部署模型

现在,我将把它交给资产管理员,他可以部署模型以在 MVI Edge 上运行自动视觉检查。作为设施的资产检查员,被分配监控设施的脏污储罐。我已将模型从 MVI 训练服务器部署到 MVI Edge。MVI Edge 连接到检查设施中储罐的多个摄像头。从 MVI Edge 仪表板,我可以跟踪实时检查,并在需要时发送服务请求。


## 设置规则

1. 使用电子邮件中的登录信息,使用 [URL](https://mvie811v2-visualinspection-edge.mvi-wwdemo-d0ef7f39d9cfcd50dc3b8ae064f7a945-0000.us-south.containers.appdomain.cloud/#/login) 访问 `Maximo Visual Inspection Edge`。您将找到在此 `MVI Edge` 上运行的所有检查的仪表板。
![setup assets](img/MVIE001.png)
2. 点击 `Tank 1`
3. 点击 `Configuration`
![setup assets](img/MVIE0011.png)
4. 在 MVI 训练服务器中创建的项目与数据集和模型一起部署在 `MVI Edge` 中。
![setup assets](img/MVIE002.png)

!!! note
    在进行演示之前,请检查检查结果中是否有图像。如果没有,则:

        1. 使用 `Enabled` 切换禁用检查。
    
        2. 向下滚动到 `edit input source`。
    
        3. 点击 `Processed` 旁边的刷新图标。
    
        4. 然后返回并使用"Disabled"切换启用检查。

5. 向下滚动到 `Rules` 部分。
![setup assets](img/MVIE003.png)
6. 点击 `Settings` 下的图标。
![setup assets](img/MVIE0031.png)
![setup assets](img/MVIE004.png)

## 设置警报

资产检查员可以根据推理结果创建规则。在这种情况下,如果推理结果是置信度分数大于 .8 阈值的 `clean` 储罐,则资产检查员可以将推理检查标记为通过。另一个规则在模型发现脏污储罐时将检查设置为失败。

1. 向下滚动以查看 `Alert type`。我们可以看到资产检查员可以通过 MQTT 使用 `Maximo Monitor settings` 或通过 Twilio 发送警报。我们在这里看到 MQTT 将检查结果发送到 Maximo Monitor,我们之前看到过。
![setup assets](img/MVIE005.png)
2. 点击 `Cancel` 退出弹出窗口。我们可以选择我们的 `input source`,连接 `image folder`、`video` 或 `camera`。在我们的情况下,我们连接到 `image folder`。
![setup assets](img/MVIE0051.png)
3. 滚动回顶部并点击"Images"选项卡以查看来自输入源的检查结果。
4. 点击图像。
![setup assets](img/MVIE006.png)

## 查看结果
我们在这里看到来自此输入源的所有推理结果。通过有绿色复选标记,失败的脏污储罐检查有红色 X。如果模型不确定结果,也可能有黄色问号。我们还看到三角形中的感叹号,表示特定的检查结果已通过 MQTT 发送到 Maximo Monitor。

1. 使用 [URL](https://gtmdemo.visualinspection.mviwwdemo.gtm-pat.com/#/) 导航回 `Maximo Visual Inspection` 核心。
2. 从左侧导航中选择 `Projects`。
![setup assets](img/MVIE007.png) 
3. 点击名为 `World Wide Demo – DO NOT DELETE` 的沉淀池项目
![setup assets](img/MVIE0071.png) 


## 总结
您已经看到使用 MVI 项目创建 AI 模型视觉检查是多么容易,包括训练数据集、检查结果数据集和模型。`MAS Visual Inspection for Business Users` 包括适用于深度学习技术技能有限的任何人的工具和界面。这种经过验证的集成技术解决方案可扩展实时缺陷检测,允许从检查中发出警报功能,并优化制造工作流程,使其在行业中与其他产品区分开来。
