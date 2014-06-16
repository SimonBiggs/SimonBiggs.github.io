%octave
load("data/Measurement Data/Cut-out factors.mat", "wdth", "lng", "ins")
ratio = wdth./lng;

index = applicator(app) & energy(eng);

wd = wdth(index); rt = ratio(index); in = ins(index);
