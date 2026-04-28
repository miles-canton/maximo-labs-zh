# 目标
在本练习中，您将学习如何：

* 部署托管网关
* 验证连接和数据流入

---
*开始之前：*  
本练习要求您已：

1. 完成[所有实验](prereqs.md)和本练习所需的前置条件
2. 完成之前的练习
3. 验证模拟器正在运行，如[练习 1](setup_simulator.md){target=_blank}中所述

---

## 部署托管网关

在网关列表中查看您的托管网关时，按 `View deployment instructions`。</br>
点击 docker 命令将其复制到剪贴板：
![部署指南](img/deploy_verify_01.png)</br></br>

打开一个终端窗口（Mac/Linux）或命令窗口（Windows），在您想要运行托管网关的位置，然后从剪贴板粘贴 docker 命令行。点击回车执行它，您应该看到类似以下内容：
![启动 EDC 边缘](img/deploy_verify_02.png)

!!! tip "提示"
	您可以看到托管网关已成功建立与 OPC UA 模拟器的连接。</br>
	其次，您还可以看到托管网关和 Maximo Monitor 之间建立了 MQTT 连接</br>
	
	第一次部署时，您可能会收到类似以下响应：`Unable to find image 'icr.io/cpopen/ibm-mas/edgedatacollector:2.5.7' locally`</br>
	请耐心等待，边缘数据收集器 docker 容器正在下载和启动。</br>


## 验证 OPC UA 服务器数据流入 Monitor


点击打开 `XX_OPCUA_Server_01` 设备：
![打开 Lenze 设备](img/deploy_verify_03.png)</br></br>

导航到 `Recent event` 并等待半分钟（您知道添加设备时定义的那 30000 毫秒），直到第一条消息传入。</br>
![](img/deploy_verify_04.png)</br></br>

点击 `View payload` 并查看发送到事件名称 `status` 的数据点：</br>
![在 Connect 中查看设备有效负载](img/deploy_verify_05.png)</br></br>

这些是您在将设备添加到托管网关时选择的数据点：

``` json
{
    "timestamp": "2025-06-24T15:59:22.407298Z",
    "opcplc-telemetry-anomaly-dipdata": 58.778525229247315,
    "opcplc-telemetry-anomaly-negativetrenddata": -225.39999999999998,
    "opcplc-telemetry-anomaly-positivetrenddata": 425.4,
    "opcplc-telemetry-anomaly-spikedata": 58.778525229247315,
    "opcplc-telemetry-basic-alternatingboolean": true,
    "opcplc-telemetry-basic-randomsignedint32": 1952630236,
    "opcplc-telemetry-basic-randomunsignedint32": 206313614
}
```
</br>


存储的数据可能用于 Siemens S7 设备的仪表板：</br>
![在 Connect 中查看设备有效负载](img/deploy_verify_06.png)</br></br>

---
恭喜您已成功部署并验证连接和数据流入，从而完成了本 Maximo 实验。</br>
