# 目标
在本练习中，您将学习如何将第二个模拟器设备添加到托管网关。</br>

---
*开始之前：*  
本练习要求您已：

1. 完成[所有实验](prereqs.md)所需的前提条件
2. 完成之前的练习
 
---

过滤以查找并选择您的网关</br>
- 选择它，您还应该看到由您的托管网关处理的设备：</br>
![查看您的托管网关](img/2nd_device_01.png)</br></br>

在托管网关中点击 `Add device`：</br>
[![添加设备]][添加设备]{target=_blank}</br>

`Use device library` 将自动被选中，因为托管网关仅支持来自库的设备。只需点击 `Continue`：
[![使用设备库]][使用设备库]

!!! note
    网关类型定义了可以添加到网关的设备类型。</br>
    这由 Monitor 自动处理。</br></br>
    托管网关：来自设备库的 OT 设备。</br>
    标准/特权网关：IoT 设备作为自定义设备添加。</br>

</br>
是时候添加 Json simulator-3 设备了。</br>
在制造商下拉列表中搜索 `IBM` 并选择它。点击 `Next`：</br>
![搜索 IBM](img/2nd_device_04.png)</br></br>

选择 HTTP Device - main 产品，选择 `Simulator-3` 并点击 `Next`：</br>
![选择 Simulator-3](img/2nd_device_05.png)</br></br>

为端点选择 `http` 协议：</br>

!!! tip 
    模拟器在我们的本地计算机上运行，地址为 http://localhost:8080 或 http://127.0.0.1:8080。</br>

</br>
现在是时候使用模拟器的 IP 地址和端口号 `127.0.0.1`、`8080` 了。</br>
点击 `Next`；
![定义 IP 地址](img/2nd_device_06.png)

!!! tip 
    URL 的上下文路径应在 CSV 上传期间添加到 `endpoint` 列中的数据点。</br>

</br>
将设备 ID 定义为 `Json-over-http_Simulator-3`。</br>
您可以看到产品类型为自定义设备，即添加到设备库的所有自定义设备的产品类型。</br>
点击 `Device type`，您应该看到：
![配置设备 ID](img/2nd_device_07.png)</br></br>

您可以选择旧设备类型或创建新设备类型：</br>
点击 `XX_Json_Type` 并点击 `Next`：
![配置设备类型](img/2nd_device_08.png)

!!! tip 
    创建设备类型后，您可以从下拉列表中选择自己的设备类型。</br>

</br>
将数据频率定义为 30000（30 秒），当您选择指标时它将自动使用：</br>
![配置频率](img/2nd_device_09.png)</br></br>

选择所有指标。点击 `Save`：
![选择数据点](img/2nd_device_10.png)

</br>
您现在将看到您的第二个设备成为托管网关的一部分：
![设备已添加](img/2nd_device_11.png)</br></br>

---
恭喜您已成功将另一个模拟器设备添加到您的托管网关。</br>

[添加设备]: img/2nd_device_02.png
[使用设备库]: img/2nd_device_03.png