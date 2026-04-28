# 目标
在本练习中，您将学习如何在设备类型中添加/编辑设备。

---
*开始之前：*  
本练习要求您：

1. 完成[所有实验](prereqs.md)所需的前提条件
2. 完成前面的练习
 
---

## 添加设备
有两种添加设备的方法：</br>
我们可以在设备类型导航中添加设备。</br>
我们可以通过设备导航创建设备。</br>
点击 `添加设备 +` 按钮。
![Add Device](img/add_edit_device01.png)</br></br>

![Add Device](img/add_edit_device02.png)</br></br>

它将显示通过设备库或自定义设备创建设备。选择添加自定义设备并点击 `继续`。
![Add Device](img/add_edit_device03.png)</br></br>

它将重定向到添加设备页面，其中设备 ID 和令牌类型是必需的。令牌类型可以是自动生成的或自定义的。还需要提及设备类型名称并点击 `保存`。
![Add Device](img/add_edit_device04.png)</br></br>
!!! note "注意"
     通过设备导航创建设备时，设备类型不会预先填充。如果未自动选择，请从下拉菜单中选择适当的设备类型。

设备将在指定的设备类型中可用。
![Add Device](img/add_edit_device05.png)</br></br>


## 添加第二个设备

按照上述步骤向设备类型添加第二个设备。完成后，配置将如下所示。
![Add Device](img/add_edit_device06.png)</br></br>

## 编辑设备

点击您希望编辑的设备。
![Edit Device](img/add_edit_device07.png)</br></br>

转到设备的概览页面。
![Edit Device](img/add_edit_device08.png)</br></br>

它将提供设备详细信息及其与资产和位置的关系。点击 `编辑`。
![Edit Device](img/add_edit_device09.png)</br></br>

我们可以通过概览中的编辑选项编辑设备别名、描述，还可以启用数据模拟器。最后，点击 `保存` 以修改设备的数据。
![Edit Device](img/add_edit_device10.png)</br></br>

设备别名和描述已成功更新。
![Edit Device](img/add_edit_device11.png)</br></br>

## 数据模拟

!!! note "注意"
     使用数据模拟器，我们可以向设备接收模拟数据。

转到设备的概览页面。点击 `编辑`。
![Data Simulation](img/add_edit_device12.png)</br></br>

切换"数据模拟器"开关以启用它。然后，通过输入所需的每分钟事件数来指定频率。
![Data Simulation](img/add_edit_device13.png)</br></br>

现在已为此设备启用数据模拟。
![Data Simulation](img/add_edit_device14.png)</br></br>

模拟的事件有效负载将出现在"最近事件"部分下。
![Data Simulation](img/add_edit_device15.png)</br></br>

## 查看指标数据

导航到设备的数据页面。点击指标旁边的箭头以展开列表。
![View Metric](img/add_edit_device16.png)</br></br>

选择要查看数据的指标名称。点击数据表以显示指标数据。
![View Metric](img/add_edit_device17.png)</br></br>

数据可用于多个指标，可以单独查看。
![View Metric](img/add_edit_device18.png)</br></br>

![View Metric](img/add_edit_device19.png)</br></br>

![View Metric](img/add_edit_device20.png)</br></br>

## 查看维度数据

导航到设备的数据页面。点击维度旁边的箭头以展开列表。
![View Dimension](img/add_edit_device21.png)</br></br>

选择要查看数据的维度名称。
![View Dimension](img/add_edit_device22.png)</br></br>
![View Dimension](img/add_edit_device23.png)</br></br>

或者，您可以导航到设备的维度页面以查看维度数据。
![View Dimension](img/add_edit_device24.png)</br></br>


## 编辑设备维度

导航到设备的维度页面。点击编辑图标。
![Edit Dimension](img/add_edit_device25.png)</br></br>

此处显示的默认值反映了在设备类型级别配置的维度值。要更新它，请根据需要修改维度值，然后点击 `保存` 按钮以应用更改。
![Edit Dimension](img/add_edit_device26.png)</br></br>

此设备的维度详细信息已成功更新。
![Edit Dimension](img/add_edit_device27.png)</br></br>

由于我们修改了设备 1 的维度数据，其当前值与最初在设备类型级别配置的值不同。相比之下，设备 2 仍然反映默认值，因为未对其维度数据进行任何更改。
![Edit Dimension](img/add_edit_device28.png)</br></br>

---
恭喜您已成功在设备类型中添加和修改设备。</br>