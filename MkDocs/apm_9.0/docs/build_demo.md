# 构建 MAS Health 和 Predict 演示

按照本实验中的步骤在您自己的环境中创建必要的组件,以交付 Maximo Application Suite (MAS) v9 Health 和 
Predict 演示脚本。系统的数据可以由讲师提供,您也可以为某些练习创建自己的资产。

1. 登录 MAS 应用程序
2. 设置 Health 资产权限
3. 设置默认 Health 资产状况评分
4. 创建资产
5. 设置 Health 评分组
6. 创建评分组
7. 创建评分类型
8. 使用自定义评分方法创建组
9. 创建自定义矩阵
10. 为变电站变压器规划更换计划模板
11. 创建投资项目

为了跟踪您创建的项目,请在名称末尾附加您的首字母缩写,以便它们易于查找和删除。

**先决条件**

本实验需要以下条件:

- 一个正常工作的 MAS 环境,包含 Maximo Manage 或其他企业资产管理 (EAM) 
系统、Maximo Health、Maximo Health and Predict、IBM Maximo Models for Electrical Distribution 和 Maximo Optimizer。
- 足够的资产数据来运行分析并获得洞察
- 具有 `Health` 应用程序访问权限的用户 ID。
- 具有站点访问权限的用户 ID。否则您将收到警告 `此用户无权访问任何站点。访问 ASSET 对象需要站点访问权限`

##  登录 MAS 应用程序

在 `应用程序` 选项卡上启动 `Health`。如果 `应用程序` 选项卡上没有 `Health` 磁贴,请让您的 MAS 管理员启用它。

1. 使用讲师提供的凭据登录后,导航到
2. 从 MAS 主页面,选择 `应用程序` 选项卡
![navigate_to_health](img/hpu_8.11/health1.png)
3. 点击 `Manage`、`Health` 或 `Predict` 磁贴上的 `启动` 链接。要在下一个练习中设置权限,您将转到 Manage。
4. 这将显示资产网格页面,其中包含用户当前分配站点的资产表及其健康评分。
![assets_page](img/hpu_8.11/assets_grid_page.png)

**注意:如果用户未分配到站点,他们将看不到任何资产。** 

## 在 Manage 中设置 Health 资产权限
<a name="setup-health-asset-permissions"></a>

为了允许用户在 Health 资产详细信息页面的 `操作` 按钮上 `编辑源记录`,您必须首先使用以下步骤在 Manage 中配置 Health 应用程序安全组。

1. 转到 Manage 应用程序。
![assets_page](img/hpu_8.11/select_manage.png)
2. 选择 `安全组` 应用程序。
![assets_page](img/hpu_8.11/select_security_groups.png)
3. 搜索 `HEALTH` 组并按 `回车` 键。
![assets_page](img/hpu_8.11/search_health_group.png)
4. 点击 `应用程序` 选项卡。
5. 选择 `资产`
![assets_page](img/hpu_8.11/click_applications_assets.png)
6. 点击 `为应用程序授予列出的选项`
7. 启用资产操作选项
![assets_page](img/hpu_8.11/turn_on_options.png)
8. 点击 `保存组`。
![assets_page](img/hpu_8.11/confirmation_save.png)
9. 返回 `Health` 应用程序并使用该用户登录以确保操作现在可行。

## 设置默认 Health 资产状况评分
<a name="default_score"></a>

Maximo Health v9 包含为所有不属于评分组的资产自动激活资产状况评分的功能。激活默认资产状况评分后,您创建的任何新资产也将使用开箱即用的默认评分组来计算 Health 风险和关键性的资产状况。已经属于评分组的资产将被跳过。

观看[默认资产状况评分视频](https://mediacenter.ibm.com/media/1_2k8jqivj)

### 激活默认评分

在本练习中,您启用 `默认评分`。

1. 首次登录 IBM Maximo 后,系统会提醒您启用 `默认评分`。
2. 按 `激活` 按钮以启用默认评分。
![default_scores_form](img/default_scores_form.png)
3. 确保您已创建资产并设置了所需的依赖项。资产优先级、针对资产设置的工单或服务请求。基于制造商的资产安装日期和资产预期寿命。
4. 您也可以选择 `稍后激活评分`。转到 `设置组` 和 `组` 选项卡以找到 `Default_Score` 组来启用它。
5. 检查组以查看默认评分是否已激活。您将看到为所有资产计算的 Health、风险和关键性。
![default_scores_group](img/defaultscores_activated.png)

资产评分将开始使用 `Default_Score` 组进行计算。您还可以通过使用 `资产表列表` 页面查看资产来验证评分是否正常工作。如果 Health、风险和关键性评分没有出现,可能是因为缺少计算所需的数据。您可以在 `资产表列表` 页面中批量更新缺失的安装日期数据,只需点击列和行资产值并在弹出对话框中输入信息即可。您还可以在 `资产详细信息` 页面上查看 `Health`、`风险` 和 `关键性` 的资产状况评分。

## 创建资产
<a name="create_asset"></a>

在本练习中,您将在 IBM Maximo Manage 中创建一个资产。您稍后将使用此资产来测量其平均故障间隔时间,并查看其值与使用图表的其他资产相比的表现如何。

为了计算平均故障间隔时间评分,您还需要创建一个计划外紧急工单。让我们首先创建资产,然后创建工单。

要为平均故障间隔时间评分创建示例资产,请确保输入以下资产字段:

- 资产编号: "AH016"
- 描述: "潜水泵 20 马力旋转式"
- 资产类型: "泵"
- 状态: 活动
- 安装日期: 6/1/20
- 预期寿命: 10(例如,制造商建议寿命 - 20%)
- 供应商: Armstrong
- 制造商: Armstrong

1. 登录 IBM Maximo。打开 IBM Maximo Application Suite。
- 打开您的 Web 浏览器并导航到 IBM Maximo 登录页面。
- 输入您的 `用户名` 和 `密码` 以登录。
- 在 `应用程序` 选项卡上启动 `Manage`。如果 `应用程序` 选项卡上没有 `Manage` 磁贴,请让您的 MAS 管理员为您的用户 ID 启用它。

2. 导航到 `资产` 模块。选择 `资产` 模块。从 Maximo 主菜单中,选择 `资产 > 资产`。

3. 创建新资产:

- 打开 `新资产` 表单。在 `资产` 模块中,点击 `新资产` 按钮以打开 `资产创建` 表单。

4. 填写资产详细信息:

- 输入 `资产编号`。在 `资产编号` 字段中,输入资产的唯一标识符(例如,AH016)。
- 输入 `描述`。在 `描述` 字段中,输入资产的详细描述(例如,潜水泵 20 马力旋转式)。
- 选择 `资产类型`。找到 `资产类型` 字段并从下拉菜单中选择适当的类型(例如,泵)。
- 输入 `安装日期`。输入资产安装的 `日期`。使用日期选择器选择日期(例如,2024-05-21)。
- 输入 `供应商信息`。在 `供应商` 字段中,输入购买资产的供应商名称(例如,西门子)。
- 输入 `制造商信息`。在 `制造商` 字段中,输入资产制造商的名称(例如,ABB)。
- 输入 `预期寿命` (年)。在 `预期寿命` 字段中,输入资产的预期运行寿命(年)(例如,20)。

5. 保存 `资产`。填写完所有必填字段后,点击 `保存` 按钮以在 Maximo 中创建资产记录。

- 点击 `保存` 以存储新资产记录。

6. 将资产状态选择为 `活动`:

- 从左侧的 `常用操作` 菜单中,找到 `状态` 菜单以启动状态表单。
![change_asset_status](img/change_asset_status.png)
- 从 `新状态` 下拉菜单中选择 `活动` 并点击 `保存` 按钮。
![change_asset_status](img/change_asset_status.png)

##  设置 Health 评分组
<a name="setup_health_score_group"></a>

首次登录 Health 应用程序时,会显示所有托管资产的通用表列表视图。

此视图和其他视图中显示的评分是从左侧导航栏的 `评分设置` 部分创建的。

1. 将鼠标悬停在左侧导航栏上以展开它。选择左侧导航栏上的 `评分设置` 部分
![setup_settings menu](img/score_settings.png)	

2. 通过选择具有相似行为的资产来创建评分组。`组` 绑定到 `资产查询`。

如果已经创建了任何评分组,它们将出现在 `评分设置` 页面的 `组` 选项卡上。

3. 滚动浏览页面以查看已创建的组。
![setup_assets](img/HPU_8.9/HPU 5.png)

在 Maximo Health 中有两种创建资产状况评分的方法。第一种方法是使用 [Maximo 公式引擎]( )。第二种方法是使用 Watson Studio 自定义 Maximo Health 或加速器中提供的 Jupyter notebook 模板。每个资产类别都有自己的 notebook 模板。请参阅<a href="https://www.ibm.com/docs/en/mhmpmh-and-p-u/continuous-delivery?topic=cm-asset-class-notebooks-in-maximo-health-predict-utilities">文档</a>以获取 IBM 提供的资产类别列表。您可以使用扩展名为 `.cfg` 的文本文件配置 `评分设置`,以指定如何计算资产 Health、风险和关键性。

或者,可以直接在 UI 中从头开始创建评分方法。


### 创建评分组

要为变电站变压器创建评分组,请点击 `创建评分和 DGA 组` 按钮,并完成表单。

1. 点击 `创建评分组 +` 按钮。
![setup_assets](img/create_score_group.png)
2. 完成 `名称` 和 `描述` 的开放字段。
3. 选择 `资产` 单选按钮以标识 `对象`。
4. 选择 `将组连接到 notebook` 单选按钮以响应 `配置评分和 DGA 方式`。
5. 点击 `选择` 以选择 notebook。
![setup_assets](img/HPU_8.9/HPU 7.png)
6. 出现提示时,滚动并选择 `IBM Transformers Tap Changers DGA 6.0.1`。
7. 点击 `使用 notebook`。
![setup_assets](img/HPU_8.9/HPU 8.png)


### 选择查询

要确定将 notebook 或公式引擎设置应用于哪些资产,您必须选择资产查询。在这种情况下,选择变电站变压器。

1. 点击 `选择` 以选择查询。
![setup_assets](img/HPU_8.9/HPU 9.png)
2. 出现提示时,滚动并选择 `EUORG1_EUDEMO_ST`
3. 点击 `应用`
![setup_assets](img/HPU_8.9/HPU 10.png)
4. 点击 `创建`
![setup_assets](img/HPU_8.9/HPU 11.png)

### 激活评分

创建后,将显示该组。下一步是从 notebook 激活每个评分方法。

1. 从顶部开始依次点击每个评分。
![setup_assets](img/HPU_8.9/HPU 12.png)
2. 在每个 `评分` 屏幕上,查看评分方法,然后选择 `活动`。
![setup_assets](img/HPU_8.9/HPU 13.png)
3. 使用面包屑导航返回 `评分组` 页面。
4. 确保所有评分都是 `活动` 的。
![setup_assets](img/HPU_8.9/HPU 14.png)


## 创建评分类型
<a name="create-score-type"></a>

要创建自己的资产状况评分,您可以使用 UI 中的自定义评分,通过点击页面顶部的面包屑导航返回 `评分设置` 页面。

选择页面上的 `评分类型` 选项卡以创建新的评分类型。现有评分类型将显示在页面上。

1. 点击页面顶部的 `评分设置` 面包屑导航。
![setup_assets](img/HPU_8.9/HPU 15.png)
2. 选择 `评分类型` 选项卡。
![setup_assets](img/HPU_8.9/HPU 18.png)
3. 点击 `创建新评分类型` 按钮。
![setup_assets](img/HPU_8.9/HPU 19.png)

### 创建新评分类型

完成新自定义评分类型的表单。评分类型可以使用新范围、颜色和图标进行自定义。

1. 完成 `名称` 和 `描述` 的开放字段。
2. 将其余字段保留为默认值。
3. 点击 `保存`。<br/>
![setup_assets](img/HPU_8.9/HPU 20.png)
4. 返回 `组` 选项卡以设置自定义评分方法。选择 `组` 选项卡。


## 使用 Notebook 创建使用自定义评分的组
<a name="create-group-custom-score"></a>

### 创建评分组

按照使用 notebook 的类似步骤为变电站变压器创建自定义评分方法,在这种情况下,作为效率的代理。

1. 点击 `创建评分和 DGA 组` 按钮。
![setup_assets](img/HPU_8.9/HPU 6.png)
2. 完成 `名称` 和 `描述` 的开放字段。
3. 选择 `资产` 单选按钮以标识 `对象`。
4. 选择 `构建评分` 单选按钮以响应 `配置评分和 DGA 方式`。
5. 点击 `选择` 以选择查询。
![setup_assets](img/HPU_8.9/HPU 16.png)
6. 出现提示时,滚动并选择 `EUORG1_EUDEMO_ST`。
7. 点击 `应用`。
![setup_assets](img/HPU_8.9/HPU 10.png)
8. 点击 `创建`。<br/>
![setup_assets](img/HPU_8.9/HPU 11.png)

### 添加评分类型

创建后,将显示该组。下一步是创建自定义评分方法本身。

添加评分类型时,将显示现有评分类型,包括刚刚创建的变电站效率。

1. 点击 `添加评分` 按钮。
![setup_assets](img/HPU_8.9/HPU 22.png)
2. 从评分选项中选择 `变电站效率`。
3. 点击 `完成`。
![setup_assets](img/HPU_8.9/HPU 23.png)

### 添加贡献者

从变电站效率评分页面,可以使用各种贡献者、公式或组构建自定义评分方法。

1. 点击页面贡献者部分中的 `+`。
![setup_assets](img/HPU_8.9/HPU 24.png)
2. 从 `添加贡献者` 弹出窗口中,选择 `FACAGESAMPLE` 磁贴。
3. 点击 `添加`。
![setup_assets](img/HPU_8.9/HPU 25.png)

### 添加贡献者权重

在此示例中,仅使用一个贡献者,但通常会有多个贡献者。因此,必须为每个贡献者分配权重。在这种情况下为 100%。

**价值:** 使用任何可用数据创建自定义评分的能力允许用户考虑独特的运营环境和条件。

1. 点击 `铅笔` 图标。<br/>
![setup_assets](img/HPU_8.9/HPU 26.png)
2. 在弹出窗口中,将 % 权重更改为 `100`。
3. 点击 `保存`。
![setup_assets](img/HPU_8.9/HPU 27.png)
4. 将 `活动` 按钮更改为 `是`。<br/>
![setup_assets](img/HPU_8.9/HPU 28.png)


## 创建自定义矩阵
<a name="create-group-custom-score"></a>

### 查看矩阵

现在评分方法已构建并激活,评分将出现在多个视图中。

要在矩阵中使用自定义评分,必须创建自定义矩阵。

1. 将鼠标悬停在左侧导航栏上以展开它。
![setup_assets](img/HPU_8.9/HPU 29.png)
2. 选择左侧导航栏上的 `资产` 部分以返回表视图。
3. 点击 `矩阵` 图标以移动到矩阵视图。
![setup_assets](img/HPU_8.9/HPU 44.png)

## 配置矩阵
<a name="create-group-custom-score"></a>

要自定义矩阵,请点击屏幕右上角的 `设置图标`。调整字段,使 Health 显示在 y 轴上,变电站变压器效率显示在 x 轴上。

1. 点击 `齿轮` 符号。<br/>
![setup_assets](img/HPU_8.9/HPU 45.png)
2. 在 `名称` 字段中,输入 `变电站效率和健康`。
3. 在 `Y 轴` 字段中,选择 `变电站效率`。
4. 在 `Y 轴方向` 下选择 `100-0` 单选按钮。
5. 在 `X 轴` 字段中,选择 `健康`。
6. 在 `X 轴方向` 下选择 `100-0` 单选按钮。
![setup_assets](img/HPU_8.9/HPU 46.png)

此外,填充矩阵的颜色,使健康状况不佳和效率低下的资产在右上角显示为红色或 `高`。

1. 点击 `高` 单选按钮。<br/>
![setup_assets](img/HPU_8.9/HPU 47.png)
2. 在矩阵中,点击右上角的框将其变为红色。
![setup_assets](img/HPU_8.9/HPU 48.png)
3. 继续使用 `中` 和 `低` 完成矩阵视图以匹配示例。
![setup_assets](img/HPU_8.9/HPU 49.png)
4. 点击 `另存为` 以保存矩阵并将其设置为默认值。
![setup_assets](img/HPU_8.9/HPU 50.png)


## 为变电站变压器创建更换计划模板
<a name="create-group-custom-score"></a>

### 更换计划模板

矩阵提供了一个很好的视图,可以从中为投资项目选择资产。但是,必须为项目中的任何资产类别完成计划模板。要设置计划模板,请转到资产投资优化器选项卡。

1. 将鼠标悬停在左侧导航栏上以展开它。
2. 选择左侧导航栏上的 `资产投资优化器` 部分。
![setup_assets](img/HPU_8.9/HPU 55.png)
3. 点击 `计划模板` 选项卡。
![setup_assets](img/HPU_8.9/HPU 56.png)
4. 在 `计划模板` 选项卡上,点击 `+` 符号以创建新的计划模板。
![setup_assets](img/HPU_8.9/HPU 57.png)

### 创建资产更换模板

完成更换计划模板的表单。

1. 从选择列表中选择 `SUBSTATION_TRANSFORMER` 或其他资产类别。**注意:如果资产类别已经存在更换计划模板,则无法创建新模板**
2. 在开放字段中,输入 `变电站变压器的示例更换计划模板`
3. 为 `计划类型` 选择 `更换`。
4. 为 `预期停机时间(小时)` 输入 `8`。
5. 为 `估计资本成本` 输入 `50000`。
6. 为 `估计运营成本` 输入 `30000`。
7. 为 `估计故障成本` 输入 `150000`。
8. 为 `预期寿命(年)` 输入 `30`。
9. 点击 `创建`。
![setup_assets](img/HPU_8.9/HPU 58.png)
10. 将鼠标悬停在左侧导航栏上以展开它。
11. 选择左侧导航栏上的 `资产` 部分以返回矩阵视图。
![setup_assets](img/HPU_8.9/HPU 29.png)


## 创建投资项目
<a name="create-group-custom-score"></a>

### 分配资产

要从矩阵页面将一组变电站变压器分配给投资项目,请过滤资产,然后 `向下钻取` 到表视图并将资产添加到项目中。

1. 使用下拉菜单,从列表中选择 `变电站变压器(共享)`。
![setup_assets](img/HPU_8.9/HPU 51.png)
2. 选择矩阵中的 `红色` 框以显示资产的表视图。
![setup_assets](img/HPU_8.9/HPU 52.png)
3. 从表视图中,从表底部的下拉菜单中选择 `50`。
4. 选择页面顶部的 `框` 以选择表上的所有资产。
![setup_assets](img/HPU_8.9/HPU 53.png)
5. 选择 `创建投资项目`。
![setup_assets](img/HPU_8.9/HPU 54.png)

### 创建项目

完成 `创建项目页面` 上的表单。

1. 在开放字段中,输入 `ST 演示项目`。
2. 在摘要字段中,输入 `变电站变压器的演示项目`。
3. 为 `持续时间(年)` 输入 `25`。
4. 为 `目标开始季度` 选择 `2Q`。
5. 为 `目标开始年份` 输入 `2023`。
6. 点击 `创建`
![setup_assets](img/HPU_8.9/HPU 59.png)
7. 一旦出现 `ST 演示项目` 页面,将鼠标悬停在左侧导航栏上以展开它。
8. 选择左侧导航栏上的 `资产` 部分以返回矩阵视图以向项目添加更多资产。<br/>
![setup_assets](img/HPU_8.9/HPU 29.png)

### 从矩阵添加资产

从矩阵视图中,再次 `向下钻取` 到表视图并将其他资产添加到项目中。

1. 选择矩阵中间顶行的 `黄色` 框以显示资产的表视图。
![setup_assets](img/HPU_8.9/HPU 60.png)
2. 从表视图中,从表底部的下拉菜单中选择 `50`。
3. 选择页面顶部的 `框` 以选择表上的所有资产。
![setup_assets](img/HPU_8.9/HPU 61.png)
4. 选择 `添加到投资项目`。
![setup_assets](img/HPU_8.9/HPU 62.png)

从弹出窗口中,选择 ST 演示项目以将新的资产集添加到现有项目中。

1. 从项目集中选择 `ST 演示项目`。
![setup_assets](img/HPU_8.9/HPU 63.png)
2. 点击 `添加`
3. 从 `编辑项目` 页面,点击 `保存`。
![setup_assets](img/HPU_8.9/HPU 64.png)
4. 从 `确认保存` 弹出窗口中点击 `保存`。
![setup_assets](img/HPU_8.9/HPU 65.png)

### 创建并运行投资策略

要测试不同的投资策略,请移至资产投资优化器选项卡以创建第一个策略 `维持风险`。

1. 将鼠标悬停在左侧导航栏上以展开它。
2. 选择左侧导航栏上的 `资产投资优化器` 部分。
![setup_assets](img/HPU_8.9/HPU 55.png)
3. 从 `项目` 选项卡,点击 `ST 演示项目`。
![setup_assets](img/HPU_8.9/HPU 66.png)
4. 点击 `+` 以创建第一个策略。
![setup_assets](img/HPU_8.9/HPU 67.png)
5. 从弹出窗口中,确保 `策略` 选择为 `维持风险`,然后点击 `创建`。
![setup_assets](img/HPU_8.9/HPU 68.png)

创建策略后,运行分析。可能需要一些时间才能完成。用户可以离开屏幕,分析将继续运行。

6. 点击 `运行分析`
![setup_assets](img/HPU_8.9/HPU 69.png)

创建第二个投资策略 `降低风险` 并运行它。

1. 点击 `+` 以创建第二个策略。
![setup_assets](img/HPU_8.9/HPU 70.png)
2. 从弹出窗口中,将 `策略` 选择设置为 `降低风险`。
3. 将 `目标风险评分` 设置为 `7`。
4. 点击 `创建`。
![setup_assets](img/HPU_8.9/HPU 71.png)
5. 点击 `运行分析`。
![setup_assets](img/HPU_8.9/HPU 69.png)

创建第三个投资策略 `保持预算` 并运行它。

1. 点击 `+` 以创建第三个策略。
![setup_assets](img/HPU_8.9/HPU 72.png)
2. 从弹出窗口中,将 `策略` 选择设置为 `保持预算`。
3. 将 `运营支出` 设置为 `810000`。
4. 将 `资本支出` 设置为 `1350000`。
4. 点击 `创建`。
![setup_assets](img/HPU_8.9/HPU 73.png)
5. 点击 `运行分析`。
![setup_assets](img/HPU_8.9/HPU 69.png)


## 平均故障间隔时间
<a name="mtbf"></a>

要计算有多少资产达到或未达到平均故障间隔时间,需要指定要达到的阈值目标。例如,资产需要运行多少小时才能达到平均故障间隔时间目标。平均故障间隔时间小于小时数的资产意味着它们比要求的更早失败,因此没有达到平均故障间隔时间。平均故障间隔时间是使用资产在发生计划外工单之前的时间量来计算的。其中工单是纠正性维护或紧急维护。平均故障间隔时间的计算方法是将安装和第一次及后续计划外工单之间的总时间相加,然后除以计划外工单发生的总次数。

### 在图表页面上创建阈值

要创建平均故障间隔时间阈值,请考虑您正在测量性能的资产组。考虑为资产类别(如泵)中具有相似预期性能资产的组创建单独的阈值,并为属于系统一部分且需要类似性能考虑的资产(如 HVAC 系统)创建其他阈值。

在本练习中,您将为资产类别创建 MTBF 性能阈值。您可以使用具有相似资产类别、类型、制造商和型号的泵。有两种创建 `阈值` 的方法。一种是在 `资产图表` 页面上,

如果您之前没有创建任何 `阈值`。另一种方法是转到 `评分设置` 页面来创建它们。

1. 导航到 `资产图表` 页面。
![setup_settings menu](img/GoToChartsCreateThreshold.png)	
2. 点击 `创建阈值` 按钮。
3. 填写表单值并点击 `保存` 按钮。
![setup_settings menu](img/CreateThresholdPumpHours.png)
4. 选择页面顶部的 `框` 以选择表上的所有资产。
![setup_assets](img/HPU_8.9/HPU 53.png)
5. 选择 `创建投资项目`。
![setup_assets](img/HPU_8.9/HPU 54.png)


### 在评分设置页面上创建阈值

通过导航到 `评分设置` 随时创建 `阈值`。创建阈值后,它将作为 `图表` 页面上 `MTBF` 图表的选项提供。

1. 导航到 `评分设置` 页面。
![setup_settings menu](img/ClickOnFilterFunnelIcon.png)	
2. 点击 `漏斗` 按钮。
3. 选择您之前创建的要用于当前 `视图` 的阈值,然后点击 `保存` 按钮。
![setup_settings menu](img/CreateThresholdPumpHours.png)


另一种方法是转到 `评分设置` 页面。

1. 导航到 `资产图表` 页面。
![setup_settings menu](img/GoToChartsCreateThreshold.png)	
2. 点击 `创建阈值` 按钮。
3. 填写表单值并点击 `保存` 按钮。
![setup_settings menu](img/CreateThresholdPumpHours.png)
4. 选择页面顶部的 `框` 以选择表上的所有资产。
![setup_assets](img/HPU_8.9/HPU 53.png)
5. 选择 `创建投资项目`。
![setup_assets](img/HPU_8.9/HPU 54.png)


### 在资产详细信息上添加所需数据

要计算资产的平均故障间隔时间 (MTBF),必须知道资产的安装日期。无法显示其 MTBF 值的资产将在 `资产表` 页面的 MTBF 列和资产行中显示 `i` 图标,或在 `资产详细信息` 页面的值卡上显示。通过点击 `i` 图标,将打开一个对话框,您可以在其中设置安装日期。还提供了安装日期的建议值。

1. 导航到 `资产详细信息` 页面
![change_asset_status](img/asset_details_enter_installation_date.png)
2. 点击 MTBF 值卡上的 `i` 图标。
3. 使用对话框中的 `日历` 控件选择安装日期。如果您不知道安装日期,请考虑使用资产首次添加到 Maximo 时的建议值。
4. 点击 `保存` 以保存安装日期。
5. 当 MTBF 计算在 `crontask` 中重新计算时,MTBF 值卡将被更新。

### 在资产表上添加所需数据

1. 导航到 `资产表` 页面
![change_asset_status](img/asset_table_click_i_mtbf.png)
2. 点击 MTBF 值卡上的 `i` 图标。
3. 使用对话框中的 `日历` 控件选择安装日期。如果您不知道安装日期,请考虑使用资产首次添加到 Maximo 时的建议值。
4. 点击 `保存` 按钮以保存安装日期。
![change_asset_status](img/mtbf_asset_table_enter_installation_date.png)
5. 当 MTBF 计算在 `crontask` 中重新计算时,MTBF 值卡将被更新。您将看到一条状态消息,告知您该值将被计算。
![change_asset_status](img/crontask_status.png)


### 故障排除 MTBF

如果在您输入资产的安装日期并且 `crontask` 已运行后,资产的 MTBF 值未出现在 `资产详细信息` 页面或 `资产表` 页面中,则检查是否有任何应用于 `crontask` 的过滤器将您的资产从要计算 MTBF 的资产列表中删除。

1. 导航到 Manage 中的 `crontask`。
![change_asset_status](img/manage_select_crontask.png)
2. 搜索 `MTBF` 并点击 `MTBF crontask`。
![change_asset_status](img/search_mtbf_crontask.png)
3. 查看 `crontask 参数` 以查看该值是否会将您的资产从计算范围中排除。
![change_asset_status](img/mtbf_cron_task.png)
3. 删除或更正可能将您的资产从 MTBF 评分计算任务中排除的任何过滤器,然后点击 `保存` 按钮以保存 `crontask` 设置。

## 总结
<a name="summary"></a>

恭喜。您现在已完成 MAS v8.11 Health 和 Predict 演示设置实验,并准备好进行演示。
