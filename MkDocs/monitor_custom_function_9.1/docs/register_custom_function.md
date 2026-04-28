# 目标
在本练习中，您将学习如何将自定义函数注册到 Maximo Monitor。

### 在本地安装自定义函数

在本地环境中安装自定义函数。更新 {} 中的变量以匹配您的环境。
<pre class="language-bash"><code>
    pip3 install git+https://{XXXXXX}@github.com/{user_id}{path_to_repository}@starter_package --upgrade
</code></pre>

将 `{xxxxxx}` 替换为您的个人访问令牌。

<ol> <b> 在本地测试您的自定义函数 </b></br>

<li>在 scripts 文件夹中创建一个名为 test_my_custom_function.py 的脚本。在脚本中，导入 Python 库和包：
<pre class ="language-bash"><code>
    import datetime as dt
    import json
    import pandas as pd
    import numpy as np
    from sqlalchemy import Column, Integer, String, Float, DateTime, Boolean, func
    from iotfunctions.base import BaseTransformer
    from iotfunctions.metadata import EntityType
    from iotfunctions.db import Database
    from iotfunctions import ui
</code></pre>
</li>
<li>
    连接到 Maximo Monitor。在 test_my_custom_function.py 脚本中，添加：
    <pre class ="language-bash"><code>
    with open('credentials_as.json', encoding='utf-8') as F:
    credentials = json.loads(F.read())
    db_schema = None
    db = Database(credentials=credentials)
    </code></pre>
</li>
<li> 导入并实例化函数。在 test_my_custom_function.py 脚本中，添加以下代码。更新 {} 中的变量以匹配您的环境。 
<pre class ="language-bash"><code>
    from custom{yourinitials}.multiplybyfactor{yourinitials} import MultiplyByFactor{YourInitials}
    fn = MultiplyByFactor{YourInitials}(
    input_items = ['speed', 'travel_time'],
    factor = '2',
    output_items = ['adjusted_speed', 'adjusted_travel_time']
              )
    df = fn.execute_local_test(db=db, db_schema=db_schema, generate_days=1,to_csv=True)
    print(df)
    </code></pre>
</li>
<li>从命令行运行脚本。数据框结果保存到 .csv 文件。在 scripts 目录中查找 df_test_entity_for_multiplybyfactor{your_initials}.csv。输入：
    <pre class ="language-bash"><code>
        python3 test_my_custom_function.py
     </code></pre>
</li>
</ol>

### 注册您的自定义函数
<ol> 
    <li> 在 scripts 文件夹中创建一个名为 register_my_custom_function.py 的脚本。在脚本中，导入 Python 库和包：
    </li>
    <li>
    <pre class="language-bash"><code>
    import datetime as dt
    import json
    import pandas as pd
    import numpy as np
    from sqlalchemy import Column, Integer, String, Float, DateTime, Boolean, func
    from iotfunctions.base import BaseTransformer
    from iotfunctions.metadata import EntityType
    from iotfunctions.db import Database
    from iotfunctions import ui
    </code></pre>
    </li>
    <li>连接到 Maximo Monitor。在 register_my_custom_function.py 脚本中，添加：
        <pre><code class="language-bash">
        with open('credentials_as.json', encoding='utf-8') as F:
        credentials = json.loads(F.read())
        db_schema = None
        db = Database(credentials=credentials)
        </code></pre>
    </li>
    <li>在 register_my_custom_function.py 脚本中，要注册函数，添加以下代码。更新 {} 中的变量以匹配您的环境。
        <pre><code class="language-bash">
        from custom{yourinitials}.multiplybyfactor{yourinitials} import MultiplyByFactor{YourInitials}
        db.register_functions([MultiplyByFactor{YourInitials}])
        </pre></code>
    </li>
    <li> 从命令行运行脚本。例如：
        <pre><code class="language-bash">
            python3 register_my_custom_function.py
        </code></pre>
    </li>
</ol>

---
恭喜您已成功将自定义函数注册到 Maximo Monitor</br>


[Add device]: img/add_device_01.png
[Use device library]: img/add_device_02.png