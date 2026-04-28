# 欢迎来到 </br>Maximo Monitor 托管网关 OPC UA 实验

!!! note "MAS 9.0 中的新功能"
    从 MAS 9.0 开始，Edge Data Collector 功能的设置发生了巨大变化，以简化和优化配置过程。</br>
    这意味着您将不再在 UI 中看到 `Edge Data Collactor` 或 `EDC`，因为它已作为 Monitor 中的第三种网关类型实现，称为托管网关：</br></br>
    ![架构图](img/index_01.png)</br></br>
    此外，不再需要：</br>
    - 在 IoT Tool 中创建网关，因为现在可以在 Monitor UI 中完成</br>
    - 为 Monitor UI 中的设备预先创建设备类型</br>
    - 为每个规范模型固定使用一个设备类型

---

您将学习如何在 Maximo Monitor 中设置托管网关。

在本实验中，您将学习成功使用 OPC UA 模拟器作为西门子 S7 PLC，并通过托管网关将西门子 S7 的数据导入 Maximo Monitor 所需的步骤。</br></br>

![架构图](img/index_02.png)</br></br>


!!! tip
    如果您想了解更多关于 OPC UA 服务器的信息，请访问 [OPC Foundation OPC UA 服务器页面](https://reference.opcfoundation.org/Core/Part1/v104/docs/6.3){target=_blank}

本实验将涵盖以下内容：

* 设置 OPC UA 模拟器
* 通过设备扫描功能向库中添加新设备
* 创建托管网关并添加设备
* 验证数据从西门子 S7 PLC 通过 OPC UA 一直流入 Maximo Monitor
* 享受乐趣

!!! note
    完成整个实验的预计时间：1 小时


---

**更新日期：2025-04-02**

---