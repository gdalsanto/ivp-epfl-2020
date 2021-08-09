% Lab 4 - Gloria Dal Santo 11/11/20
clear variables; close all; clc
addpath ./data
addpath ./functions

load data                   % information about the stimuli 
load subjective_results     % subjective results from lab

sub_val = subjective_results;

%% Exercise 2.3 - Subjective quality assessment
% 2.3.1 - outlier detection
sub_val = remove_outliers(sub_val);
% 2.3.2 - DMOS 
[DMOS, CI] = subjective_QA(sub_val);
% 2.3.3 - plot
plot_DMOS(data, DMOS, CI);

%% Exercise 2.4 - Objective quality assessment
% the structures of the point clouds are handled through  a
% single struct generated using 'load_pointClouds' function
% load pointCloud_IVP
evaluate_normals;
evaluate_MOS(sub_val);
pointCloud_IVP = load_pointClouds; 

% 2.4.1 - point to point 
ex2q4q1(pointCloud_IVP,data);

% 2.4.2 - plane to plane
ex2q4q2(pointCloud_IVP,data);

% 2.4.3 - color metric
ex2q4q3(pointCloud_IVP,data);
%% Exercise 2.5 - Benchmarking of objective quality metrics 

% 2.4.1 DOMS vs objective metrics - unfitted
[Pearson, Spearman, RMSE] = ex2q5q1;

% 2.4.3 DOMS vs objective metrics - linear fitting
[Pearson_lin, Spearman_lin, RMSE_lin] = ex2q5q3_lin;

% 2.4.3 DOMS vs objective metrics - cubic fitting
[Pearson_cubic, Spearman_cubic, RMSE_cubic] = ex2q5q3_cubic;