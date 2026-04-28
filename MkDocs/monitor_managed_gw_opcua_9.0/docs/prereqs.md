# 前提条件说明

以下是 Maximo Monitor Edge Data Collector 练习的前提条件。

!!! attention
    本实验需要 Maximo Monitor 9.0 或更高版本。</br>
    MAS 应用程序授权必须为 `Limited` 或更高级别。

# 所有练习

所有练习要求您具备：

1.  一台配备 Chrome 或 Firefox 浏览器且可连接互联网的计算机。

2.  可以在 Monitor 中创建托管网关的 Maximo Application Suite 环境的用户访问权限。这需要：</br>
o 您的用户必须有权访问 Monitor 和 IoT Tool</br>
o 您的用户必须具有 Maximo Application Suite 的管理员访问权限。</br>
您的练习协调员应该已向您提供有关访问权限的信息。

3.  IBM ID。如果您没有 IBM ID，可以在[此处](https://www.ibm.com/account/reg/signup?){target=_blank}获取：<br>
o 点击 `Login to MY IBM` 按钮<br>
o 点击 `Create an IBM ID` 链接

4.  测试您对 Maximo Application Suite 环境的访问权限。

# 练习 1 和 4

Docker 必须在您的本地计算机上运行，作为托管网关实例。</br>
根据软件包和操作系统的不同，安装 Docker 引擎有多种方式。</br>
一个多平台选项是 Rancher Desktop。安装 Rancher Desktop 相当简单，</br>
您只需遵循此指南：[本地运行 Docker](https://docs.rancherdesktop.io/getting-started/installation/){target=_blank}</br>

!!! tip
    Podman 和 Docker Desktop 应该也可以工作，但我没有测试过。