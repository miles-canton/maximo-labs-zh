# 目标
在本练习中，您将编写 MultiplyByFactor 自定义函数。

!!! tip
    您可以根据需要定义您的计算！

### 定义您的计算

<b> 业务场景： </b>

一家机器人公司正在测试新的机械臂，发现测试工具引入的延迟会影响速度和行程时间测量。运营经理需要将这些值调整 2 倍，但希望以后能够灵活地更改此因子。

<b> 解决方案： </b>

创建一个可重用的 MultiplyByFactor 函数，可以： </br>
- 接受多个输入项</br>
- 应用可配置的乘法因子 </br>
- 生成相应的输出项</br>
- 在不同计算中重复使用</br>
- 公式：output_value = input_value * factor</br>

### 打包您的函数并将其存储在 GitHub 中
<ol>
    <li>在 GitHub 上为您克隆的启动包创建一个新的私有仓库。</li>
    <li>添加一个空文件（例如 README.md）以创建 master 分支</li>
    <li>在本地打开 PyCharm 中的项目进行编辑。</li>
    <li>验证项目具有以下目录结构和文件：</br>
    <pre><code class="language-bash">
        functions
        |
        |__ setup.py
        |
        |__ scripts
            |
            |_ local_test_of_function.py
        |
        |__ custom
            |
            |_ functions.py
            |_  __init__.py
     </code></pre>
    </li>
</ol>

### 创建您的自定义函数

<ol>
    <li>将 custom 目录重命名为 custom{your_initials}（例如，customRS）</li>
    <li>在您的 custom{your_initials} 目录中创建一个新文件 multiplybyfactor{your_initials}.py</li>
    <li>添加以下代码，更新 <> 中的变量以匹配您的环境。例如，如果您的代码在 GitHub 中，您可以将 PACKAGE_URL 设置为 </br>
    'git+https://<XXXXXX>@github.com/github.com/jones/starter@starter_package'。
在此函数中，您实现两个方法。您将计算添加到 execute 方法中。您在 build_ui 方法中设置函数的输入和输出参数。</li></br>
    <li>
    <pre><code class="language-bash">

import inspect
import logging
import datetime as dt
import math
from sqlalchemy.sql.sqltypes import TIMESTAMP,VARCHAR
import numpy as np
import pandas as pd

from iotfunctions.base import BaseTransformer
from iotfunctions import ui

logger = logging.getLogger(__name__)

#在此处指定您的包的 URL。
#此 URL 必须可通过 pip install 访问。
#示例假设仓库是私有的。
#将 XXXXXX 替换为您的个人访问令牌。
#在 @ 之后必须指定分支。

PACKAGE_URL = 'git+https://XXXXXX@github.com/<user_id><path_to_repository>@starter_package'

class MultiplyByFactor<YourInitials>(BaseTransformer):

    def __init__(self, input_items, factor, output_items):

        self.input_items = input_items
        self.output_items = output_items
        self.factor = float(factor)
        super().__init__()
    def execute(self, df):
        df = df.copy()
        for i,input_item in enumerate(self.input_items):
            df[self.output_items[i]] = df[input_item] * self.factor
        return df

    @classmethod
    def build_ui(cls):
        #定义作为函数输入的参数
        inputs = []
        inputs.append(ui.UIMultiItem(
                name = 'input_items',
                datatype=float,
                description = "Data items adjust",
                output_item = 'output_items',
                is_output_datatype_derived = True)
                      )        
        inputs.append(ui.UISingle(
                name = 'factor',
                datatype=float)
                      )
        outputs = []
        return (inputs,outputs)   
</code></pre>
</li>
</ol>

### 将您的凭据保存到文件

设置凭据以连接到 Maximo Monitor。
<ol>
    <li>导航到您的启动包目录并找到 credentials_as.json 模板文件</li>
    <li>用您的数据替换变量，然后将文件保存到本地计算机。</li>
</ol>   

!!! note
    凭据文件用于在本地运行或测试函数。不要将此文件推送到您的外部仓库。

### 将本地更改推送到您的 GitHub 仓库

您修改的文件仍然指向您克隆代码的 GitHub 仓库。将远程仓库更改为您的 GitHub 仓库。

在将更改提交到外部目录之前，验证您的凭据文件未包含在函数代码中。

将您的函数代码推送到 GitHub 中的外部仓库。

<ol>
    <li>在项目文件夹中打开终端窗口</li>
    <li>输入：git remote -v。远程仓库仍然指向 https://github.com/ibm-watson-iot/functions</li>
    <li>使用以下命令更改远程源 URL：</li></br>
    <li>
        <pre><code class="language-bash"> git remote set-url origin URL_To_YOUR_GITHUB_REPOSITORY
        </code> </pre>
        确认 Fetch 和 Push URL 指向您的仓库。
    </li>
    <li>使用以下命令添加上游远程。输入：</li>
    <li>
        <pre><code class="language-bash"> git remote add upstream https://github.com/ibm-watson-iot/functions.git  </code></pre>
    </li>
    <li>将您的文件添加到 GIT 并提交它们。 </br>
     a. 在 PyCharm 中，选择 custom<your_initials> 目录。</br>
     b. 选择 Git > Add。</br>
     c. 选择 Git > Commit。</br>
     d. 在 Commit Changes 窗口中，点击 Commit。</br>
     e. 选择 Git > Repository > Push。</br>
     f. 点击 Push。</br>
    </li>
    <li>验证您的模块已推送到仓库中的 starter_package 分支。</li> 
</ol>

---
恭喜您已成功编写自定义函数。</br>