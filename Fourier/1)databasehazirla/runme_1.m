% onislem asamasi
clear all;  close all;  clc;
dbg = true;

dbnm = '../_db/sdha2010-ut-tower/';
ffnm4data = '../_db/datastore.mat';     mkdir('../_db/');

data_store(dbnm, ffnm4data, dbg);
