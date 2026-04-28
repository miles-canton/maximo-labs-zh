# 目标
在本练习中，您将学习如何：

* 部署托管网关
* 验证连接和数据流入

---
*开始之前：*  
本练习要求您已完成：

1. [所有实验](prereqs.md)和本练习所需的前提条件
2. 之前的练习
3. 验证模拟器正在运行，如[练习 1](setup_simulator.md){target=_blank}中所述

---

#### 部署托管网关

在网关列表中查看您的托管网关时，</br>
按 `View deployment instructions`。</br>
点击 docker 命令将其复制到剪贴板：
![部署指南](img/deploy_verify_01.png)</br></br>

打开您想要运行托管网关的终端窗口（Mac/Linux）或命令窗口（Windows），然后从剪贴板粘贴 docker 命令行。</br>
按回车键执行它，您应该看到类似以下内容：
![启动 EDC edge](img/deploy_verify_02.png)</br></br>

#### 验证连接和数据流入 IoT Tool

从右上角的应用程序切换器或从主页导航到 IoT Tool：
![导航到 IoT Tool](img/deploy_verify_03.png)</br></br>

由于网关和设备使用相同的前缀，因此很容易搜索它们。</br>
验证网关 `XX_MGT_GW_01` 处于已连接状态，设备 `XX_OPC_UA_Server_01` 处于断开连接状态。
![IoT Tool 中的 EDC 设备](img/deploy_verify_04.png)</br></br>

!!! tip
    属于网关的设备将始终处于断开连接状态，因为它们通过网关接收数据。

!!! note "MAS 9.0 中的新功能"
    托管网关和 OT 设备都是在创建托管网关和添加 OT 设备时由 Monitor UI 创建的，即设备不再像以前的版本那样在收集数据后由网关创建。

选择模拟的西门子 S7 OPC UA 服务器并导航到 `Recent Events`。</br>
等待几分钟（您知道添加设备时定义的那 30000 毫秒），直到您看到第一条消息传入：
![在 Connect 中查看设备](img/deploy_verify_05.png)</br></br>

点击最后接收的有效负载：并查看您在将设备添加到设备库时选择的数据点：
![在 Connect 中查看设备有效负载](img/deploy_verify_06.png)</br></br>

并查看在状态事件类型上发送的选定数据点：

``` json
{
	"timestamp": "2024-10-21T15:15:52.662245Z",
	"opcplc-telemetry-anomaly-dipdata": -84.4327925502015,
	"opcplc-telemetry-anomaly-negativetrenddata": -210.39999999999998,
	"opcplc-telemetry-anomaly-positivetrenddata": 410.5,
	"opcplc-telemetry-anomaly-spikedata": -84.4327925502015,
	"opcplc-telemetry-basic-alternatingboolean": false,
	"opcplc-telemetry-basic-randomsignedint32": -1944417017,
	"opcplc-telemetry-basic-randomunsignedint32": 2131461779
}
```
</br>

#### 验证数据流入 Monitor

转到设备类型的设置并搜索您的设备，然后点击打开它：</br>
![在 Connect 中查看设备有效负载](img/deploy_verify_07.png)</br></br>

!!! note "MAS 9.0 中的新功能"
    您还可以直接在 Monitor 中查看传入的数据。</br>


选择 `Resent event` 并稍等片刻：</br>
![在 Connect 中查看设备有效负载](img/deploy_verify_08.png)</br></br>

点击最后一条传入消息的 `View payload`：</br>
![在 Connect 中查看设备有效负载](img/deploy_verify_09.png)</br>
您可以再次看到数据正在流动。</br></br>

存储的数据可能会用于西门子 S7 设备的仪表板：</br>
![在 Connect 中查看设备有效负载](img/deploy_verify_10.png)</br></br>

---
恭喜您已成功部署并验证了连接和数据流入，从而完成了本 Maximo 实验。</br>