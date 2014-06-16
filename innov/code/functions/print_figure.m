function print_figure(fig,name)

% ===========
% Simon Biggs
% ===========

W = 7.5; H = 5.5; fontsize = 10;
margin = 0.05;
wSize = W - 2*margin; hSize = H - 2*margin;

h = figure(fig);
a = get(h, "currentaxes");

fname = findall(h,'-property','FontName');
set(fname,'FontName','/usr/share/fonts/truetype/cmu/cmunrm.tff');
fsize = findall(h,'-property','FontSize');
set(fsize,'FontSize',fontsize);



set(h,'PaperUnits','inches')
set(h, 'PaperPositionMode', 'auto'); 

set(h,'PaperSize',[H,W])
set(h,'PaperPosition',[0,0,wSize,hSize])

print ([name,'.png'], '-dpng','-r300')
