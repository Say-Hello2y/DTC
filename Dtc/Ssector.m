function [sys,x0,str,ts]=Ssector(t,x,u,flag)
switch flag
    case 0
        [sys,x0,str,ts]=mdlInitializeSizes;
    case 3
        sys=mdlOutputs(t,x,u);
    case{1,2,4,9}
        sys=[];
    otherwise 
        error(['Unhandled flag=',num2str(flag)]);    
end

function [sys,x0,str,ts]=mdlInitializeSizes
sizes=simsizes;%����һ��������
sizes.NumContStates=0;%������������
sizes.NumDiscStates=0;%��ɢ��������
sizes.NumOutputs=1;%�������
sizes.NumInputs=1;%�������
sizes.DirFeedthrough=1;%ֱ�ӹ�ͨ��0��1����ʱ���ֱֵ��������ͬһʱ�̵�����ʱΪ1
sizes.NumSampleTimes=1;%����ʱ��
sys=simsizes(sizes);%����ֵ
x0=[];
str=[];
ts=[-1 0];
function sys = mdlOutputs(t,x,u)
if ( u >= -1/6*pi ) && ( u < 1/6*pi)
    sys = 1;
    elseif ( u >= 1/6*pi ) && ( u < 1/2*pi)
        sys = 2;
    elseif ( u >= 1/2*pi ) && ( u < 5/6*pi)
        sys = 3;
    elseif ( u >= 5/6*pi ) && ( u <= pi)
        sys = 4;
    elseif ( u >= -pi ) && ( u < -5/6*pi)
        sys = 4;
    elseif ( u >= -5/6*pi ) && ( u < -1/2*pi)
        sys = 5;
    elseif ( u >= -1/2*pi ) && ( u < -1/6*pi)
        sys = 6;
end

% end mdlOutputs

