---
title: 后端开发基础知识
date: 2017-10-24 23:12:17
tags: 
---

#   计算机网络：

> OSI七层协议、TCP/IP四层协议

> 各层对应的网络设备（路由器、交换机、网关、网桥、集线器等等），各层对应的协议

> 数据链路层的CSMA/CD协议，笔试可能会用到

> IP地址分类，子网划分（笔试常用）

> TCP和UDP的区别

> TCP三次握手和四次挥手，为什么三次握手，为什么四次挥手

> TCP精髓问题：停止等待协议、连续ARQ协议、滑动窗口、流量控制、拥塞控制（慢开始、拥塞避免、快重传、快恢复）

> 从浏览器输入www.baidu.com到加载出页面发生了什么

> GET和POST区别

> HTTP状态码，HTTP1.0和HTTP1.1区别

> HTTP缓存机制（cache-control、Expires之类的一系列请求与相应报头字段）

> session和cookie的区别，禁用cookie后怎么办

> DNS解析的过程

> 常用协议的端口

推荐：计算机网络（谢希仁）、TCP/IP详解、HTTP权威指南，大神可以看一下RCF2616之类的


数据库:

Mysql：

1. 数据库三范式及判断、E-R图

2. innodb和myisam存储引擎的区别

3. 索引分类（主键、唯一索引、全文索引、覆盖索引等等），最左前缀原则，哪些条件无法使用索引

4. B树、B+树区别，索引为何使用B+树

5. 聚集索引与非聚集索引（使用非聚集索引的查询过程）

6. 事务的ACID（原子性、一致性、隔离性、持久性）

7. 事务隔离级别和各自存在的问题（脏读、不可重复读、幻读）和解决方式（间隙锁及MVCC）

8. 乐观锁和悲观锁、行锁与表锁、共享锁与排他锁（inndob如何手动加共享锁与排他锁）

9. MVCC（增加两个版本号）及delete、update、select时的具体控制

10. 死锁判定原理和具体场景

11. 查询缓慢和解决方式（explain、慢查询日志、show profile等）

12. drop、truncate、delete区别

13.查询语句不同元素（where、jion、limit、group by、having等等）执行先后顺序

14. mysql优化，读写分离、主从复制

15. 数据库崩溃时事务的恢复机制（REDO日志和UNDO日志）

Redis:

1.发布订阅

2.数据淘汰机制（好几种）

3.字典及渐进式rehash

4.RDB与AOF

5.为何高效（内存数据库、非阻塞IO、IO多路复用、单线程、hash表、跳表等）

6. Redis的几种数据结构



推荐：MySQL数据库应用从入门到精通（王飞飞，虽然名字很low）、高性能Mysql、Redis设计与实现、Redis实战



数据结构与算法：

1. 数组、链表（单向、双向、双端）、栈和队列、二叉树、红黑树、哈希表、堆（最大和最小）、图

2. 个人经验：栈和队列、哈希表、链表、二叉树的题较多，图的较少

3. 查找：二分查找及其变形

4. 二叉树：前序、中序、后序遍历，按规定方式打印，两个节点之间操作（最近公共祖先、距离）等问题。

5. 最大堆和最小堆：大数量级数据找最大几个等问题、堆如何调整等问题。

6. 图：深度优先、广度优先、单源最小路径Dijkstra，任意两点间最短路径Floyd-Warshall，最小生成树Prime和Kruskal

7. 红黑树：特点及如何调整（基本上没人让你手撸红黑树）

8. 栈和队列：经常作为算法题要用到的数据结构

8. 八大排序：3个简单的：冒泡、选择、插入及其优化，5个高级的：快速排序、归并排序、堆排序、希尔排序、桶排序（快排、归并、堆很重要，经常手撸）

9. 时间复杂度及空间复杂度分析

10. 动态规划dp：这个比较难，背包问题之内的



推荐：数据结构C语言版（严蔚敏）、java数据结构和算法（Robert Lafore）、剑指offer及leetcode刷题、大神可以看一下算法导论



Linux:

1. 常用命令：用户控制、权限控制、进程控制、系统状态查询之类的

2. Linux状态分析：CPU（top）、内存（top和free，注意buffer和cache区别）、磁盘（fdisk和df）、IO（iostat）等

3. grep和sed

4. awk（用好awk，脚本写得好）

5. shell脚本

6. Linux目录结构（尤其是/proc非常重要）

7. linux文件系统结构和启动流程

8. 防火墙iptables（这个比较少）



推荐：鸟哥私房菜、视频（马哥的一套 http://pan.baidu.com/s/1pL3HGT1）



操作系统：

1. 一个二进制文件运行出结果，操作系统做了什么（这是一个很全面的题）

2. 死锁的条件及银行家算法、资源分配图之类的

3. 进程间通信方式

4. linux的五种IO方式（阻塞与非阻塞、同步与异步的理解）

5. linux的select、poll、epoll的区别

6. 进程与线程区别、内核级线程与用户级线程

7. 页面置换算法，尤其是lru

8. 进程调度算法

9. linux中断响应机制

10. 虚拟内存机制



推荐：现代操作系统、网易云课堂的北大公开课



基本语言（java+PHP）:

PHP：

1. PHP面向对象的特点和java的不同

2. PHP类内的三个指针的不同（this、类名、self）

3. PHP的自动加载机制

4. PHP的魔术方法

5. PHP的命名空间

6. PHP的垃圾回收机制和存在的问题（环形引用，内存泄漏）

7. PHP如何防止SQL注入（Mysqli预编译等）

8. PHP和apache服务器结合的方式

9. fastcgi和php-fpm的端口及工作方式

10 . nginx服务器相比apache服务器的优点和原理（内存映射mmap、event-driven和aio等）

java：（未接触javaee）

1. java面向对象（一大堆知识点）

2. 多线程实现的几种方式（Thread、Runnable、Callable、线程池）及各自的特点

3. java线程的状态及相互转换

4. 线程同步的几种方式和线程间通信

5. 生产者消费者模式

6, volatile关键字

7. J.U.C包的JDK源码（CAS、AQS、ConcurrentHashMap、ThreadLocal、CyclicBarrier、CountDownLatch、Atom、阻塞队列等等）

8. String、StringBuffer、StringBuilder

9. 异常处理机制

10.集合框架底层JDK实现（HashMap和Hashtable区别、Set、List等等）

11. IO（writer、reader、InputStream、OutputStream）、NIO等

12. 四种引用及其区别和使用场景

13. 对象序列化与反序列化

14. lambda表达式

15. jvm虚拟机：内存分区、垃圾回收（三种垃圾回收算法、新生代老生代、垃圾回收器、G1优点等等）、内存溢出、内存泄漏排查、JVM调优、类加载机制、双亲委派、内存模型及线程、锁优化

16.设计模式：几种单例模式实现（手撸）、其他几种常见的设计模式（JDK中具体点）、项目中怎么用了



语言这块知识点太多了，基础要扎实。



推荐：设计模式那点事、疯狂java讲义、java并发编程实战、深入理解java虚拟机、java编程思想



其他：

hadoop：mapreduce、HDFS、yarn等等（推荐：Hadoop权威指南）

hive：很常用的处理工具（推荐：Hive编程指南）

消息队列（kafka之类的）、远程过程调用RPC之类，写一些Demo自己试一下，不要被问直接就不知道

负载均衡调度（一致性哈希经常问）等



当然，还有很多其他知识。




