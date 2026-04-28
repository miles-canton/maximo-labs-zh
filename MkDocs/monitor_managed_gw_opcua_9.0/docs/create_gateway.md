# 目标
在本练习中，您将学习如何在 Monitor 中创建托管网关。

---
*开始之前：*  
本练习要求您已完成：

1. [所有实验](prereqs.md)所需的前提条件
2. 之前的练习

---

#### 添加托管网关

登录 MAS 并导航到 Monitor：
![MAS Monitor](img/create_gateway_01.png)</br></br>

展开左侧菜单中的 Setup 并选择 Gateways：
![创建网关](img/create_gateway_02.png)</br></br>

!!! note "MAS 9.0 中的新功能"
    现在可以在 Monitor UI 中创建和管理网关。</br>


选择 `Add gateway`：
![创建网关](img/create_gateway_03.png)</br></br>

定义网关 ID `XX_MGT_GW_01` 和网关类型 `XX_MGT_GW`。</br>

!!! tip
    如果其他人在同一 Maximo Application Suite 环境中进行此实验，网关 ID 和类型中的 XX 应该是您的姓名首字母缩写。</br>

确保网关配置为 Managed 并点击 `Save`：
![创建网关](img/create_gateway_04.png)</br></br>

!!! note "MAS 9.0 中的新功能"
    托管网关是 MAS Monitor 9.0 中引入的一种新型网关。</br>
    它是 Monitor 中的集成流程，消除/替代了以前版本中定义 Edge Data Collector 集成的繁琐且容易出错的手动过程。</br>

您现在将看到您的新托管网关，在网关列表和网关定义中都包含 `Managed` 标签：
![创建网关](img/create_gateway_05.png)</br></br>

!!! note "MAS 9.0 中的新功能"
    凭据会自动"嵌入"到托管网关的 docker 镜像中。</br>
    这意味着您不再需要记录此类型网关的凭据，然后手动将该信息输入到 Maximo Monitor 端点的配置中。这更加简化，并消除了手动输入凭据时出错的风险。</br>
    这也意味着凭据不会呈现给您，因为您不再需要它们。</br>

</br>

#### 将新设备添加到托管网关

在托管网关中点击 `Add device`：</br>
![添加设备](img/create_gateway_06.png)</br></br>

由于这是托管网关，`Use device library` 会自动选中，因为只能使用设备库中的设备。</br>
只需点击 Continue 🤗</br>
![添加设备](img/create_gateway_07.png)</br></br>

在制造商列表中搜索 Siemens：</br>
![添加设备](img/create_gateway_08.png)</br></br>

然后在 Siemens 设备的长列表中搜索 S7 设备 - 在 `S7 OPC-UA Server` 下选择您新添加的设备，然后点击 `Next`：</br>
![添加设备](img/create_gateway_09.png)</br></br>

添加 OPC UA 服务器 IP 地址和端口，然后点击 `Next`：</br>
![添加设备](img/create_gateway_10.png)</br></br>

定义设备类型和设备 ID（使用您的姓名首字母缩写代替 XX），然后点击 `Next`：</br>
![添加设备](img/create_gateway_11.png)</br></br>

将数据频率设置为 30000 毫秒（30 秒），并选择以下 7 个数据标签作为 Monitor 中的指标。完成后点击 `Save`：</br>
![添加设备](img/create_gateway_12.png)</br></br>

您现在将看到新添加的设备成为新托管网关的一部分：</br>
![添加设备](img/create_gateway_13.png)</br></br>



---
恭喜您已成功在 Monitor 中创建托管网关并添加了设备库中新添加设备的实例。</br>