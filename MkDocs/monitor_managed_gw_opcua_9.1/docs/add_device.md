# 目标
在本练习中，您将学习如何向设备库添加设备。

---
*开始之前：*  
本练习要求您已：

1. 完成[所有实验](prereqs.md)所需的前置条件
2. 完成之前的练习

---

由于 PLC 是高度可定制的，您需要向设备库添加新设备，而不是使用设备库中的预配置设备，例如通过 Modbus 通信的变频驱动器。</br>

导航到设备库页面：</br>
![导航到设备库](img/add_device_01.png)</br></br>

对于 OPC UA 设备，可以上传设备配置或使用内置的数据标签自动检测功能，后者要容易得多。</br>
选择 `Add device to library` 和菜单项 `Scan for devices`：</br>
![扫描设备](img/add_device_02.png)</br></br>

选择 OPC-UA 协议：</br>
![扫描设备](img/add_device_03.png)</br></br>

输入设备详细信息并向下滚动：</br>
![扫描设备](img/add_device_04.png)</br>
!!! tip
    如果其他人在同一个 Maximo Application Suite 环境中学习本实验，设备名称中的 XX 应该是您的姓名首字母缩写。

!!! attention
    如果在几步后执行 docker 命令时看到 `BadTcpEndpointUrlInvalid` 错误，</br>
    那么您可能需要在 `Server IP address or domain` 末尾添加正斜杠，如 `127.0.0.1:50000/`


</br>
复制设备扫描命令，暂时不要点击 `Done`：</br>
![扫描设备](img/add_device_05.png)</br>

打开一个终端窗口（Mac/Linux）或命令窗口（Windows）并运行设备扫描命令：</br>
![扫描设备执行](img/add_device_06.png)</br></br>

等待它完成并返回到命令提示符。</br>
新设备现已添加到设备库。</br>
![扫描设备执行](img/add_device_07.png)</br></br>

返回浏览器，点击 `Done` 然后 `Leave page`：</br>
![扫描设备结束](img/add_device_08.png)</br></br>

在设备库中搜索您的新设备：</br>
![扫描设备结果](img/add_device_09.png)</br></br>

点击您的新设备以查看添加到此设备的指标（数据标签）：</br>
![扫描设备结果](img/add_device_10.png)</br>
查看完这些漂亮的数据标签后，点击 `Cancel` 🤗。</br>


---
恭喜您已成功向设备库添加设备。</br>