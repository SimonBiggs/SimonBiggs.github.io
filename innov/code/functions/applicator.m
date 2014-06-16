function index = applicator(appRef)

load("data/Measurement Data/Cut-out factors.mat", "app")

index = app == appRef;
