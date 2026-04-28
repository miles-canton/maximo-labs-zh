# 目标
在本练习中，您将学习如何：

* 安装 OPC UA 模拟器

---
*开始之前：*  
本练习要求您已完成：

1. [所有实验](prereqs.md)所需的前提条件

---

本练习中的模拟器是一个带有动态数据标签的 PLC OPC UA 模拟器：[Microsoft OPC UA PLC](https://github.com/Azure-Samples/iot-edge-opc-plc){target=_blank}

#### 运行 OPC UA 服务器

打开终端窗口（Mac/Linux）或命令窗口（Windows）并输入以下命令：
```` bash
docker run --rm -it --net host --name opcplc mcr.microsoft.com/iotedge/opc-plc:2.5.2 --ph=127.0.0.1 --pn=50000 --ut --autoaccept --sph --sn=5 --sr=10 --st=uint --fn=5 --fr=1 --ft=uint --gn=5
````

![运行 OPC-UA 模拟器](img/setup_01.png)</br>

等待初始化完成：</br>
![运行 OPC-UA 模拟器](img/setup_02.png)</br>

您现在应该看到端点的 URL：`opc.tcp://127.0.0.1:50000` - 这将在实验后续部分使用。</br>

!!! note 注意
    有关该命令不同选项的信息可以在[此处](https://github.com/Azure-Samples/iot-edge-opc-plc#command-line-reference){target=_blank}找到</br>
    与页面中提供的建议命令相比，添加的命令选项包括：
    <ul>
    <li> 务必使用模拟器的 2.5.2 版本 - 如果使用任何更高版本，您将获得接近 4000 个标签，而不是仅 27 个</li>
    <li> `--ut`：启用不安全传输，以便可以在没有证书和用户身份验证的情况下建立连接</li>
    <li> `--ph=<path>`：PLC 的完全限定主机名 - 在我们的例子中是 `127.0.0.1`。</li>
    <li> `--pn=<port number>`：OPC 服务器端点的服务器端口 - 在我们的例子中是 `50000`。</li>
    </ul>



#### 验证 OPC UA 服务器正在运行

本练习的这一部分是可选的。

如果您想验证 OPC UA 服务器是否正在运行，有几种选择。</br>
[Prosys OPC UA Browser](https://prosysopc.com/products/opc-ua-browser/){target=_blank} 相当易于使用，并且适用于所有主要操作系统（Windows、Linux、macOS）。

OPC UA Browser 是免费的，但您需要点击"请求下载"并提供您的联系信息以换取下载。

安装并打开应用程序，然后输入端点的 URL：`opc.tcp://127.0.0.1:50000`</br>
选择 `RandomSignedInt32` 基本遥测，您可以看到一个 Value 属性：</br>
![Prosys OPC UA Browser](img/setup_03.png)</br>
点击 `Refresh Attributes` 并验证每次点击时 Value 都会改变。

---
恭喜您已成功设置模拟器环境。</br>