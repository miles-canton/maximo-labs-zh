# 目标
在本练习中，您将学习如何：

* 部署托管网关
* 验证数据流入

---
*开始之前：*  
本练习要求您已经：

1. 完成[所有实验](prereqs.md)所需的前提条件以及本练习的前提条件
2. 完成之前的练习
3. 验证模拟器正在运行，如[练习1](setup_simulator.md){target=_blank}中所述

---

## 部署托管网关

在网关列表中查看您的托管网关时，按`查看部署指示信息`。</br>
点击docker命令将其复制到剪贴板：
![部署指南](img/deploy_verify_01.png)</br></br>

打开您想要运行托管网关的终端窗口（Mac/Linux）或命令窗口（Windows），然后从剪贴板粘贴docker命令行。点击回车执行它，您应该看到类似以下内容：
![启动EDC边缘](img/deploy_verify_02.png)

!!! tip "提示"
	您可以看到托管网关已成功使用modbus协议建立了与Modbus模拟器的连接。</br>
    其次，您还可以看到托管网关和Maximo Monitor之间建立了MQTT连接</br>
    
    第一次部署时，您可能会收到类似以下响应：`Unable to find image 'icr.io/cpopen/ibm-mas/edgedatacollector:2.5.7' locally`</br>
	请耐心等待Edge Data Collector docker容器下载并启动。</br>

    如果在网关/设备中进行了任何更改。我们需要重新部署docker命令。在重新部署之前，请使用`docker stop <Container ID>`停止旧的docker容器。

    要获取容器ID，请使用`docker ps`，它将提供正在运行的docker容器列表。


## 验证选定的Lenze VFD数据流入Monitor

点击打开`XX_Lenze_i550`设备：
![打开Lenze设备](img/deploy_verify_03.png)</br></br>

导航到`最近事件`并等待一分钟（您知道添加设备时定义的那60000毫秒），直到第一条消息传入。</br>
![](img/deploy_verify_04.png)</br></br>

点击`查看有效内容`并查看发送到事件名称`status`的数据点：</br>
![在Connect中查看设备有效负载](img/deploy_verify_05.png)</br></br>

这些是您在将设备添加到托管网关时选择的数据点：

``` json
{
    "timestamp": "2026-04-29T03:35:26.440485Z",
    "actual-torque-IXF39_percent": 67.2,
    "dc-bus-voltage-6SGP1_volt": 397,
    "frequency-A68E2_hertz": 36.7,
    "heatsink-temperature-44MOQ_degreeCelsius": 23.1,
    "motor-current-KVY0W_ampere": 93,
    "motor-voltage-NL0H5_volt": 701
}
```
</br>

存储的数据可能会用于VFD设备的仪表板：</br>
![在Connect中查看设备有效负载](img/deploy_verify_06.png)</br></br>

如果内有看到设备的Overview仪表板，可以按照下面的方式创建。
点击创建仪表板
![创建仪表板](img/create-dashboard.png)</br>

选择仪表板类型
![选择仪表板类型](img/dashboard-overview.png)</br>

点击时间序列折线图，添加卡片
![添加折线图](img/dashboard-overview-01)</br>

填写和选择相关数据，然后点击右下角添加卡，继续添加卡片
![添加卡片](img/dashboard-overview-02)</br>

点击时间序列折线图，添加另外一个卡片
![添加卡片](img/dashboard-overview-03)</br>

填写和选择相关数据，然后点击保存并关闭
![添加卡片](img/dashboard-overview-04)</br>

回到设备类型页面，可以看到仪表板已经创建了
![仪表板已经创建了](img/dashboard-overview-05)</br></br>
   
 
   </br>
---
恭喜您已成功部署并验证了连接性和数据流入，从而完成了本Maximo实验。