function [y1] = myNNFunc_100k_R096(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 11-Mar-2018 01:04:16.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = 116xQ matrix, input #1
% and returns:
%   y = 6xQ matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-404.581176757812;8.60000000102445e-05;2;0;-2957.85913085938;-809.162353515625;0;-10736.2490234375;-43309.64453125;0.000199000001884997;-10296341;-454.342742919922;-10296341;-18369726119936;-18369726119936;-38660787404800;-170980245504;-38660787404800;-8.68130111694336;0.000484999996842816;2;0;-91.1437149047852;-17.3626022338867;0;-49715.4140625;-88870.1328125;-243.534805297852;-8597241;-2643.47192382812;-9931523;-1038587002880;-3242250993664;-2190175109120;-497979031552;-2305212022784;-13698.248046875;0.00168700003996491;2;0;-5126.6083984375;-110918.6953125;0;-16438.21484375;-447066560;-61.5993309020996;-24130070528;-61.5993309020996;-24130070528;-5.76772661418394e+16;-5.76772661418394e+16;-3.85762623813059e+16;-7.72302067623526e+15;-3.85762623813059e+16;4.70000013592653e-05;5.2999999752501e-05;0;0;-0.0472670011222363;0.000144000005093403;2;0;-388.480834960938;-0.666370987892151;0;-462.499145507812;-2.86421608924866;0;-903.080871582031;-0.18970699608326;-376.045501708984;-8311.9716796875;-1986689.5;-23777.435546875;-19282.58984375;-2789810.5;-0.232209995388985;0.000350999995134771;2;0;-18.6072731018066;-1.31143999099731;0;-1725.43176269531;-6.16417789459229;-0.0936689972877502;-946.219970703125;-0.506271004676819;-946.219970703125;-4422698.5;-4422698.5;-5857961;-88010.8046875;-5857961;-1.73369300365448;0.000182999996468425;2;0;-154.079299926758;-3.46738600730896;0;-231.85661315918;-166.182022094727;-59.9184341430664;-59.8275909423828;-79.4212265014648;-43.777027130127;-28004.154296875;-28004.154296875;-25173.306640625;-3973.90625;-19693.0390625;-4.32777309417725;-4.27297210693359;-6.95128488540649;-6.94918203353882];
x1_step1.gain = [0.0032099151583414;0.326938955949836;0.000801282051282051;1.39189013957632;0.000676164723037003;0.0016049575791707;6.04925898252644;0.000186284799806147;1.24823775007332e-07;1.25162092734278e-07;1.20436782055642e-07;1.20095636891679e-07;1.82170241335435e-07;1.02615256905948e-13;1.0887478599222e-13;5.05158404789208e-14;1.17106003739773e-13;5.17074500405196e-14;0.00151405487901981;0.276443290413308;0.000800640512409928;2.31221087830426;0.0219433671547109;0.000757027439509907;2.1245315013743;4.02289719941926e-05;2.19878074395466e-07;2.02468450336696e-06;2.28753346712843e-07;1.98672303355318e-07;2.01118628390673e-07;1.11621356912083e-12;6.16855267278337e-13;6.55991403444632e-13;1.13610675295956e-12;8.67439643915428e-13;1.09056625576068e-05;0.147690379474353;0.000800640512409928;3.23571713596529;0.000390121469119733;6.9466870801579e-06;25.1847944464168;0.000121667712644626;9.09776598781058e-11;9.89279386757416e-11;8.28841237414288e-11;6.95747376799393e-11;8.28841340384504e-11;3.23191095707893e-17;3.46691241181557e-17;4.49152068599083e-17;4.26551939639522e-17;5.18414582896786e-17;0.00827183827350469;0.00879266690332459;0.000500064278281864;0.000500673941840414;1.72945293679548;0.264324461880008;0.000800961153384061;454.44214986738;0.00514825911605422;0.694410471229066;161.75994716379;0.00432433231374741;0.0022230905692735;0.00345271369092438;0.00220415313870698;0.00222971916306663;0.00531426328061295;4.9097480547203e-06;1.00669984608176e-06;1.12100633965211e-05;4.78098892047838e-06;7.16881584558774e-07;0.903785709440797;0.230301305127816;0.000801282051282051;50.4515429385721;0.107484852243385;0.403130464669819;64.3355745152132;0.00115913016280388;0.00179199239475103;0.00180179262028544;0.00210416383032956;0.00130965463555057;0.00211337660934638;4.3387580237364e-07;4.5221258046122e-07;3.30474780698807e-07;8.23994707868239e-07;3.41413816099172e-07;0.661980947252276;0.2374918122488;0.000400560785099139;155.836055592859;0.0129803289666471;0.27075022748891;616.712917520158;0.00862602093918672;0.00867588070809648;0.0162439195445625;0.00874526538876672;0.0140227097673418;0.0184981102952226;4.05409765743231e-05;4.22108301530592e-05;4.44835741578758e-05;6.24374977172814e-05;4.51135584041713e-05;0.298009245006309;0.301664533147735;0.189514379072948;0.189561654176609];
x1_step1.ymin = -1;

% Layer 1
b1 = [-0.25225026244556647548;-1.1440221010894613407;0.61477319297173127488;-0.42073961420161981595;-1.112876798221418273;4.3975527577161415138;-1.9613714139502789191;0.41973237437689236984;3.143475614936538598;3.0701688321158049355];
IW1_1 = [-1.792321395833208264 -1.5733484854672865616 0.24564432402912661502 -1.3237937808228736891 0.29473162895294346963 -2.2219697555031148184 0.75601593412430112551 -0.4648410487642243849 -0.74066099351152780983 -0.16194544687165873809 -2.5519752131848347787 -0.46393167844061672378 -0.61957394348184580135 0.0091711216650834093134 0.51024106397761115339 0.088377906613636425526 -0.2805155946800672595 0.032070179156973160906 3.7957950437638103836 1.2622752389878897361 -0.47018665076195054198 2.672004497521172528 1.8768288378729338639 -0.2359114314459658801 -2.0298916460190161715 -1.4947817473662712295 -2.6046477329143309376 0.29887307785308608876 0.87903811307954760057 -0.65198412288727458641 -3.3629428635715057361 -1.8059712838448163108 -0.99099789689117534497 -1.4784605640774910462 0.34639440015749572988 -2.9402398326051737421 -1.0027036813169887264 -9.6378144794621682934 0.22314066598730800117 1.0817986509998376299 3.4170296467082614811 -1.180586498868941181 -1.4087197509004290019 -1.4629430827382186031 1.0766265719471563855 0.017636164794914560572 0.93774092684148324661 1.0835642771099944781 0.38222951695595719368 0.5687219211131340213 1.348795252799827038 0.32685637944893375373 -0.12897304690147684547 0.72233021742997216563 4.2205682455989190771 0.11578747825157642559 -1.4219697749448179103 -1.4028229907941738297 -0.22277962993272404368 3.561392664160224264 0.34311350887965008649 1.3588694074967175851 -1.3261660190245059265 0.13143223687134841793 0.90429693048798609478 2.6109365629479874826 0.49417488676062670816 1.2458590017018398299 -2.6670855495247547395 -0.23646818582094381034 -2.0646670241908742227 -0.89977650263916575391 -1.125186596923101412 -1.6368210670074834212 -0.95351530265994099977 0.031353974566436321192 -0.67261792755425431345 -0.97101587112192722095 0.18778066967481835126 -3.3068069711950434098 -2.3930943690211101682 0.19124158376925134983 0.51108627801058403861 -1.3238331557364575453 -2.6097454921426970209 1.8786457310255078035 1.0883460612708590887 -3.0231470841013012851 3.727230379582104014 0.34719617465274982271 -1.7894102687688884235 -0.22105096922364331213 0.036335369263933048334 -0.74519811750004993911 -0.24516905991607923498 -0.13460125731600022791 0.35107632004507793866 1.2983572529733042877 3.8331817711059108511 -0.070322137418286467803 4.5459365662051114398 -1.2486141913306862961 0.65995821922420327965 1.228212157488906886 -0.49470925772293372624 -1.0092745780582101922 -0.091530179517218132612 0.43696792926840632987 -0.11490832580318871559 -0.74377541526307899833 0.077447005798985141256 0.24738330580628140054 0.54781546624089061392 -0.59695082777920593919 -3.0314271722380095042 0.92827830870793603957;1.4244630379110141405 0.53489868028017484303 -0.24002960418108398866 -0.50575244604756663946 1.3747750531813984765 -0.010308672125439510836 0.52438930201826983168 -1.2870238354959773197 -1.8588716230367239302 -0.47569366770250148813 -0.45296061598686476746 -1.9142044692359341251 0.07722307306759379486 -0.25720853868067461434 0.76114742098260701475 -0.39244331508690966093 -0.0073311994450430961745 -0.09855147404890340912 -1.0572158088671159692 0.3457193652434081832 -0.11877233018862737302 2.5436089673575099646 3.0228362244474942244 0.23149368017742502635 0.93402504442057443512 0.88915678647707308002 1.5282976252994657784 0.63739364030767631242 7.8212829523811944199 1.676679498612024144 -2.2309711038730908328 -0.92740079004035469445 -3.1677527176829656241 0.49450352238405481664 -2.5338769377986265496 0.75250817466124420019 -0.079417325816007175443 -9.4404981478922813665 10.574104696191490405 1.0797429567326712885 0.29277465609732833407 0.17573065977266727478 4.4616321855759295545 2.5810154160080172048 -2.1979998831221765343 -0.92604746130947890315 -1.7294808784980197913 -1.4960205339506225108 -0.59984680713225313475 -0.165210940141254925 0.50658819892142692431 -0.13348668267355415229 0.024304919150294479468 -0.058891277679366416109 -3.4899482719501873085 -0.2591605775814951329 2.898763907137443141 2.7922776664691668635 0.2962797679639983528 -4.938654551126635539 0.12513955590203795776 -1.0486389083054916682 4.9419161769965356257 -0.77836211152309697781 1.0644123620550933751 0.029023468630678395108 -1.4699898671296260932 -0.82173264968145287579 -1.8703632800180276519 -2.0089041212770286648 -4.58245039170421542 -1.7530374256486838114 0.68915491714405652246 0.94822816274903698464 -1.0178333736244280505 -0.19659780212039021374 1.0714665034381329889 -0.21318458711245064086 -0.18897604497875694629 3.7094620163950886571 -1.0716860414907212196 -0.65412248419648655329 -2.717537845461956536 -2.5747619913579975481 -1.0971634661686733292 0.58368126909829709525 -1.4293774416629880797 -0.80308181509847842428 -1.5337360989960260316 -0.31979313421663779771 0.5436298621062847225 -0.29339967906170794087 0.2363127763383045532 -0.22388583396817662852 -0.15059775717833276398 0.39305375661650271413 0.27957257716302924555 0.66472247539079676315 -1.5223901010591553984 0.78896644397733695087 0.9905414862746475535 -3.4154074538096059754 3.521517079514904669 -1.6125409734582512034 3.1779978106952433414 -1.318383865739587435 -2.934196182177536194 0.9107877727332662765 0.033579259160348887137 -0.95929210460615288447 0.58019447491286280094 -0.041802567220829672801 -1.6883288119612522848 0.95713091760699020583 0.75431983223752485657 1.8237139055358064788;-9.2639991758690136692 1.6062528165698983784 -0.29359885504263216749 -0.98970732632598634737 -2.4411838289328446905 -2.2991667125756620749 5.522726443559213827 4.2862801393284444273 -2.6895769691220996478 0.25645765010276455609 3.0746329369765836859 -3.2913361142386579061 6.0188802908805492109 -0.3280514217311245595 -0.2428999186394594223 -0.09280579441258235418 0.1782496572256501155 -0.098938050899380972081 -0.2440233873838487666 5.6481462919921616717 -1.3450046430045332624 3.115459781136942663 -1.6150103989133088866 0.10161664711949745799 -1.5084560149749526303 7.3733282387124985391 0.79205093209238119911 -0.93192031714437217893 0.041409974723765757831 0.65365404120333847615 -0.12389224460161758767 0.34406658337245332735 -0.3001563864864412734 -0.22994941085980999396 -0.38423448052095499072 -0.026692602486894770331 -2.020117631492505339 -0.76347457421001085898 0.04719116152909871853 0.85854948064966807308 -0.17846495420403241106 -1.0640585859507716293 1.7762934648869219689 -0.90841771916226221606 0.23134080695579889442 0.10000667911722965764 0.039571885094156433738 -0.099121703953828549372 0.23717976734544776729 0.29384778658015320296 0.14980363425470827332 0.23829625131914022873 -0.13710284419180757132 0.094552446953185459444 0.52152784380119976415 0.032697513553176904555 2.7937295984014509642 2.5363939652182834195 -3.5337446680089334983 0.9415534937471607968 -0.74046436507101209834 4.3861822157947196743 12.97816352650893279 5.3908734489323260064 4.9541268511879437142 -2.7749104936515993636 -0.018355142203316174299 0.10877380295418401235 1.3120943659658608205 0.093817286491045356889 2.6526636393356159971 0.58349788958556669805 -0.46220267434977757581 2.0089078612021786796 0.30615347728993508314 -0.027343024448034672358 -5.5540748878172401248 14.662855984380673391 0.26553775172681770567 -4.6650195261644373801 8.8097715249407393401 -3.5229258170743977807 7.0480836672493136774 13.115696223803176679 0.28862622045887265099 -0.48037194497109447777 2.2799488718634983719 -0.40034069184210935299 1.3651432949013986295 -0.48368345945348489856 0.15842783019513254072 -0.35192482068552322083 0.06502094683179554524 -0.23815995964995234635 0.93166170775101564416 1.7960634123698373532 1.2762837134526017202 0.097889591910995832347 0.82984672360096589649 -7.4174916963595851627 3.3141478330493816529 1.1588530747605920723 -2.1613888678610067018 2.4002147285795221165 2.5115573784456177719 1.1068815872087085506 1.8408725983712510565 0.36334933009287784245 -0.048402427655004465201 -4.3933813280760176667 -0.10645158039612258316 0.35172570067314196107 -2.4971040069331609246 -3.1104607149836405178 -0.17592177403743330943 -0.16507783094409619884;1.7699193681723306426 1.6513854226645816592 -0.077710780507659338312 2.0477454138773198977 0.46188878122523790992 0.17544457081856590364 1.1431309761817556314 1.8888416987120317803 -0.21576795806797255395 -0.4387319700479725415 -0.22291582010410976311 1.1857021699640091228 1.0677376981367392439 -0.67099403660631329327 1.3249146695602493917 -0.099809630781612798667 0.43224918966941239251 -0.35585810089956476654 -0.77365015869394881953 -1.4658978660597383747 0.53201047260622358337 -0.88678008196974777988 -0.3441690111404821506 -3.6682884446845918092 2.3808854115019753017 1.3875663365640749092 0.38869643694141098322 0.016124273849087655819 -1.8024629494340951297 1.2088801093281709154 1.0600486643409914311 0.99215716114259011604 0.9662338828854336592 0.57716867924502202047 0.41285125648037718227 1.8830472300527509866 1.3072375636001509758 5.9047062569736548099 -0.1167816486212104321 -1.0292481707715983585 -0.91302003688553234895 1.6223030808129361713 -1.026011302202556319 -4.3663392983058475494 0.30654859684801949449 0.19054583862650487092 0.60709552266649902119 -0.67047201153694069298 0.26560499687292543625 -0.035194098505650070474 -0.51983502646879786724 0.36372937238259123172 0.22836993774189678907 -0.11409316653133577679 1.6930372093364693953 -3.2583507834102860556 -0.07254677477378024264 0.1935852094966692416 0.84803357171774873535 -3.5640527699714859011 -0.81139474818163992431 -1.5001631284647509723 -1.9662978298194500049 0.0023227675980565798408 -1.5329304870701030428 -2.3626464289143793707 -1.7071312134515439496 -0.028706843389956826496 -1.9393621032214056754 -0.55857026161867617819 1.0039204329783284475 -0.0112567166356064563 0.23813448421553998213 0.28670532838943413312 0.48268852393190009309 -0.34984597046367610362 1.3330307648399903897 1.2894330623548599934 -0.54215119948743650813 0.10710588417298944064 1.0333795733274362405 -0.92299618659637683304 -0.61853453907253785893 1.4951475259862136991 1.1242303545527827513 -0.63399694470412448766 -4.0786141223369103415 0.15898823902264602737 -1.6032203588638438418 -0.30811899090893762887 0.70226812535439142593 0.33536162026895621757 0.47923821812335459791 0.075672733001049125034 0.10814871721105417945 0.079691918936713720956 -0.28627754394356219603 -0.57239642749487329443 -2.9933898539742926914 -0.13490429959262309478 -6.4993356733899920741 2.022797570160851599 0.19005469917926864909 -0.90023614858047440457 -0.21005595560408441003 0.0069882966458423290135 0.096878302725383558247 0.64037575634225096799 -0.20534107851180460891 -0.63649783457607811421 0.14430301258387395746 0.16740788582969751142 0.39317524935557035537 1.0244852122997674115 0.13858866437399200433 1.4868027785739954538;-0.2553178369540710646 0.92193937134300751879 -0.2458220738674578576 -1.6042107122714934775 1.1307968195312829707 -0.13743895709251674475 0.065068731890760678205 -0.16811513272047839962 0.3996935958277958445 1.3521434707378059414 0.16603939440328541188 1.1517736378164484812 -2.3034251464392503372 -0.77785551458764690125 -0.43104959469691184193 -0.51994597919967677768 0.51381631899315527434 -0.80325847197483490891 2.4859509289141392685 -0.6147948409726048391 0.67736219579208090114 -1.0651879764575249432 4.4258034206309098124 1.2366963461648787792 -2.1569474998510935748 -2.2918212900865473358 -0.4676207578980926538 -0.48015231053656792781 2.6622082670552940087 0.40861694541279586224 0.31266562585644464001 -0.0979315433079768205 0.2603326193363577068 -0.12010980678565164048 -0.39582611185441030077 0.53692629110943335125 -1.5895741548660418108 5.3144077827662172808 -2.563874030450894459 -1.3429117964656342998 -0.02918974306856370049 0.052143266485834449675 -10.069886429584903098 -4.9676089440414745724 -0.44947005294836439582 0.73960594445631566707 -0.026475024537545494008 -0.056634238430322635105 -0.31356920708273433585 -0.89893909945949945772 -0.078396194975177288522 -0.4251732298484240391 1.186452085648106447 -0.39890574748814355832 -1.2567719092478699672 4.6976579499637596271 -0.13177689967739952825 -0.35009857212758521694 -0.29309224980238041125 0.34738597444749713672 -0.057180635486434372439 0.9679449460400275651 2.9049691078493431462 0.19331591256337116169 -2.2316022179949999149 2.5044471829381289574 -0.8356479882679278548 0.67351119314634400048 2.1092420613690361364 -0.90530993960429373413 1.420949657603067795 0.13476192710856596535 -0.36557232376932474738 -1.134127499525409144 0.55157957085861097912 -0.65450723289410117633 1.545396650664067062 0.72338860572128993454 -1.1675842179771918072 0.65385344310919324418 -0.39879555308636982502 0.45270635951311899436 0.34143513393976376857 -0.077108616985257172338 -2.1968680520389174404 -0.01536616789124500837 -1.0440232967991756041 -2.7231890980910997691 -2.9017248922710319192 -0.63570048371264631371 1.46558948501267583 -0.56122808560412806855 0.77170105311788450564 -0.27098875293026597477 1.6855035548391710254 -1.6212402209059653124 0.88885340012213021055 0.48067947798418536598 -5.0010415133641359375 -1.1318728038877321485 1.6764628974144075713 -0.96358664565056850737 -2.185412587595446432 -0.48675189556621623055 0.81213030005715958204 0.22164539591048323941 1.0492890592872590183 -0.95735686606186942704 0.37749170732242270931 -0.54001109625130827574 0.1803721229098171619 0.82723669092428653293 -0.16589780646766977279 -0.037366204291397753234 -0.87793244006754611597 1.8517541259595722281;-8.7576262883330642239 -2.6615127441321084767 -0.19740059889091046696 0.59356575615307982652 0.18296910373164104735 9.3516863525737914387 2.4725245792962460278 0.96678667950291719002 -3.4705967074180481546 0.41252570706145907931 -0.2723991003605700234 -3.9374940257761585904 5.9215219954944453562 -1.0837122213736596343 -0.71158105421467465757 -0.71859254327825727859 0.56220249219869500301 -0.78435163556231435322 -0.7524672479862712926 -0.55477297476830944589 0.035889719225356359056 0.86408733947650195883 -1.7034196465319737523 -0.83323590866993280102 -2.5384976095301312604 -1.7371283458894857255 -1.692371154632502428 0.98594361028097043942 2.4464595766790599995 -2.4995749335151233872 1.5390775814872812433 -0.66451745634506032001 0.44883886448414866965 -1.37870957381202075 0.73599196963846691411 -0.7136966086622889005 -0.18352116509143401313 -6.8738041360527830648 0.41849203368620985222 -2.1021223321738604639 5.7170587207787404438 0.40041305204244376226 7.1089790895439488594 -0.61182048389777787811 1.2318751413048785182 -0.19784608921057469932 1.0365987960346669805 1.6970631205331125901 2.1839844168298383487 0.29560928334873404211 -0.62421126714018604353 0.39196368372546036563 0.89670668813396825492 0.26378348528327688616 -0.19027638601739060853 0.10411701498266706656 1.3260487104087619326 1.6313772344613670651 -1.2114817703030305029 9.9289173533861205811 0.29973293839319659071 1.1287051420952436409 -1.5302828663700909217 0.55609822558075749921 2.3162011845479648642 -0.43166193516045736622 1.6111973782593336235 0.26364653018973494003 -0.28833288594490685819 1.7836916443981476466 -0.48353463683065162071 0.57128584875099175377 -0.34550430506782714435 2.0332565960411215222 0.57166905699602932334 -0.80439833308252850497 -1.5376994648203987648 0.31669322347230921544 0.62800864006894230318 -0.27342131154673565696 -1.5479961837527498325 0.91398477972622660381 5.7095897286940306969 9.0859995769721226822 1.8680127078024919562 1.0438546538170911937 9.3127776884062996032 2.0110211568782148106 4.6429038518711607253 -0.73642101327794429189 -0.80960170847258428051 -1.0966747314944300662 0.57810840010976960457 -0.44911060538925734464 -0.50287906330633624918 0.34187684425975412017 -0.81782732478703179524 1.577166593142754536 3.6570673279881766859 0.075987907077455951743 5.1596710330038675352 -2.4333725085332194027 -1.6569227005575948297 1.6903334181465172747 2.489301664367953304 0.65185777876801431763 1.8404144079619215724 -0.0231119189681222581 -1.3439861466413334234 0.21727421199841057131 -1.0084437174587115305 0.49464789531937986 -2.1678478708085329174 -0.91918617292922077944 -0.08201639588307377271 0.90319857509993617395;0.079764824226704555965 1.9582737194383357249 -2.136048454472701863 -0.52813835283451737723 -0.4271762133774385517 1.0476406794136225997 -3.200046870428654433 0.20065628298905446858 1.4589929816923703498 1.4732797769497771867 1.031182361875399689 1.3367948108880143288 -2.0649431181368558264 -1.1570230450812157841 -1.5585268668533229786 -1.6110978157972475344 1.6734568888705356748 -1.4019655523676000097 1.4386489452659187993 -0.51711880466116044719 -0.30283002866485125848 0.83322342216917699709 0.25028483433487436205 1.4401811122373331386 3.8258507669039061305 4.5915906030150805961 1.4125211921590272723 0.67418649868464597397 3.7298504948472261944 1.5067702408533358849 0.87678449444377237754 0.051402472077637650916 -0.93747535941451842767 -0.65895876371629946711 0.65152138181786423132 -0.47294455153428421879 0.087480676074169788636 -0.79171273258077645707 -0.11377175207812705027 -2.0436369850514104485 -1.1288769236247115924 -0.034328806202774023171 -11.554300690029661425 5.6617985780910480287 -0.46276093602468781896 0.69292357730015274875 -0.74763929912416482448 -0.37510897967565259847 -0.34067024934140166526 -0.78310014330664090565 -0.43361805571265965575 -1.0239787016785648621 0.8890341057072896902 -1.0365648870444845731 1.7078376913247106383 2.5378822222273678122 -1.501974881815705487 -1.5618886487928067552 -6.9297809477027225711 -5.4731816060753475384 3.1378936167956790193 0.85463812581649900579 -0.80682235480747355183 3.8924869046187069443 -1.1288293698756211025 1.4859131882840270755 1.1186976039827420948 1.4028921101881752787 -0.42826317278337328043 1.0032435413902514032 -0.087577477522904123575 1.3090962711093703241 -1.4974464830729199427 -0.45543838484167681324 1.5566608634062166772 -1.5728950528584735302 -1.9380071503588918169 0.48596270499434485179 0.57899856185804321473 1.7059939258306995313 4.5082441018015666501 -0.19358792095446936132 -1.231036268522274213 0.19322155148832487193 3.4785238762134671475 0.98246968846914017881 0.52800702172859537153 1.4807009092115763771 -2.2579956575075317282 -1.341670158797133805 -0.94832033499913981345 -1.0961888801948713734 1.3683754112379644674 -1.0753466165869915994 0.62084612025930641099 -0.54121820512478047149 0.096510314341107433789 -1.52575198209713081 0.56247963684425883457 1.3517721000104594431 -1.5298037623167231036 1.1960701347177202791 3.149121760322695085 -0.96197486782967955854 -0.99005822244186048042 -0.92168721985740675873 0.21450090385122011494 0.68510632073590493896 4.0107157073254064983 -2.8340538096296556958 -1.8696404979148084635 1.4770857688431289212 1.1452469946100283238 0.51225286264719571694 0.67901164006652270366 0.62325446149075935942;1.262914684726831549 2.3330149185874922146 -0.077633290457402290285 0.98819723895869382435 0.30792046188585742161 1.0736403739907300903 0.83387519631874895687 1.9034635937937944838 -1.779518853941392198 0.19651069085797218117 -4.787356411007555046 -3.0303395400303321239 1.238143227908107491 0.6150483837588297531 -0.64816622858462102919 0.61767752168989009665 -0.51170548656952852262 0.52746823806081444275 -2.5207899038641032874 -1.7966714608630729444 0.65881741523418457795 3.776367761780181187 -2.2102884900824788517 -4.6346479413054897378 1.9315336047580888845 1.1964336270397886164 -0.035131619058044794013 -0.30764191886514491436 -1.4321563234382395091 0.59458658649896145576 -3.5670422365700575895 -1.4525890648748904788 0.014463764795539596486 -0.88985821536104003915 -1.6435004073248842271 -0.62955809263503847983 1.3549140219175050959 6.8520206227248081632 -0.15882555374004095339 -0.37208132061200338558 -0.23596781849312753465 1.5532889187955847277 -0.9659552229891381625 -3.9319916166674286906 -0.39024780984996193522 0.5621148262083650593 -1.0356943158272133854 0.3094464110955303382 1.8891305529423987331 0.71914577218675213022 -0.040541167701471397811 -0.14199383701496653964 -0.0045075096487672827728 -0.46818499965882298675 -1.5814275097869925357 -1.4771442892307238282 0.96611112957612654828 0.78758416503020289845 1.0387483250565170412 -5.7514631027150908693 -0.98776429623482420173 -1.4228800138822275123 -0.16074921851290935315 -0.014107457774420392727 -2.2494029233759933462 -2.615056001782477324 3.2150129966842664331 -0.36343310907208181693 2.4642626981913444695 0.92699999741071104076 0.92693940609183200774 -0.78407029084849644285 0.081668309402632366378 -0.0048919231015761566184 -1.6690277104641579875 0.26537556123397049168 1.4771939152404653939 1.5936459455140796759 -0.60651541146540643989 0.15812392120139040497 0.54489608755780305493 -0.80578553979813960506 -1.2009652940792092668 0.54447676898733410322 0.31633534733008428219 1.1499575216646149567 -2.1158767380054586127 0.84372225904804065699 -3.0180824514229662725 0.16781045953153334027 -1.2035494832153184053 -0.79664491122411540402 -1.23974515077437486 -0.0092313731441071369965 0.18784668100217036257 0.063636136539565082981 -0.23194040812210789393 -0.93293110113032651221 -4.8099474037350029576 0.018924667694580166871 -7.7511159944914354014 2.2248360040008750005 1.2015013776389260602 -2.5125769585285020469 0.036040474517722520531 0.38706679151491407698 -0.33096018784999015061 1.3155747955359482493 -0.17326729708583279987 -0.68245475941215816285 0.13850516063859535931 0.34079706362892336902 4.0143377988490156483 -2.1873876652637989082 0.43100679810136999226 1.421048995951863958;-0.23120473268119917654 -1.6021336225048952162 1.2944345274341300112 0.35623331441389460839 0.43267572346220140034 -0.36371443801703506882 2.1036667846319865305 -0.28784427326504080646 -0.64989954624525769766 -0.60478277675780067746 0.61942722034334407599 -0.78213615097486222094 0.2083592303438435156 0.14443982848740871683 0.29708269227129296963 0.11332321058682286175 -0.27693363709364116065 0.4033253859851199663 0.55591513313464369084 -0.28806281509483711023 0.28983996123039773574 0.034645308969950772138 1.1759002903268482854 -0.97137212338056011518 1.8792479838957221183 0.41063101393827072805 -0.89726408551134595459 0.3623311161543949499 0.90040535572076896287 -0.43997038255506842885 -0.33078442625270404465 -0.51973896507107619769 0.50779270218317640317 0.077308157597150761742 -0.037949460154804895429 0.50862828381810953893 -0.0063415400624654699735 6.9434741309553036359 -0.55365055256622253133 -1.1408462874684917043 0.35894439359593299788 -0.13547860447014514751 -5.4352725313539114183 -0.60926780687580239793 -0.13904714518797584022 -0.68650892149284747923 -0.44569701523460092396 -0.49631592530051593659 -0.52659462118046229673 0.96556458899771224758 1.438140934389232406 0.56189518179986830404 -0.99497227778097330209 1.3095973580381117252 2.1943274505126830753 1.6392083260897660768 -0.86996007171737810282 -0.68835847794701843227 0.3366517615994028545 4.6671956508254446305 -1.1279122317361207628 1.7906060484836736624 4.5046796467215566295 0.77980356872907585775 0.19431106841262166252 0.81875400016065613684 -0.40294289234331748251 -0.00059529093853827319549 -0.3897091671719945527 -0.51120845977919149306 -0.43562080021044480294 -0.17385262973553183841 0.34105554275397176323 -3.7490633837703111197 -0.44074923312279706833 0.30807700302989693419 1.399471864637855445 0.23893629763194468296 -0.28498531970391233203 1.415326156081232023 1.2970980143839923038 -0.211035253401409717 -8.1239802742748068454 -4.0121878584384411681 0.65130986812997904156 -0.47492299157615919247 -3.3165634986077137114 -0.46447879398316693766 -2.361191520882245598 0.055061766024310801471 0.38565426555539294995 0.37330409536989389574 -0.26024937410187931608 0.24187654603906294515 -0.79166222707011002502 0.97115851454586499258 -1.2610745001514456209 0.044742482942776495847 0.25979043483649316704 -0.38058404744649731999 4.4307141874533346737 -4.2897416945920916476 -0.8443908222417169096 -0.019699309746855554748 0.73148146676965697388 1.0111965290612379142 -0.16385661647253024764 0.93647919870619200644 -6.0000576979527497912 -2.0908419937636750774 1.1595314536992440413 -0.71205270511781659781 -1.0388538170064913757 -0.99019341304456587327 0.39079469631593344303 0.006639580631596260496;0.20651550319137521039 1.8605919460194637605 0.0081159688820495456962 1.4953466436125093519 -1.2595401425461369982 1.3249390690084847932 -0.76111921800476012301 -0.17560653684253502149 -1.773933178461827076 0.11933883849845194902 1.8662740603871028622 -0.11128419196499694799 -0.6222087256595458804 0.98271451497396800079 1.5965275187180147931 1.1812301178521626976 -1.3523511262732526017 1.1635740675558021717 1.3325296479373869296 0.57016742198592162971 -0.66321001892035025271 2.3889648768156752645 0.17113597570784488955 0.56104584877914320806 1.3196626023628805768 1.5093080814716914873 -1.0101427972627705643 0.68882964014256686802 0.25824530872747364363 -0.59209096779650216558 -0.94832722581064843315 -0.4728470058949833521 -1.6989231962019060163 -1.2010787364887884898 0.66455009366225037404 1.1321296765670831874 -1.5277954127330881651 -4.7218494201421385981 2.3934048351730323745 1.0080931890246502824 1.516480022444393061 -0.66443856190284511509 20.151017450399734798 -11.688456290753643785 0.44295101219620580668 -0.7795258275187066932 -0.32801800043837375798 0.64318127364331911799 -0.88397117831790372744 0.74643062805936510884 1.2909299677144976393 0.72567072584344249897 -0.22982094577493566989 1.0104893611421965627 -8.0373620911852423632 -1.1175373203773433239 -0.88683723794296276388 -0.56814525738048271553 -0.10447424507615171718 0.38404702754696079525 0.17427332895218736186 -0.70320681759665859545 -2.3184954986245704944 -0.0041384485815607746639 -1.5571235045431872646 -2.7329093712866603383 -0.75214406069388872744 -0.5555258897204400359 1.6666283894563669321 -0.0068297539227650805316 -1.2704264271979355261 -1.377130497410966159 1.5539497133460722367 1.0753144101739557925 -0.77198092313933330821 1.582846300127739525 -1.5722122742318649369 -0.72933779506527307568 1.2338750419951198811 0.12648785861650896356 0.82631927834648077891 -0.49872568842212955387 -0.28246009453505727116 -0.15333422148433006882 3.2471358419870579581 -1.6113541815656091671 2.2242839856042708746 0.62301725400947294276 -0.67755559556793554243 1.3259958375050997503 3.1009254457498416357 1.4513178261251249435 0.84733137600252816934 1.0970931073167928815 -1.5241616009577028112 2.8831375259847678016 -0.99173430224574343761 -0.75657946328776570777 3.8507721722835892564 1.5617018265595354887 -0.97434024021000886773 1.6534781412198631401 0.51074655288303405509 -0.54080736405999352279 -0.12316344066101192478 2.4831008497913567012 -0.019059194937581125373 0.23832990972898543403 -0.41352908515002284595 0.74962123372711397806 -0.02175318329746532553 -0.66983986778978366061 -0.10697135164535963303 -0.053945842181903402857 -3.4903629938199642879 2.7628051417481631624];

% Layer 2
b2 = [-0.93040660905129690672;-0.46455419713213130795;0.097111257783247251218;0.65903758269089429689;0.053685502660787108586;0.82604846539327103638];
LW2_1 = [-0.030949257596564402895 0.0026719028920242898079 0.20292780707585114652 -0.31177486869118420376 0.14097932771902371707 0.91141631726185423634 -2.0391943093473736681 0.35462312288771080659 -1.0111384691415401527 0.10629165228677477095;-0.037282512339555221037 -0.0050039515351224181372 0.17808372217919479774 -0.18958768258170588528 0.2143640378692301951 0.85481486258186833993 -0.71330115967894303086 0.20143727321551432863 -0.19080626504516529085 0.18222267550765391952;-0.080152234190996596297 -0.0075784220004617630292 0.92150722166966725357 -0.32706786034370244343 0.24508805325349281024 0.084237493369016716582 -0.03820277005178234625 0.23688701435637876669 -0.053364200110764078988 0.19963578199370429767;0.52032851994006457108 -0.0009154253639356464689 0.7371667016820686591 -2.1390950039266480864 0.56172367933696665254 0.36446058471202136264 0.26074760356592746602 2.6319109475977047197 -0.15713385513220504142 0.50579237644361552118;1.3176473985114780518 0.39621347754888830428 -0.11328178760758265964 1.8035397236548753597 7.0400303599183100545 -0.2649613460002733234 0.57379304950295573207 -0.68547256474528817094 0.5856128654475484252 6.8437114108936807355;0.21970073730431716186 0.82670905792523718958 -0.14132033219765804954 0.49329056913869634426 4.6409602944473782316 -0.053890689680733551425 0.81078568949530249732 -0.43026526763897787742 0.29268409196868749866 4.565921542637373598];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.02;0.02;0.02;0.0200000311750822;0.02;0.02];
y1_step1.xoffset = [0;0;0;0.000155875168275088;0;0];

% ===== SIMULATION ========

% Dimensions
Q = size(x1,2); % samples

% Input 1
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = repmat(b2,1,Q) + LW2_1*a1;

% Output 1
y1 = mapminmax_reverse(a2,y1_step1);
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end