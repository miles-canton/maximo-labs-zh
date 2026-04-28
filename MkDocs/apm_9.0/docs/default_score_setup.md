# 如何在 Maximo Health 中设置默认评分

从 v9.0 开始,Maximo Health 提供开箱即用的分数来计算所有资产的*健康*、*关键性*和*风险*。这些分数与资产和行业无关,使用常见的资产和工作订单数据生成资产性能的基本指标。您可以根据自己的要求自定义这些配置,使其更加高级。

只需单击一下,您就可以激活 Maximo Health 的默认评分功能。

- ✓ 使用您已有的 EAM 数据
- ✓ 无需配置
- ✓ 将基本分数应用于所有资产
- ✓ 轻松停用默认分数
- ✓ 使用自己的高级配置进行自定义

## 为什么我应该打开默认健康分数?

无论您是刚开始进行预防性、基于状况的还是预测性维护,设置健康评分都是关键。Maximo Health 获取所有源数据并将它们组合成代表资产性能不同方面的分数。

在以下情况下,打开默认健康分数非常有用:

- 您想评估资产的性能但不知道从哪里开始
- 您没有可靠性工程师或主题专家 (SME) 来提出定制的高级评分
- 需要时间慢慢收集更多数据并提出高级评分方法
- 您是 Maximo Health 的新手,可以从学习如何使用评分功能中受益

!!! tip
    即使您有自己的评分方法,您仍然可以打开默认分数,因为它将帮助您熟悉健康评分过程。使用默认分数很容易自定义,随时停用它们,或创建自己的分数来覆盖默认设置。


## 默认健康评分常见问题

> ❓ 如果我不使用 Maximo Manage(旧 Maximo 或其他 EAM 系统),我可以设置默认健康分数吗?
>> ✅ 是的,您可以。但是,查看和修复源数据会更困难。您需要将 EAM 系统与 IBM App Connect 集成。请参阅[此处的教程](https://www.ibm.com/docs/en/mas-cd/mhmpmh-and-p-u/continuous-delivery?topic=loading-data)


## MAS v9.0 默认健康评分设置实验

我们将带您逐步完成在 MAS 环境中设置默认健康分数的过程。

### 实验内容

1. [设置要求](#setup-requirements)
2. [了解默认分数](#understanding-default-scores)
3. [检查数据质量](#check-for-data-quality)
4. [自定义默认分数配置](#customize-default-score-configurations)
5. [停用默认分数](#deactivate-default-scores)
6. [激活默认分数](#activate-default-scores)

### 设置要求

**系统要求**

- 已安装 MAS Health with Manage v9.0,或
- 已安装 MAS Health v9.0 独立版本与您自己的 EAM

**数据要求**

- 工作订单数据
- 资产安装日期和制造商的预期寿命
- 资产优先级

**结果**

为所有资产生成健康、关键性和风险分数

### 了解默认分数

**资产健康**衡量资产的当前状况。影响资产健康的因素包括其年龄、使用情况、维护历史、状况、环境和安全性。

默认健康分数配置是根据资产的年龄、高优先级未完成纠正工作订单和高优先级未完成服务请求计算的。每个贡献者具有相等的权重。
    ![默认健康分数配置](./img/health_score_makeup.jpg)

1. 剩余使用寿命 (RUL) - 权重: 33.33%
    - 接近预期寿命末期且有许多高优先级纠正工作请求的资产将产生非常低的健康分数。
    - 相反,很少有高优先级纠正工作请求的新资产将产生非常高的健康分数。
2. 未完成服务请求的加权计数 - 权重: 33.33%
    - 这是根据过去 5 年的优先级对所有未完成服务请求进行的加权计算。更频繁和更高优先级的服务请求将**负面**影响 `health` 分数。关闭更多高优先级服务请求将改善它。
    - 默认配置假设服务请求的优先级为 1 到 5,其中 1 是*最低*优先级,5 是*最高*优先级
    - 默认配置假设 0 是最少的服务请求数,10 是最多的服务请求数。
![健康范围](./img/health_range.jpg)
3. 未完成纠正工作订单的加权计数 - 权重: 33.33%
    - 这是与 `OPENSR` 类似的计算,因为它根据过去 5 年的优先级对所有未完成纠正工作订单进行加权计算。更频繁和更高优先级的未完成纠正工作订单将**负面**影响 `health` 分数。关闭更多高优先级纠正工作订单将改善它。
    - 默认配置假设工作订单的优先级为 1 到 5,其中 1 是*最低*优先级,5 是*最高*优先级
    - 默认配置假设 0 是最少的未完成工作订单数,10 是最多的未完成工作订单数。


**关键性**表示资产的业务重要性。换句话说,如果资产失败,对客户、财务和安全的影响有多严重?

默认关键性分数是分配给资产的 `priority`。
![默认关键性分数配置](./img/criticality_score_makeup.jpg)

**风险**衡量高风险故障的概率。它通常是故障可能性乘以后果(健康 x 关键性)。

默认风险分数是资产的风险健康和关键性分数的乘积。

具有高业务影响(因此关键性分数高)的资产将比具有相同健康状况的低业务影响资产面临更高的风险。
![默认风险分数配置](./img/risk_score_makeup.jpg)


### 激活默认分数

1. 登录 Maximo Application Suite(必须是 v9.0 或更高版本)

2. 点击 `Activate now` 打开自动默认分数。这将把我们的开箱即用配置应用于系统中的所有资产,并每天对它们进行评分。(注意:这不会覆盖您已激活的任何现有分数。您也可以稍后撤消此操作。)
![激活默认分数弹出窗口](./img/activate_default_scores.jpg)

3. 根据系统中的资产数量,使用默认分数进行计算可能需要几分钟时间。计算完成后,点击 `View Default_scores` 导航到默认评分组。
![查看 Default_scores 弹出窗口](./img/see_default_group.jpg)

4. `Default_scores` 是一个只读评分组,包含系统中的所有资产。它包含 `health`、`criticality` 和 `risk` 的默认分数配置。
![查看 Default_scores 弹出窗口](./img/default_score_group.jpg)

5. 点击 `Health` 查看此组的默认健康分数配置。
![点击健康分数](./img/default_score_group_health.jpg)

6. 在 `Health` 分数页面中,您可以看到健康分数类型范围和分数描述。展开贡献者组以查看贡献者。
![默认健康分数](./img/default_health_score.jpg)

7. 点击贡献者名称 `OPENSR` 查看只读贡献者详细信息并检查公式。
![OPENSR 贡献者](./img/opensr_contributor.jpg)

8. 点击面包屑中的 `Health` 返回上一页。您可以点击贡献者名称 `OPENCMWO` 检查详细信息和公式。

9. 返回面包屑中的 `Health` 分数返回上一页。点击 `RUL` 贡献者名称检查详细信息和公式。这是根据资产的年龄和制造商的预期寿命对资产剩余使用寿命的简单计算。
![RUL 贡献者](./img/RUL_contributor.jpg)

10. 返回面包屑中的 `Default_scores` 返回组页面。点击 `Criticality` 查看此组的默认关键性分数配置。
![点击关键性分数](./img/default_score_group_criticality.jpg)

11. 在 `Criticality` 分数页面中,您可以看到关键性分数类型范围和分数描述。展开贡献者组以查看贡献者。
![默认关键性分数](./img/default_criticality_score.jpg)

10. 返回面包屑中的 `Default_scores` 返回组页面。点击 `Risk` 查看此组的默认风险分数配置。
![点击风险分数](./img/default_score_group_risk.jpg)

11. 在 `Risk` 分数页面中,您可以看到关键性分数类型范围和分数描述。展开贡献者组以查看贡献者。
![默认风险分数](./img/default_risk_score.jpg)

!!! note "注意"
    默认计算每 24 小时在 cron 任务上运行一次。如果切换为 `on` 并显示下次自动计算的时间,则可以判断分数已激活。

恭喜!您已学会如何使用默认配置为系统中的所有资产激活健康、关键性和风险分数。您现在可以导航到默认分数组并了解每个默认分数的计算方式。

### 检查数据质量

本节将帮助您识别和纠正不完整的默认分数。

基于默认计算的完整 `health` 分数需要以下资产数据:

- 安装日期
- 制造商的预期寿命

基于默认计算的完整 `criticality` 分数需要以下资产数据:

- 资产优先级

基于默认计算的完整 `risk` 分数需要 `health` 和 `criticality` 分数都完整。

以下步骤将指导您识别不完整的分数并添加缺失的数据。这是确保数据质量的重要部分。

1. 在 `Default_scores` 组中,向下滚动到所有资产的列表。您可能会注意到表示"不完整"分数的不同图标,这意味着至少缺少一个必需数据。
![默认组资产不完整](./img/default_score_assets.jpg)
缺少数据的资产仍会产生结果,但分数是"不完整的",因此它们可能不是最准确的。

2. 要为不完整的分数添加缺失数据,请点击不完整分数的值。
![部分数据](./img/partial_data.jpg)

3. 对于不完整的 `health` 分数,输入 `Installation date` 和 `Manufacturer's expected life`。点击 `Update`。资产数据将保存在 Maximo Manage 的资产记录中。
![更新](./img/update_data.jpg)

4. 对于不完整的 `criticality` 分数,输入资产 `priority`。点击 `Update`。资产数据将保存在 Maximo Manage 的资产记录中。
![更新关键性](./img/update_criticality_data.jpg)

5. 要在输入缺失数据后查看更新的分数,您可以等待 cron 任务在下次自动计算期间运行,或点击 `calculate` 立即获得结果。
![组计算](./img/group_calculate.jpg)

!!! note "注意"
    如果 `health` 分数缺少必需的资产数据,它将根据可用的维护数据计算结果。如果 `criticality` 分数缺少优先级,它将假设资产优先级为中等或 3 来获得分数(这不会保存在资产记录中)。


### 自定义默认分数配置

默认分数可能不符合您的个人要求,因此它们被设计为可自定义的。

在本节中,您将学习如何修改、添加和删除资产组的默认分数配置。

1. 从 `Default_scores` 开始。点击 `Duplicate group`。这将使用复制的默认分数配置创建一个新组。
![复制组](./img/duplicate_group.jpg)

2. 为您的新组命名和描述(在本例中,它将是 `Pumps` 组)。为我的资产选择一个 `query`。如果您在列表中看不到查询,请点击 `+` 按钮创建新查询。
![选择查询](./img/select_query.jpg)

3. 选择查询后,点击 `Duplicate`。您的新评分组已创建。
![复制分数](./img/duplicate_scores.jpg)

4. 点击 `Health` 分数查看您复制的默认配置。您现在可以进行任何修改,包括添加、删除或修改贡献者。您还可以调整贡献者权重。
![泵组](./img/pumps_group.jpg)

5. 要删除贡献者,请点击贡献者旁边的 `delete` 图标。在本例中,删除 `OPENSR` 贡献者。
![删除贡献者](./img/delete_contributor.jpg)

6. 贡献者权重不再加起来为 100%。要更新,请点击 `edit` 按钮
![编辑贡献者权重](./img/edit_weights.jpg)

7. 重新分配权重,使 `OPENCMWO` 为 `60%`,`RUL` 为 `40%`。点击 `save`。
![编辑贡献者权重](./img/edit_weights_popup.jpg)

8. 要添加贡献者,请点击 `Contributors` 表中的 `add` 图标。这应该会打开一个窗口,您可以从现有贡献者中选择。
![添加贡献者](./img/add_contributor.jpg)
![添加贡献者弹出窗口](./img/add_contributor_popup.jpg)

9. 要修改贡献者,请点击要编辑的贡献者。在本例中,点击 `OPENCMWO` 贡献者。
![修改贡献者](./img/opencmwo.jpg)

10. 贡献者附加了 `_COPY`,因为它是默认只读贡献者的副本。与默认贡献者不同,贡献者副本是可编辑的,包括其公式和标准化值。点击 `value normalization` 旁边的 `edit` 按钮。
![修改贡献者](./img/opencmwo_edit.jpg)

11. 点击 `Continue` 确认对贡献者的任何编辑都会影响使用它的所有分数。
![确认编辑贡献者](./img/confirm_edit_contributor.jpg)

12. 指定标准化值以确定此贡献者的最佳和最差可能值。由于默认 `OPENCMWO` 对您的工作订单做出了一些假设,因此可能需要进行一些调整:
    - 工作订单的优先级为 1 到 3,其中 1 是*最低*优先级,3 是*最高*优先级
    - 0 是最少的未完成工作订单数,25 是最多的未完成工作订单数。
做数学计算,最佳情况是 0x3=3,最坏情况是 3x25=75。将 `Worst possible value` 更改为 `75`。点击 `save`。
![编辑 OPENCMWO](./img/edit_opencmwo.jpg)

13. 返回面包屑中的 `Health` 分数返回上一页。

14. 点击 `Activate` 切换按钮。这将覆盖默认组中的分数配置。

15. 返回面包屑中的 `Pumps` 分数。您想要进行的另一个修改是关键性分数。点击 `Criticality`。
![泵组关键性](./img/pumps_group_criticality.jpg)

16. 点击 `priority` 贡献者进行编辑。
![泵组优先级](./img/edit_priority.jpg)

17. 点击 `value normalization` 旁边的 `edit` 按钮。默认假设您的资产在 1 到 5 的范围内确定优先级,其中 1 是*最低*优先级,5 是*最高*优先级。
![编辑优先级标准化](./img/edit_priority_norm.jpg)

18. 根据此场景对标准化进行更改:
    - 资产的优先级为 1 到 5,其中 1 是*最高*优先级,5 是*最低*优先级。
您将修改标准化,使 `Best possible value` 为 `1`,`Worst possible value` 为 `5`。点击 `save`。
![编辑优先级弹出窗口](./img/edit_priority_popup.jpg)

19. 返回面包屑中的 `Criticality` 分数。确保点击 `Activate` 切换按钮以激活此分数配置。

20. 返回面包屑中的 `Pumps` 分数。要删除分数配置(在本例中,我们要删除 `Risk`),请点击其旁边的 `delete` 删除按钮。点击 `delete` 确认。
![删除风险分数](./img/delete_risk_score.jpg)
![确认删除风险分数](./img/confirm_delete_risk.jpg)

21. 您可以等到下次计划计算以生成更新的分数。要立即获得更新的分数,请点击 `Re-calculate`。
![计算分数](./img/calculate_scores.jpg)

!!! note "注意"
    当您 `duplicate` 默认组时,您实际上是在创建一个具有自定义分数配置的新评分组。


### 停用默认分数

您可以选择停用默认分数。

1. 导航到 `score settings`。

2. 点击 `Default_group` 旁边的 3 点按钮。点击 `deactivate`。
![停用默认分数](./img/deactivate_default_scores.jpg)

默认分数计算已停用(历史计算的分数不会被删除)。如果您尚未设置自己的自定义分数,您可能会注意到资产缺少分数。

### 激活默认分数

如果您想重新激活默认分数,或者如果您在首次安装或升级到 v9.0 Health 时错过了激活的机会,有一种简单的方法可以做到这一点。

1. 导航到 `score settings`。

2. 找到 `Default_group`。点击其旁边的 3 点按钮并点击 `Activate`。
![激活默认分数](./img/activate_default_scores.jpg)

默认分数配置现已激活!