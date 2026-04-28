# 目标
在本练习中，您将把创建的自定义函数 MultiplyByFactor 应用到设备类型。

### 创建示例设备类型

- 在 Maximo Monitor 中，导航到侧边导航栏 <b>设置 > 设备类型</b>
- 点击加号 (+) 图标添加新设备类型
- 选择 Robot 示例类型模板
- 为设备类型分配一个描述性名称
- 点击创建
- 选择您的新设备类型并点击设置设备类型
- 导航到数据选项卡

!!! note
    指标可能需要最多 5 分钟才能生成数据。

### 将自定义函数应用到设备类型。

- 如果您尚未创建距离指标，请添加它。按照[教程：添加表达式](https://www.ibm.com/docs/en/masv-and-l/maximo-monitor/cd?topic=tutorials-tutorial-adding-expressions)中的步骤操作
- 导航到计算指标选项卡，点击创建计算指标
- 从目录中选择您的 MultiplyByFactor{YourInitials} 函数
- 设置适当的范围并点击下一步
- 配置函数参数：
    - Factor 字段：输入 2
    - Input_item 字段：选择 distance
- 点击下一步。
- 将输出重命名为 'adjusted_distance'。
- 点击创建。
- 在数据项列表中，选择 adjusted_distance。等待最多 5 分钟，让 Maximo Monitor 根据示例数据评估自定义函数。

---
恭喜您已成功应用自定义函数。</br>