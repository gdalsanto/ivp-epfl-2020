function pointCloud_IVP = load_pointClouds
% pointCloud_IVP = load_pointClouds
% gather all the point Clouds structure in a signle structure 
    addpath ./data/models
    % longdress
    longdress_ref = pcread('longdress_ref.ply');
    longdress_pcc_geo_color_l1 = pcread('longdress_pcc_geo_color_l1.ply'); 
    longdress_pcc_geo_color_l2 = pcread('longdress_pcc_geo_color_l2.ply');
    longdress_pcc_geo_color_l3 = pcread('longdress_pcc_geo_color_l3.ply');
    longdress_pcc_geo_color_l4 = pcread('longdress_pcc_geo_color_l4.ply');
    longdress_cwi_pcl_l1 = pcread('longdress_cwi_pcl_l1.ply');
    longdress_cwi_pcl_l2 = pcread('longdress_cwi_pcl_l2.ply');
    longdress_cwi_pcl_l3 = pcread('longdress_cwi_pcl_l3.ply');
    longdress_cwi_pcl_l4 = pcread('longdress_cwi_pcl_l4.ply');
    
    longdress = struct('Reference',longdress_ref);
    longdress.pcc_geo_color.l1 = longdress_pcc_geo_color_l1;
    longdress.pcc_geo_color.l2 = longdress_pcc_geo_color_l2;
    longdress.pcc_geo_color.l3 = longdress_pcc_geo_color_l3;
    longdress.pcc_geo_color.l4 = longdress_pcc_geo_color_l4;
    longdress.cwi_plc.l1 = longdress_cwi_pcl_l1;
    longdress.cwi_plc.l2 = longdress_cwi_pcl_l2;
    longdress.cwi_plc.l3 = longdress_cwi_pcl_l3;
    longdress.cwi_plc.l4 = longdress_cwi_pcl_l4;
    % guanyin
    guanyin_ref = pcread('guanyin_ref.ply');
    guanyin_pcc_geo_color_l1 = pcread('guanyin_pcc_geo_color_l1.ply');
    guanyin_pcc_geo_color_l2 = pcread('guanyin_pcc_geo_color_l2.ply');
    guanyin_pcc_geo_color_l3 = pcread('guanyin_pcc_geo_color_l3.ply');
    guanyin_pcc_geo_color_l4 = pcread('guanyin_pcc_geo_color_l4.ply');
    guanyin_cwi_pcl_l1 = pcread('guanyin_cwi_pcl_l1.ply');
    guanyin_cwi_pcl_l2 = pcread('guanyin_cwi_pcl_l2.ply');
    guanyin_cwi_pcl_l3 = pcread('guanyin_cwi_pcl_l3.ply');
    guanyin_cwi_pcl_l4 = pcread('guanyin_cwi_pcl_l4.ply');
    
    guanyin = struct('Reference',guanyin_ref);
    guanyin.pcc_geo_color.l1 = guanyin_pcc_geo_color_l1;
    guanyin.pcc_geo_color.l2 = guanyin_pcc_geo_color_l2;
    guanyin.pcc_geo_color.l3 = guanyin_pcc_geo_color_l3;
    guanyin.pcc_geo_color.l4 = guanyin_pcc_geo_color_l4;
    guanyin.cwi_plc.l1 = guanyin_cwi_pcl_l1;
    guanyin.cwi_plc.l2 = guanyin_cwi_pcl_l2;
    guanyin.cwi_plc.l3 = guanyin_cwi_pcl_l3;
    guanyin.cwi_plc.l4 = guanyin_cwi_pcl_l4;
    % phil
    phil_ref = pcread('phil_ref.ply');
    phil_pcc_geo_color_l1 = pcread('phil_pcc_geo_color_l1.ply');
    phil_pcc_geo_color_l2 = pcread('phil_pcc_geo_color_l2.ply');
    phil_pcc_geo_color_l3 = pcread('phil_pcc_geo_color_l3.ply');
    phil_pcc_geo_color_l4 = pcread('phil_pcc_geo_color_l4.ply');
    phil_cwi_pcl_l1 = pcread('phil_cwi_pcl_l1.ply');
    phil_cwi_pcl_l2 = pcread('phil_cwi_pcl_l2.ply');
    phil_cwi_pcl_l3 = pcread('phil_cwi_pcl_l3.ply');
    phil_cwi_pcl_l4 = pcread('phil_cwi_pcl_l4.ply');
    
    phil = struct('Reference', phil_ref);
    phil.pcc_geo_color.l1 = phil_pcc_geo_color_l1;
    phil.pcc_geo_color.l2 = phil_pcc_geo_color_l2;
    phil.pcc_geo_color.l3 = phil_pcc_geo_color_l3;
    phil.pcc_geo_color.l4 = phil_pcc_geo_color_l4;
    phil.cwi_plc.l1 = phil_cwi_pcl_l1;
    phil.cwi_plc.l2 = phil_cwi_pcl_l2;
    phil.cwi_plc.l3 = phil_cwi_pcl_l3;
    phil.cwi_plc.l4 = phil_cwi_pcl_l4;
    % rhetorician
    rhetorician_ref = pcread('rhetorician_ref.ply');
    rhetorician_pcc_geo_color_l1 = pcread('rhetorician_pcc_geo_color_l1.ply');
    rhetorician_pcc_geo_color_l2 = pcread('rhetorician_pcc_geo_color_l2.ply');
    rhetorician_pcc_geo_color_l3 = pcread('rhetorician_pcc_geo_color_l3.ply');
    rhetorician_pcc_geo_color_l4 = pcread('rhetorician_pcc_geo_color_l4.ply');
    rhetorician_cwi_pcl_l1 = pcread('rhetorician_cwi_pcl_l1.ply');
    rhetorician_cwi_pcl_l2 = pcread('rhetorician_cwi_pcl_l2.ply');
    rhetorician_cwi_pcl_l3 = pcread('rhetorician_cwi_pcl_l3.ply'); 
    rhetorician_cwi_pcl_l4 = pcread('rhetorician_cwi_pcl_l4.ply');
    
    rhetorician = struct('Reference', rhetorician_ref);
    rhetorician.pcc_geo_color.l1 = rhetorician_pcc_geo_color_l1;
    rhetorician.pcc_geo_color.l2 = rhetorician_pcc_geo_color_l2;
    rhetorician.pcc_geo_color.l3 = rhetorician_pcc_geo_color_l3;
    rhetorician.pcc_geo_color.l4 = rhetorician_pcc_geo_color_l4;
    rhetorician.cwi_plc.l1 = rhetorician_cwi_pcl_l1;
    rhetorician.cwi_plc.l2 = rhetorician_cwi_pcl_l2;
    rhetorician.cwi_plc.l3 = rhetorician_cwi_pcl_l3;
    rhetorician.cwi_plc.l4 = rhetorician_cwi_pcl_l4;
    
    pointCloud_IVP = struct('longdress', longdress, 'guanyin', guanyin, 'phil', phil, 'rhetorician', rhetorician);
    end