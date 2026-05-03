# 目标
在本练习中，您将学习如何：

* 使用 IOT 函数设置启动包

---
#### 前提条件
*开始之前：*  
本练习要求您：

1. 在您的环境中安装 [Python 3.11.x](https://www.python.org/downloads/)。
2. 安装 [Git](https://git-scm.com/downloads)。
3. 安装 Python 的 [pip3](https://pip.pypa.io/en/stable/installation/) 包管理器。
4. 安装编辑器，例如 [Pycharm Community Edition](https://www.jetbrains.com/pycharm/download/) 或 [VS Code](https://code.visualstudio.com/)。


#### 设置启动包
<ol>
  <li>克隆 <a href='https://github.com/miles-canton/maximo-monitor-custom_functions'> HelloWorld 启动包 </a>。</li>
  <li>打开终端窗口。</li>
  <li>为启动包创建一个新的项目文件夹。例如，mkdir custom_function。</li>
  <li>切换到项目目录。例如，cd custom_function。</li>
  <li>克隆启动包。输入：
    <pre><code class="language-bash">git clone https://github.com/miles-canton/maximo-monitor-custom_functions.git</code></pre>
  </li>
  <li>验证您已将启动包克隆到 custom_function 目录。</li>
  <li>切换到启动包中的 maximo-monitor-custom_functions 目录。输入：cd maximo-monitor-custom_functions</li>
</ol> 

#### 设置 Pycharm
<ol>
  <li> 安装 <a href = 'https://www.jetbrains.com/pycharm/download/'> PyCharm </a> 社区版
  </li>
  <li>打开 PyCharm 并选择 Open 浏览到您克隆的目录。</li>
  <li>接下来，通过运行以下命令在 custome_function 文件夹内创建 Python 虚拟环境 (venv)：</li></br>
  <li> 
     <pre><code class="language-bash">
        python3 -m venv venv-cust
        cd venv-cust/bin source activate
     </pre></code>
  </li>
  <li>
    <ol>设置虚拟环境： 
        <li> 转到 PyCharm > Preferences > Project > Python Interpreter </li>
        <li>点击设置图标并选择 Add</li>
        <li>设置您的 venv 文件夹位置</li>
        <li>将基础解释器设置为您的 Python 3.11.x 目录</li>
    </ol>
  </li>
  <li>运行以下命令将 iotfunctions 包安装到您的 Python 环境中。确保使用您版本的正确分支名称</br>
  <pre><code class="language-bash">
            pip3 install git+https://github.com/ibm-watson-iot/functions.git@9.1.x --upgrade
     </pre></code>
  </li>
  </ol>


!!! note
    始终使用与您的 Maximo Monitor 版本匹配的 IoT Functions 版本，以避免管道问题。

!!! attention
    如果您使用的是 Mac 机器，可能会遇到 ibm_db 包的兼容性问题。以下是解决方法：</br>
    打开 requirements.txt 文件</br>
    将 ibm_db==3.2.3 更改为 ibm_db==3.2.5</br>
    保存文件</br>
    pip3 install -r requirements.txt

---
恭喜您已成功设置启动包。</br>