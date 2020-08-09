% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%Dijkstra�㷨���ܣ���һ��Դ�㵽��������������·��
%               
% ��������
% ��1�� ������n�� 
% ��2����ά����M��nxn�������������ͨ�Ľ��伴Ϊ���룬����ͨ�Ľ���Ϊ��������Լ��ľ���Ϊ0�� 
% ��3��һά����pb��1xn��������i�����ҵ����·������pb��i��=1���������0�����ڳ�ʼ��㣬pb=1�� 
% ��4���������d��1xn��������i�����ҵ����·�������d��i��=��̾��룬����Ϊ0����ʼ���d=0�� 
% ��5����һ������path��1xn)������i���ҵ������·������path�����һ�����·����ǰһ����㣬ͨ����ÿһ��Ļ��ݣ������ҵ����·����

% ����˵����
% size(a)��ʾ����ÿ��ά�ȵĳ��ȣ������м��У�size([1 2 3;4 5 6]) = [2,3]��
% length(a)��ʾ����a�����ĳ��ȣ���max(size(a)),length([1 2 3;4 5 6])����3����Ϊ2��3�������3
% Inf��ʾ�����
% find����������ʾ�ҵ�����������Ԫ�ص��±꣬�����±�ļ���
% 
% �ú���ʹ�÷�����
% ���룺Ҫ�����̾���ľ�����������Ϊm
% �����d:��㵽�κε�����·���ľ��뼯��
%       path:�����һ�����·����ǰһ�����ļ��ϣ�ͨ�����ݿɵõ���̵ľ���·��
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 




clc;clear;
%����n�������
m = [0,6,Inf,Inf,Inf,2;
    6,0,2,Inf,Inf,1;
    Inf,2,0,4,1,5;
    Inf,Inf,4,0,1,Inf;
    Inf,Inf,1,1,0,7;
    2,1,5,Inf,7,0];

n=6;   %���þ����С
temp=1;  %������ʼ��

pb(1:length(m))=0;pb(temp)=1;%������·���ĵ�Ϊ1��δ�����Ϊ0
% ����pb = [1,0,0,0,0,0];

d(1:length(m))=0;%��Ÿ������̾���
% ����d = [0,0,0,0,0,0];

path(1:length(m))=0;%��Ÿ������·������һ����
% ����path = [0,0,0,0,0,0];

while sum(pb)<n %�ж�ÿһ���Ƿ����ҵ����·��
 tb=find(pb==0);%�ҵ���δ�ҵ����·���ĵ�
 fb=find(pb);%�ҳ����ҵ����·���ĵ�
 min=inf;
 for i=1:length(fb)
     for j=1:length(tb)
         plus=d(fb(i))+m(fb(i),tb(j));  %�Ƚ���ȷ���ĵ���������δȷ����ľ���
         if((d(fb(i))+m(fb(i),tb(j)))<min)
             min=d(fb(i))+m(fb(i),tb(j));
             lastpoint=fb(i);
             newpoint=tb(j);
         end
     end
 end
 d(newpoint)=min;
 pb(newpoint)=1;
 path(newpoint)=lastpoint; %��Сֵʱ����֮���ӵ�
end
fprintf('�������%d');
m

fprintf('���ҵ����·���ĵ�ļ���');
pb

fprintf('���ҵ����·�����ܾ���');
d

fprintf('���ҵ����·���ľ��루��ǰ���ݣ�');
path