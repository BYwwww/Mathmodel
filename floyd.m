% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% %floyd算法介绍：求任意一对顶点之间的最短路径
% %               
% % 变量设置
% % （1） 结点个数n； 
% % （2）一个距离矩阵d:用于存储各顶点之间的距离
% % （3）一个路由矩阵r：存储各顶点的路径，用于最终路径的寻找
% % 
% % 方法说明：
% % Inf表示无穷大
% % 
% % 该函数使用方法：
% % 输入：距离矩阵d，一个路由矩阵r
% % 输出：d:任意顶点之间的最短路径的距离集合
% %       r:最终路径的点的集合
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %




clc
d = [0,2,6,4;
    Inf,0,3,Inf;
    7,Inf,0,1;
    5,Inf,12,0];

r = [1,2,3,4;
    1,2,3,4;
    1,2,3,4;
    1,2,3,4];
n = length(d);

%floyd算法，结果为d和r
for k=1:n
    for i=1:n
        for j=1:n
            if d(i,k)+d(k,j)<d(i,j)
                d(i,j)=d(i,k)+d(k,j);
                r(i,j)=r(i,k);
            end 
        end 
    end
end
fprintf('各个顶点之间的最短距离：');
d
fprintf('路由矩阵：');
r
fprintf('--------------------路径打印-----------------------\n');
% 路径的打印
for i = 1 : n
  for j = 1 : n
    start = i;
    dest = j;
    while 1
         if(r(start, dest)  ~= dest)
             fprintf('V%s -> ', num2str(start));
             start = r(start, dest);
         else
             fprintf('V%s -> ', num2str(start));
             fprintf('V%s\n', num2str(dest));
             break;
         end
    end
  end
end
