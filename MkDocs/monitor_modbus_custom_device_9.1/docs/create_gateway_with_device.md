# 目标
在本练习中，您将学习如何在Monitor中创建托管网关并添加您已添加到设备库的新设备。

---
*开始之前：*  
本练习要求您已经：

1. 完成[所有实验](prereqs.md)所需的前提条件
2. 完成之前的练习

---

#### 添加托管网关

登录到MAS：
![MAS Monitor](img/create_gateway_01.png)</br></br>

在左侧菜单的Monitor部分下展开Setup并选择Gateways：
![创建网关](img/create_gateway_02.png)

!!! note "MAS 9.1中的新功能"
    Monitor不再有主主页。与Monitor的所有交互都从左侧菜单的Monitor部分启动</br>

</br>
选择`Add gateway`：
![创建网关](img/create_gateway_03.png)</br></br>

定义网关ID `XX_MGD_GW_01`和网关类型`XX_MGD_GW_01`。

!!! tip
    网关ID和类型中的XX应该是您的姓名首字母缩写，以防其他人在同一Maximo Application Suite环境中进行此实验。

确保网关配置为Managed并点击`Save`：
![创建网关](img/create_gateway_04.png)</br></br>

您现在将看到新的托管网关，在网关列表和网关定义中都包含`Managed`标签：
![创建网关](img/create_gateway_05.png)</br>

!!! note
    凭据会自动"嵌入"到托管网关的docker镜像中。</br>
    这意味着凭据不会呈现给您，与其他网关配置类型不同。</br>


</br>

#### 将新设备添加到托管网关

在托管网关中点击`Add device`：</br>
[![添加设备]][添加设备]{target=_blank}</br>

`Use device library`将自动被选中，因为托管网关仅支持来自库的设备。只需点击`Continue`：  
[![使用设备库]][使用设备库]

!!! note
    网关类型定义了可以添加到网关的设备类型。</br>
    这由Monitor自动处理。</br></br>
    托管网关：来自设备库的OT设备。</br>
    标准/特权网关：IoT设备作为自定义设备添加。</br>

</br>
现在是添加Lenze i550模拟器设备的时候了。</br>
在制造商下拉列表中搜索`Lenze`并选择它。点击`Next`：</br>
![搜索Lenze](img/add_device_03.png)</br></br>

选择i550产品，选择`i550simulator`并点击`Next`：</br>
![选择i550](img/add_device_04.png)</br></br>

选择`Modbus TCP`协议：</br>
![选择Modbus TCP](img/add_device_05.png)

!!! tip 
    模拟器仅支持Modbus TCP协议，因此如果您选择其他协议将会失败。</br>

</br>
现在是使用模拟器的IP地址并将其与端口号10502组合的时候了，用`:`分隔，如`192.168.1.64:10502`。</br>
点击`Next`；
![定义IP地址](img/add_device_06.png)

!!! tip 
    不要更改`Server or unit ID`，因为模拟器不支持它。</br>

</br>
将设备ID定义为`XX_Lenze_i550`，其中您将XX替换为您的姓名首字母缩写。</br>
您可以看到您选择的工业设备的产品类型，即Lenze i550的变频驱动器。</br>
点击`Device type`，您应该看到：
![配置设备ID](img/add_device_07.png)</br></br>

您将创建自己的设备类型。由于您尚未这样做，您只需输入`XX_VFD`，其中您将XX替换为您的姓名首字母缩写：</br>
点击新设备类型以创建它并点击`Next`：
![配置设备类型](img/add_device_08.png)

!!! tip 
    创建后，您可以从下拉列表中选择自己的设备类型。</br>

</br>
将数据频率定义为60000（60秒），当您选择指标时它将自动使用：</br>
![配置频率](img/add_device_09.png)</br></br>

选择所有指标。点击`Save`：
![选择数据点](img/add_device_10.png)


</br>
您现在将看到新添加的设备成为新托管网关的一部分：
![设备已添加](img/add_device_11.png)</br></br>

---
恭喜您已成功在Monitor中创建托管网关并添加了设备库中新添加设备的实例。</br>

[添加设备]: img/add_device_01.png
[使用设备库]: img/add_device_02.png