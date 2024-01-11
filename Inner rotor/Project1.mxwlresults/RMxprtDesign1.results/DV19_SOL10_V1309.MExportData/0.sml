//         Left: A B C N
//        Right: ROT1 ROT2 Pos

// A           : Phase A
// B           : Phase B
// C           : Phase C
// N           : Neutral
// ROT1        : Mechanical plus
// ROT2        : Mechanical minus
// Pos         : Position

MODELDEF Setup1
{
PORT electrical: A;
PORT electrical: B;
PORT electrical: C;
PORT electrical: N;
PORT ROTATIONAL_V: ROT1;
PORT ROTATIONAL_V: ROT2;
PORT REAL OUT ANGLE[deg]: Pos = VM_Pos.V;
PORT REAL IN ANGLE[deg]: IniPos = 0;

INTERN  R        Ra  N1:=A, N2:=N0_1  ( R:=0.0172621 ); 
INTERN  R        Rb  N1:=B, N2:=N0_2  ( R:=0.0172621 ); 
INTERN  R        Rc  N1:=C, N2:=N0_3  ( R:=0.0172621 ); 
INTERN  L        La  N1:=N0_1, N2:=N0_4  ( L:=4.17001e-005, I0:=0 ); 
INTERN  L        Lb  N1:=N0_2, N2:=N0_5  ( L:=4.17001e-005, I0:=0 ); 
INTERN  L        Lc  N1:=N0_3, N2:=N0_6  ( L:=4.17001e-005, I0:=0 ); 
INTERN  M        Kab  ( L1:= La.L, L2:= Lb.L, K:=-0.441984 ); 
INTERN  M        Kbc  ( L1:= Lb.L, L2:= Lc.L, K:=-0.441984 ); 
INTERN  M        Kca  ( L1:= Lc.L, L2:= La.L, K:=-0.441984 ); 
UMODEL Transformation_3To2 AB0 NAP:=N0_4, NAN:=N, NBP:=N0_5, NBN:=N, NCP:=N0_6, NCN:=N, NALPHA:=alpha, NBETA:=beta, NZERO:=zero () SRC: DLL( File:="Transformation.dll");

INTERN  EV       Speed  N1:=NM_1, N2:=GND  ( QUANT:=Torq.V, FACT:=1 ); 
INTERN  II       Torq  N1:=NM_6, N2:=NM_5  ( QUANT:=Speed.I, FACT:=1 ); 
UMODEL D2D D2D1 N1:=NM_5, N2:=ROT1 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
UMODEL D2D D2D2 N1:=NM_6, N2:=ROT2 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
INTERN  VM       VM_Pos  N1:=NM_2, N2:=GND  ; 
MODEL Setup1_AB0 model1 N_1:=alpha, N_2:=beta, N_3:=zero, N_4:=NM_1, N_5:=NM_2 ( pos0:=IniPos );


//         Left: N_1 N_2 N_3
//        Right: N_4 N_5

MODELDEF Setup1_AB0
{
PORT electrical: N_1;
PORT electrical: N_4;
PORT electrical: N_2;
PORT electrical: N_5;
PORT electrical: N_3;
PORT REAL IN: pos0 = 0;

INTERN  AM       VR1a  N1:=N_1, N2:=N_17  ; 
INTERN  E        BEma  N1:=N_19, N2:=N_17  ( EMF:=N_4.V * N_10.V, PARTDERIV:=1 ); 
INTERN  E        BVa  N1:=N_21, N2:=N_19  ( EMF:=N_23.V*cos(N_8.V) + N_24.V*sin(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VIa  N1:=N_21, N2:=GND  ; 
INTERN  VM       VM_Ea  N1:=N_17, N2:=GND  ; 
INTERN  AM       VR1b  N1:=N_2, N2:=N_18  ; 
INTERN  E        BEmb  N1:=N_20, N2:=N_18  ( EMF:=N_4.V * N_11.V, PARTDERIV:=1 ); 
INTERN  E        BVb  N1:=N_22, N2:=N_20  ( EMF:=N_23.V*sin(N_8.V) - N_24.V*cos(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VIb  N1:=N_22, N2:=GND  ; 
INTERN  VM       VM_Eb  N1:=N_18, N2:=GND  ; 
INTERN  AM       VR0  N1:=N_3, N2:=N_14  ; 
INTERN  E        BEm0  N1:=GND, N2:=N_14  ( EMF:=N_4.V * N_12.V, PARTDERIV:=1 ); 
INTERN  I        BI1d  N1:=GND, N2:=N_23  ( IS:=VIa.I*cos(N_8.V) + VIb.I*sin(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VI1d  N1:=N_23, N2:=N_25  ; 
INTERN  E        BVmd  N1:=N_31, N2:=N_25  ( EMF:=7.0397e-005 * N_4.V * VImq.I, PARTDERIV:=1 ); 
INTERN  L        Lad  N1:=N_31, N2:=N_33  ( L:=1.75992e-005, I0:=0 ); 
INTERN  AM       VImd  N1:=N_33, N2:=GND  ; 
INTERN  I        BI1q  N1:=GND, N2:=N_24  ( IS:=VIa.I*sin(N_8.V) - VIb.I*cos(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VI1q  N1:=N_24, N2:=N_26  ; 
INTERN  E        BVmq  N1:=N_32, N2:=N_26  ( EMF:=-7.0397e-005 * N_4.V * VImd.I, PARTDERIV:=1 ); 
INTERN  L        Laq  N1:=N_32, N2:=N_34  ( L:=1.75992e-005, I0:=0 ); 
INTERN  AM       VImq  N1:=N_34, N2:=GND  ; 
INTERN  I        BTm  N1:=GND, N2:=N_4  ( IS:=(VIa.I*N_10.V + VIb.I*N_11.V), PARTDERIV:=1 ); 
INTERN  R        RT  N1:=N_4, N2:=GND  ( R:=1e12 ); 
INTERN  VM       VM_Speed  N1:=N_4, N2:=GND  ; 
INTERN  IV       Gx  N1:=GND, N2:=N_7  ( QUANT:=VM_Speed.V, FACT:=1 ); 
INTERN  C        Cx  N1:=N_7, N2:=GND  ( C:=1, V0:=pos0*0.0174533 ); 
INTERN  VM       VM_Pos  N1:=N_7, N2:=GND  ; 
INTERN  EV       Ex1  N1:=GND, N2:=N_8  ( QUANT:=VM_Pos.V, FACT:=4 ); 
INTERN  VM       VM_Ex1  N1:=N_8, N2:=GND  ; 
INTERN  EV       Ex2  N1:=GND, N2:=N_5  ( QUANT:=VM_Pos.V, FACT:=57.2958 ); 
INTERN  VM       VM_kea  N1:=N_10, N2:=GND  ; 
INTERN  NDSRC    Pkea N0:=N_10, N1:=GND  ( QUANT:={N_8.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_kea_table pwl TABLE=( 361, 2.61799, 2.63545, 2.6529, 2.67035,\
 2.68781, 2.70526, 2.72271, 2.74017, 2.75762, 2.77507, 2.79253, 2.80998,\
 2.82743, 2.84489, 2.86234, 2.87979, 2.89725, 2.9147, 2.93215, 2.94961,\
 2.96706, 2.98451, 3.00197, 3.01942, 3.03687, 3.05433, 3.07178, 3.08923,\
 3.10669, 3.12414, 3.14159, 3.15905, 3.1765, 3.19395, 3.21141, 3.22886,\
 3.24631, 3.26377, 3.28122, 3.29867, 3.31613, 3.33358, 3.35103, 3.36849,\
 3.38594, 3.40339, 3.42085, 3.4383, 3.45575, 3.47321, 3.49066, 3.50811,\
 3.52557, 3.54302, 3.56047, 3.57792, 3.59538, 3.61283, 3.63028, 3.64774,\
 3.66519, 3.68264, 3.7001, 3.71755, 3.735, 3.75246, 3.76991, 3.78736, 3.80482,\
 3.82227, 3.83972, 3.85718, 3.87463, 3.89208, 3.90954, 3.92699, 3.94444,\
 3.9619, 3.97935, 3.9968, 4.01426, 4.03171, 4.04916, 4.06662, 4.08407, 4.10152,\
 4.11898, 4.13643, 4.15388, 4.17134, 4.18879, 4.20624, 4.2237, 4.24115, 4.2586,\
 4.27606, 4.29351, 4.31096, 4.32842, 4.34587, 4.36332, 4.38078, 4.39823,\
 4.41568, 4.43314, 4.45059, 4.46804, 4.4855, 4.50295, 4.5204, 4.53786, 4.55531,\
 4.57276, 4.59022, 4.60767, 4.62512, 4.64258, 4.66003, 4.67748, 4.69494,\
 4.71239, 4.72984, 4.7473, 4.76475, 4.7822, 4.79966, 4.81711, 4.83456, 4.85202,\
 4.86947, 4.88692, 4.90438, 4.92183, 4.93928, 4.95674, 4.97419, 4.99164,\
 5.00909, 5.02655, 5.044, 5.06145, 5.07891, 5.09636, 5.11381, 5.13127, 5.14872,\
 5.16617, 5.18363, 5.20108, 5.21853, 5.23599, 5.25344, 5.27089, 5.28835,\
 5.3058, 5.32325, 5.34071, 5.35816, 5.37561, 5.39307, 5.41052, 5.42797,\
 5.44543, 5.46288, 5.48033, 5.49779, 5.51524, 5.53269, 5.55015, 5.5676,\
 5.58505, 5.60251, 5.61996, 5.63741, 5.65487, 5.67232, 5.68977, 5.70723,\
 5.72468, 5.74213, 5.75959, 5.77704, 5.79449, 5.81195, 5.8294, 5.84685,\
 5.86431, 5.88176, 5.89921, 5.91667, 5.93412, 5.95157, 5.96903, 5.98648,\
 6.00393, 6.02139, 6.03884, 6.05629, 6.07375, 6.0912, 6.10865, 6.12611,\
 6.14356, 6.16101, 6.17847, 6.19592, 6.21337, 6.23083, 6.24828, 6.26573,\
 6.28319, 6.30064, 6.31809, 6.33555, 6.353, 6.37045, 6.38791, 6.40536, 6.42281,\
 6.44026, 6.45772, 6.47517, 6.49262, 6.51008, 6.52753, 6.54498, 6.56244,\
 6.57989, 6.59734, 6.6148, 6.63225, 6.6497, 6.66716, 6.68461, 6.70206, 6.71952,\
 6.73697, 6.75442, 6.77188, 6.78933, 6.80678, 6.82424, 6.84169, 6.85914,\
 6.8766, 6.89405, 6.9115, 6.92896, 6.94641, 6.96386, 6.98132, 6.99877, 7.01622,\
 7.03368, 7.05113, 7.06858, 7.08604, 7.10349, 7.12094, 7.1384, 7.15585, 7.1733,\
 7.19076, 7.20821, 7.22566, 7.24312, 7.26057, 7.27802, 7.29548, 7.31293,\
 7.33038, 7.34784, 7.36529, 7.38274, 7.4002, 7.41765, 7.4351, 7.45256, 7.47001,\
 7.48746, 7.50492, 7.52237, 7.53982, 7.55728, 7.57473, 7.59218, 7.60964,\
 7.62709, 7.64454, 7.662, 7.67945, 7.6969, 7.71436, 7.73181, 7.74926, 7.76672,\
 7.78417, 7.80162, 7.81908, 7.83653, 7.85398, 7.87143, 7.88889, 7.90634,\
 7.92379, 7.94125, 7.9587, 7.97615, 7.99361, 8.01106, 8.02851, 8.04597,\
 8.06342, 8.08087, 8.09833, 8.11578, 8.13323, 8.15069, 8.16814, 8.18559,\
 8.20305, 8.2205, 8.23795, 8.25541, 8.27286, 8.29031, 8.30777, 8.32522,\
 8.34267, 8.36013, 8.37758, 8.39503, 8.41249, 8.42994, 8.44739, 8.46485,\
 8.4823, 8.49975, 8.51721, 8.53466, 8.55211, 8.56957, 8.58702, 8.60447,\
 8.62193, 8.63938, 8.65683, 8.67429, 8.69174, 8.70919, 8.72665, 8.7441,\
 8.76155, 8.77901, 8.79646, 8.81391, 8.83137, 8.84882, 8.86627, 8.88373,\
 8.90118, 1, 0.0175062, 0.0173386, 0.0171693, 0.0169971, 0.0168209, 0.0166394,\
 0.0164511, 0.0162547, 0.0160485, 0.0158305, 0.0155986, 0.0153501, 0.015082,\
 0.0147902, 0.01447, 0.0141155, 0.0137194, 0.0132727, 0.012765, 0.0121845,\
 0.0115186, 0.0107555, 0.00988635, 0.00890706, 0.0078211, 0.00664013,\
 0.00538288, 0.0040716, 0.00272749, 0.00136686, 0, -0.00136686, -0.00272749,\
 -0.0040716, -0.00538288, -0.00664013, -0.0078211, -0.00890706, -0.00988635,\
 -0.0107555, -0.0115186, -0.0121845, -0.012765, -0.0132727, -0.0137194,\
 -0.0141155, -0.01447, -0.0147902, -0.015082, -0.0153501, -0.0155986,\
 -0.0158305, -0.0160485, -0.0162547, -0.0164511, -0.0166394, -0.0168209,\
 -0.0169971, -0.0171693, -0.0173386, -0.0175062, -0.0176733, -0.0178409,\
 -0.0180102, -0.0181822, -0.0183583, -0.0185395, -0.0187273, -0.0189231,\
 -0.0191284, -0.0193453, -0.0195758, -0.0198227, -0.0200892, -0.0203793,\
 -0.020698, -0.0210514, -0.0214469, -0.0218931, -0.0223995, -0.0229755,\
 -0.0236291, -0.0243648, -0.0251804, -0.0260655, -0.0269995, -0.0279538,\
 -0.0288948, -0.0297898, -0.0306122, -0.0313445, -0.0319791, -0.0325173,\
 -0.0329664, -0.0333367, -0.0336397, -0.0338866, -0.0340875, -0.0342511,\
 -0.0343847, -0.034494, -0.0345839, -0.0346581, -0.0347196, -0.0347708,\
 -0.0348135, -0.0348493, -0.0348794, -0.0349047, -0.034926, -0.0349439,\
 -0.034959, -0.0349716, -0.034982, -0.0349906, -0.0349976, -0.0350031,\
 -0.0350073, -0.0350101, -0.0350119, -0.0350124, -0.0350119, -0.0350101,\
 -0.0350073, -0.0350031, -0.0349976, -0.0349906, -0.034982, -0.0349716,\
 -0.034959, -0.0349439, -0.034926, -0.0349047, -0.0348794, -0.0348493,\
 -0.0348135, -0.0347708, -0.0347196, -0.0346581, -0.0345839, -0.034494,\
 -0.0343847, -0.0342511, -0.0340875, -0.0338866, -0.0336397, -0.0333367,\
 -0.0329664, -0.0325173, -0.0319791, -0.0313445, -0.0306122, -0.0297898,\
 -0.0288948, -0.0279538, -0.0269995, -0.0260655, -0.0251804, -0.0243648,\
 -0.0236291, -0.0229755, -0.0223995, -0.0218931, -0.0214469, -0.0210514,\
 -0.020698, -0.0203793, -0.0200892, -0.0198227, -0.0195758, -0.0193453,\
 -0.0191284, -0.0189231, -0.0187273, -0.0185395, -0.0183583, -0.0181822,\
 -0.0180102, -0.0178409, -0.0176733, -0.0175062, -0.0173386, -0.0171693,\
 -0.0169971, -0.0168209, -0.0166394, -0.0164511, -0.0162547, -0.0160485,\
 -0.0158305, -0.0155986, -0.0153501, -0.015082, -0.0147902, -0.01447,\
 -0.0141155, -0.0137194, -0.0132727, -0.012765, -0.0121845, -0.0115186,\
 -0.0107555, -0.00988635, -0.00890706, -0.0078211, -0.00664013, -0.00538288,\
 -0.0040716, -0.00272749, -0.00136686, 0, 0.00136686, 0.00272749, 0.0040716,\
 0.00538288, 0.00664013, 0.0078211, 0.00890706, 0.00988635, 0.0107555,\
 0.0115186, 0.0121845, 0.012765, 0.0132727, 0.0137194, 0.0141155, 0.01447,\
 0.0147902, 0.015082, 0.0153501, 0.0155986, 0.0158305, 0.0160485, 0.0162547,\
 0.0164511, 0.0166394, 0.0168209, 0.0169971, 0.0171693, 0.0173386, 0.0175062,\
 0.0176733, 0.0178409, 0.0180102, 0.0181822, 0.0183583, 0.0185395, 0.0187273,\
 0.0189231, 0.0191284, 0.0193453, 0.0195758, 0.0198227, 0.0200892, 0.0203793,\
 0.020698, 0.0210514, 0.0214469, 0.0218931, 0.0223995, 0.0229755, 0.0236291,\
 0.0243648, 0.0251804, 0.0260655, 0.0269995, 0.0279538, 0.0288948, 0.0297898,\
 0.0306122, 0.0313445, 0.0319791, 0.0325173, 0.0329664, 0.0333367, 0.0336397,\
 0.0338866, 0.0340875, 0.0342511, 0.0343847, 0.034494, 0.0345839, 0.0346581,\
 0.0347196, 0.0347708, 0.0348135, 0.0348493, 0.0348794, 0.0349047, 0.034926,\
 0.0349439, 0.034959, 0.0349716, 0.034982, 0.0349906, 0.0349976, 0.0350031,\
 0.0350073, 0.0350101, 0.0350119, 0.0350124, 0.0350119, 0.0350101, 0.0350073,\
 0.0350031, 0.0349976, 0.0349906, 0.034982, 0.0349716, 0.034959, 0.0349439,\
 0.034926, 0.0349047, 0.0348794, 0.0348493, 0.0348135, 0.0347708, 0.0347196,\
 0.0346581, 0.0345839, 0.034494, 0.0343847, 0.0342511, 0.0340875, 0.0338866,\
 0.0336397, 0.0333367, 0.0329664, 0.0325173, 0.0319791, 0.0313445, 0.0306122,\
 0.0297898, 0.0288948, 0.0279538, 0.0269995, 0.0260655, 0.0251804, 0.0243648,\
 0.0236291, 0.0229755, 0.0223995, 0.0218931, 0.0214469, 0.0210514, 0.020698,\
 0.0203793, 0.0200892, 0.0198227, 0.0195758, 0.0193453, 0.0191284, 0.0189231,\
 0.0187273, 0.0185395, 0.0183583, 0.0181822, 0.0180102, 0.0178409, 0.0176733,\
 0.0175062) PERIODIC NOSPLINE" );
INTERN  VM       VM_keb  N1:=N_11, N2:=GND  ; 
INTERN  NDSRC    Pkeb N0:=N_11, N1:=GND  ( QUANT:={N_8.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_keb_table pwl TABLE=( 361, 2.61799, 2.63545, 2.6529, 2.67035,\
 2.68781, 2.70526, 2.72271, 2.74017, 2.75762, 2.77507, 2.79253, 2.80998,\
 2.82743, 2.84489, 2.86234, 2.87979, 2.89725, 2.9147, 2.93215, 2.94961,\
 2.96706, 2.98451, 3.00197, 3.01942, 3.03687, 3.05433, 3.07178, 3.08923,\
 3.10669, 3.12414, 3.14159, 3.15905, 3.1765, 3.19395, 3.21141, 3.22886,\
 3.24631, 3.26377, 3.28122, 3.29867, 3.31613, 3.33358, 3.35103, 3.36849,\
 3.38594, 3.40339, 3.42085, 3.4383, 3.45575, 3.47321, 3.49066, 3.50811,\
 3.52557, 3.54302, 3.56047, 3.57792, 3.59538, 3.61283, 3.63028, 3.64774,\
 3.66519, 3.68264, 3.7001, 3.71755, 3.735, 3.75246, 3.76991, 3.78736, 3.80482,\
 3.82227, 3.83972, 3.85718, 3.87463, 3.89208, 3.90954, 3.92699, 3.94444,\
 3.9619, 3.97935, 3.9968, 4.01426, 4.03171, 4.04916, 4.06662, 4.08407, 4.10152,\
 4.11898, 4.13643, 4.15388, 4.17134, 4.18879, 4.20624, 4.2237, 4.24115, 4.2586,\
 4.27606, 4.29351, 4.31096, 4.32842, 4.34587, 4.36332, 4.38078, 4.39823,\
 4.41568, 4.43314, 4.45059, 4.46804, 4.4855, 4.50295, 4.5204, 4.53786, 4.55531,\
 4.57276, 4.59022, 4.60767, 4.62512, 4.64258, 4.66003, 4.67748, 4.69494,\
 4.71239, 4.72984, 4.7473, 4.76475, 4.7822, 4.79966, 4.81711, 4.83456, 4.85202,\
 4.86947, 4.88692, 4.90438, 4.92183, 4.93928, 4.95674, 4.97419, 4.99164,\
 5.00909, 5.02655, 5.044, 5.06145, 5.07891, 5.09636, 5.11381, 5.13127, 5.14872,\
 5.16617, 5.18363, 5.20108, 5.21853, 5.23599, 5.25344, 5.27089, 5.28835,\
 5.3058, 5.32325, 5.34071, 5.35816, 5.37561, 5.39307, 5.41052, 5.42797,\
 5.44543, 5.46288, 5.48033, 5.49779, 5.51524, 5.53269, 5.55015, 5.5676,\
 5.58505, 5.60251, 5.61996, 5.63741, 5.65487, 5.67232, 5.68977, 5.70723,\
 5.72468, 5.74213, 5.75959, 5.77704, 5.79449, 5.81195, 5.8294, 5.84685,\
 5.86431, 5.88176, 5.89921, 5.91667, 5.93412, 5.95157, 5.96903, 5.98648,\
 6.00393, 6.02139, 6.03884, 6.05629, 6.07375, 6.0912, 6.10865, 6.12611,\
 6.14356, 6.16101, 6.17847, 6.19592, 6.21337, 6.23083, 6.24828, 6.26573,\
 6.28319, 6.30064, 6.31809, 6.33555, 6.353, 6.37045, 6.38791, 6.40536, 6.42281,\
 6.44026, 6.45772, 6.47517, 6.49262, 6.51008, 6.52753, 6.54498, 6.56244,\
 6.57989, 6.59734, 6.6148, 6.63225, 6.6497, 6.66716, 6.68461, 6.70206, 6.71952,\
 6.73697, 6.75442, 6.77188, 6.78933, 6.80678, 6.82424, 6.84169, 6.85914,\
 6.8766, 6.89405, 6.9115, 6.92896, 6.94641, 6.96386, 6.98132, 6.99877, 7.01622,\
 7.03368, 7.05113, 7.06858, 7.08604, 7.10349, 7.12094, 7.1384, 7.15585, 7.1733,\
 7.19076, 7.20821, 7.22566, 7.24312, 7.26057, 7.27802, 7.29548, 7.31293,\
 7.33038, 7.34784, 7.36529, 7.38274, 7.4002, 7.41765, 7.4351, 7.45256, 7.47001,\
 7.48746, 7.50492, 7.52237, 7.53982, 7.55728, 7.57473, 7.59218, 7.60964,\
 7.62709, 7.64454, 7.662, 7.67945, 7.6969, 7.71436, 7.73181, 7.74926, 7.76672,\
 7.78417, 7.80162, 7.81908, 7.83653, 7.85398, 7.87143, 7.88889, 7.90634,\
 7.92379, 7.94125, 7.9587, 7.97615, 7.99361, 8.01106, 8.02851, 8.04597,\
 8.06342, 8.08087, 8.09833, 8.11578, 8.13323, 8.15069, 8.16814, 8.18559,\
 8.20305, 8.2205, 8.23795, 8.25541, 8.27286, 8.29031, 8.30777, 8.32522,\
 8.34267, 8.36013, 8.37758, 8.39503, 8.41249, 8.42994, 8.44739, 8.46485,\
 8.4823, 8.49975, 8.51721, 8.53466, 8.55211, 8.56957, 8.58702, 8.60447,\
 8.62193, 8.63938, 8.65683, 8.67429, 8.69174, 8.70919, 8.72665, 8.7441,\
 8.76155, 8.77901, 8.79646, 8.81391, 8.83137, 8.84882, 8.86627, 8.88373,\
 8.90118, 1, 0.0303216, 0.0304178, 0.0305136, 0.0306096, 0.0307066, 0.030805,\
 0.0309057, 0.0310091, 0.0311161, 0.0312274, 0.0313439, 0.0314666, 0.0315969,\
 0.0317361, 0.0318862, 0.0320496, 0.0322289, 0.0324277, 0.0326499, 0.0328994,\
 0.0331801, 0.0334943, 0.0338419, 0.0342184, 0.0346133, 0.0350101, 0.0353861,\
 0.0357156, 0.035973, 0.0361371, 0.0361935, 0.0361371, 0.035973, 0.0357156,\
 0.0353861, 0.0350101, 0.0346133, 0.0342184, 0.0338419, 0.0334943, 0.0331801,\
 0.0328994, 0.0326499, 0.0324277, 0.0322289, 0.0320496, 0.0318862, 0.0317361,\
 0.0315969, 0.0314666, 0.0313439, 0.0312274, 0.0311161, 0.0310091, 0.0309057,\
 0.030805, 0.0307066, 0.0306096, 0.0305136, 0.0304178, 0.0303216, 0.0302245,\
 0.0301258, 0.0300247, 0.0299206, 0.0298126, 0.0296999, 0.0295816, 0.0294564,\
 0.0293233, 0.0291807, 0.0290269, 0.0288598, 0.0286767, 0.0284745, 0.0282492,\
 0.0279958, 0.0277084, 0.0273798, 0.0270017, 0.0265654, 0.0260617, 0.0254828,\
 0.0248229, 0.0240799, 0.0232555, 0.0223547, 0.0213839, 0.0203486, 0.0192523,\
 0.0180968, 0.0168848, 0.0156244, 0.0143317, 0.0130313, 0.0117545, 0.0105334,\
 0.00939544, 0.00835913, 0.00743258, 0.00661466, 0.00589764, 0.00527011,\
 0.00471937, 0.00423313, 0.00380038, 0.00341172, 0.00305938, 0.00273707,\
 0.00243969, 0.00216313, 0.00190404, 0.00165962, 0.00142753, 0.00120573,\
 0.000992415, 0.000785968, 0.000584886, 0.000387757, 0.000193232, 0,\
 -0.000193232, -0.000387757, -0.000584886, -0.000785968, -0.000992415,\
 -0.00120573, -0.00142753, -0.00165962, -0.00190404, -0.00216313, -0.00243969,\
 -0.00273707, -0.00305938, -0.00341172, -0.00380038, -0.00423313, -0.00471937,\
 -0.00527011, -0.00589764, -0.00661466, -0.00743258, -0.00835913, -0.00939544,\
 -0.0105334, -0.0117545, -0.0130313, -0.0143317, -0.0156244, -0.0168848,\
 -0.0180968, -0.0192523, -0.0203486, -0.0213839, -0.0223547, -0.0232555,\
 -0.0240799, -0.0248229, -0.0254828, -0.0260617, -0.0265654, -0.0270017,\
 -0.0273798, -0.0277084, -0.0279958, -0.0282492, -0.0284745, -0.0286767,\
 -0.0288598, -0.0290269, -0.0291807, -0.0293233, -0.0294564, -0.0295816,\
 -0.0296999, -0.0298126, -0.0299206, -0.0300247, -0.0301258, -0.0302245,\
 -0.0303216, -0.0304178, -0.0305136, -0.0306096, -0.0307066, -0.030805,\
 -0.0309057, -0.0310091, -0.0311161, -0.0312274, -0.0313439, -0.0314666,\
 -0.0315969, -0.0317361, -0.0318862, -0.0320496, -0.0322289, -0.0324277,\
 -0.0326499, -0.0328994, -0.0331801, -0.0334943, -0.0338419, -0.0342184,\
 -0.0346133, -0.0350101, -0.0353861, -0.0357156, -0.035973, -0.0361371,\
 -0.0361935, -0.0361371, -0.035973, -0.0357156, -0.0353861, -0.0350101,\
 -0.0346133, -0.0342184, -0.0338419, -0.0334943, -0.0331801, -0.0328994,\
 -0.0326499, -0.0324277, -0.0322289, -0.0320496, -0.0318862, -0.0317361,\
 -0.0315969, -0.0314666, -0.0313439, -0.0312274, -0.0311161, -0.0310091,\
 -0.0309057, -0.030805, -0.0307066, -0.0306096, -0.0305136, -0.0304178,\
 -0.0303216, -0.0302245, -0.0301258, -0.0300247, -0.0299206, -0.0298126,\
 -0.0296999, -0.0295816, -0.0294564, -0.0293233, -0.0291807, -0.0290269,\
 -0.0288598, -0.0286767, -0.0284745, -0.0282492, -0.0279958, -0.0277084,\
 -0.0273798, -0.0270017, -0.0265654, -0.0260617, -0.0254828, -0.0248229,\
 -0.0240799, -0.0232555, -0.0223547, -0.0213839, -0.0203486, -0.0192523,\
 -0.0180968, -0.0168848, -0.0156244, -0.0143317, -0.0130313, -0.0117545,\
 -0.0105334, -0.00939544, -0.00835913, -0.00743258, -0.00661466, -0.00589764,\
 -0.00527011, -0.00471937, -0.00423313, -0.00380038, -0.00341172, -0.00305938,\
 -0.00273707, -0.00243969, -0.00216313, -0.00190404, -0.00165962, -0.00142753,\
 -0.00120573, -0.000992415, -0.000785968, -0.000584886, -0.000387757,\
 -0.000193232, 0, 0.000193232, 0.000387757, 0.000584886, 0.000785968,\
 0.000992415, 0.00120573, 0.00142753, 0.00165962, 0.00190404, 0.00216313,\
 0.00243969, 0.00273707, 0.00305938, 0.00341172, 0.00380038, 0.00423313,\
 0.00471937, 0.00527011, 0.00589764, 0.00661466, 0.00743258, 0.00835913,\
 0.00939544, 0.0105334, 0.0117545, 0.0130313, 0.0143317, 0.0156244, 0.0168848,\
 0.0180968, 0.0192523, 0.0203486, 0.0213839, 0.0223547, 0.0232555, 0.0240799,\
 0.0248229, 0.0254828, 0.0260617, 0.0265654, 0.0270017, 0.0273798, 0.0277084,\
 0.0279958, 0.0282492, 0.0284745, 0.0286767, 0.0288598, 0.0290269, 0.0291807,\
 0.0293233, 0.0294564, 0.0295816, 0.0296999, 0.0298126, 0.0299206, 0.0300247,\
 0.0301258, 0.0302245, 0.0303216) PERIODIC NOSPLINE" );
INTERN  VM       VM_ke0  N1:=N_12, N2:=GND  ; 
INTERN  NDSRC    Pke0 N0:=N_12, N1:=GND  ( QUANT:={N_8.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_ke0_table pwl TABLE=( 361, 2.61799, 2.63545, 2.6529, 2.67035,\
 2.68781, 2.70526, 2.72271, 2.74017, 2.75762, 2.77507, 2.79253, 2.80998,\
 2.82743, 2.84489, 2.86234, 2.87979, 2.89725, 2.9147, 2.93215, 2.94961,\
 2.96706, 2.98451, 3.00197, 3.01942, 3.03687, 3.05433, 3.07178, 3.08923,\
 3.10669, 3.12414, 3.14159, 3.15905, 3.1765, 3.19395, 3.21141, 3.22886,\
 3.24631, 3.26377, 3.28122, 3.29867, 3.31613, 3.33358, 3.35103, 3.36849,\
 3.38594, 3.40339, 3.42085, 3.4383, 3.45575, 3.47321, 3.49066, 3.50811,\
 3.52557, 3.54302, 3.56047, 3.57792, 3.59538, 3.61283, 3.63028, 3.64774,\
 3.66519, 3.68264, 3.7001, 3.71755, 3.735, 3.75246, 3.76991, 3.78736, 3.80482,\
 3.82227, 3.83972, 3.85718, 3.87463, 3.89208, 3.90954, 3.92699, 3.94444,\
 3.9619, 3.97935, 3.9968, 4.01426, 4.03171, 4.04916, 4.06662, 4.08407, 4.10152,\
 4.11898, 4.13643, 4.15388, 4.17134, 4.18879, 4.20624, 4.2237, 4.24115, 4.2586,\
 4.27606, 4.29351, 4.31096, 4.32842, 4.34587, 4.36332, 4.38078, 4.39823,\
 4.41568, 4.43314, 4.45059, 4.46804, 4.4855, 4.50295, 4.5204, 4.53786, 4.55531,\
 4.57276, 4.59022, 4.60767, 4.62512, 4.64258, 4.66003, 4.67748, 4.69494,\
 4.71239, 4.72984, 4.7473, 4.76475, 4.7822, 4.79966, 4.81711, 4.83456, 4.85202,\
 4.86947, 4.88692, 4.90438, 4.92183, 4.93928, 4.95674, 4.97419, 4.99164,\
 5.00909, 5.02655, 5.044, 5.06145, 5.07891, 5.09636, 5.11381, 5.13127, 5.14872,\
 5.16617, 5.18363, 5.20108, 5.21853, 5.23599, 5.25344, 5.27089, 5.28835,\
 5.3058, 5.32325, 5.34071, 5.35816, 5.37561, 5.39307, 5.41052, 5.42797,\
 5.44543, 5.46288, 5.48033, 5.49779, 5.51524, 5.53269, 5.55015, 5.5676,\
 5.58505, 5.60251, 5.61996, 5.63741, 5.65487, 5.67232, 5.68977, 5.70723,\
 5.72468, 5.74213, 5.75959, 5.77704, 5.79449, 5.81195, 5.8294, 5.84685,\
 5.86431, 5.88176, 5.89921, 5.91667, 5.93412, 5.95157, 5.96903, 5.98648,\
 6.00393, 6.02139, 6.03884, 6.05629, 6.07375, 6.0912, 6.10865, 6.12611,\
 6.14356, 6.16101, 6.17847, 6.19592, 6.21337, 6.23083, 6.24828, 6.26573,\
 6.28319, 6.30064, 6.31809, 6.33555, 6.353, 6.37045, 6.38791, 6.40536, 6.42281,\
 6.44026, 6.45772, 6.47517, 6.49262, 6.51008, 6.52753, 6.54498, 6.56244,\
 6.57989, 6.59734, 6.6148, 6.63225, 6.6497, 6.66716, 6.68461, 6.70206, 6.71952,\
 6.73697, 6.75442, 6.77188, 6.78933, 6.80678, 6.82424, 6.84169, 6.85914,\
 6.8766, 6.89405, 6.9115, 6.92896, 6.94641, 6.96386, 6.98132, 6.99877, 7.01622,\
 7.03368, 7.05113, 7.06858, 7.08604, 7.10349, 7.12094, 7.1384, 7.15585, 7.1733,\
 7.19076, 7.20821, 7.22566, 7.24312, 7.26057, 7.27802, 7.29548, 7.31293,\
 7.33038, 7.34784, 7.36529, 7.38274, 7.4002, 7.41765, 7.4351, 7.45256, 7.47001,\
 7.48746, 7.50492, 7.52237, 7.53982, 7.55728, 7.57473, 7.59218, 7.60964,\
 7.62709, 7.64454, 7.662, 7.67945, 7.6969, 7.71436, 7.73181, 7.74926, 7.76672,\
 7.78417, 7.80162, 7.81908, 7.83653, 7.85398, 7.87143, 7.88889, 7.90634,\
 7.92379, 7.94125, 7.9587, 7.97615, 7.99361, 8.01106, 8.02851, 8.04597,\
 8.06342, 8.08087, 8.09833, 8.11578, 8.13323, 8.15069, 8.16814, 8.18559,\
 8.20305, 8.2205, 8.23795, 8.25541, 8.27286, 8.29031, 8.30777, 8.32522,\
 8.34267, 8.36013, 8.37758, 8.39503, 8.41249, 8.42994, 8.44739, 8.46485,\
 8.4823, 8.49975, 8.51721, 8.53466, 8.55211, 8.56957, 8.58702, 8.60447,\
 8.62193, 8.63938, 8.65683, 8.67429, 8.69174, 8.70919, 8.72665, 8.7441,\
 8.76155, 8.77901, 8.79646, 8.81391, 8.83137, 8.84882, 8.86627, 8.88373,\
 8.90118, 1, 0, -2.00309e-018, 0, -2.00309e-018, 2.00309e-018, 0, 0,\
 -2.00309e-018, 0, -2.00309e-018, 2.00309e-018, 0, 0, 0, 0, -2.00309e-018,\
 -2.00309e-018, 0, -4.00617e-018, 0, 0, 2.00309e-018, 0, 0, 0, -2.00309e-018,\
 2.00309e-018, 2.00309e-018, 0, 0, 0, 0, 0, -2.00309e-018, -2.00309e-018,\
 2.00309e-018, 0, 0, 0, 0, 0, 0, 2.00309e-018, 0, 2.00309e-018, 0, 0, 0, 0, 0,\
 -2.00309e-018, 2.00309e-018, 0, 2.00309e-018, 0, 1.00154e-018, -2.00309e-018,\
 2.00309e-018, -1.00154e-018, 2.00309e-018, 0, 2.00309e-018, -1.00154e-018,\
 2.00309e-018, -2.00309e-018, 1.00154e-018, 0, 2.00309e-018, 0, 2.00309e-018,\
 -2.00309e-018, 1.00154e-018, 0, 0, 0, 1.00154e-018, 2.00309e-018,\
 -1.00154e-018, 3.00463e-018, 1.00154e-018, -1.00154e-018, -1.00154e-018, 0,\
 5.00772e-019, 0, 1.50231e-018, -2.00309e-018, -2.00309e-018, -5.00772e-019, 0,\
 0, 0, 5.00772e-019, 2.00309e-018, 2.00309e-018, -1.50231e-018, 0,\
 -5.00772e-019, 0, 1.00154e-018, 1.00154e-018, -1.00154e-018, -3.00463e-018,\
 1.00154e-018, -2.00309e-018, -1.00154e-018, 0, 0, 0, -1.00154e-018,\
 2.00309e-018, -2.00309e-018, 0, -2.00309e-018, 0, -1.00154e-018, 2.00309e-018,\
 -2.00309e-018, 1.00154e-018, -2.00309e-018, 0, -2.00309e-018, 1.00154e-018,\
 -2.00309e-018, 2.00309e-018, -1.00154e-018, 0, -2.00309e-018, 0,\
 -2.00309e-018, 2.00309e-018, 0, 0, 0, 0, 0, -2.00309e-018, 0, -2.00309e-018,\
 0, 0, 0, 0, 0, 0, -2.00309e-018, 2.00309e-018, 2.00309e-018, 0, 0, 0, 0, 0,\
 -2.00309e-018, -2.00309e-018, 2.00309e-018, 0, 0, 0, -2.00309e-018, 0, 0,\
 4.00617e-018, 0, 2.00309e-018, 2.00309e-018, 0, 0, 0, 0, -2.00309e-018,\
 2.00309e-018, 0, 2.00309e-018, 0, 0, -2.00309e-018, 2.00309e-018, 0,\
 2.00309e-018, 0, 2.00309e-018, 0, 2.00309e-018, -2.00309e-018, 0, 0,\
 2.00309e-018, 0, 2.00309e-018, -2.00309e-018, 0, 0, 0, 0, 2.00309e-018,\
 2.00309e-018, 0, 4.00617e-018, 0, 0, -2.00309e-018, 0, 0, 0, 2.00309e-018,\
 -2.00309e-018, -2.00309e-018, 0, 0, 0, 0, 0, 2.00309e-018, 2.00309e-018,\
 -2.00309e-018, 0, 0, 0, 0, 0, 0, -2.00309e-018, 0, -2.00309e-018, 0, 0, 0, 0,\
 0, 2.00309e-018, -2.00309e-018, 0, -2.00309e-018, 0, -1.00154e-018,\
 2.00309e-018, -2.00309e-018, 1.00154e-018, -2.00309e-018, 0, -2.00309e-018,\
 1.00154e-018, -2.00309e-018, 2.00309e-018, -1.00154e-018, 0, -2.00309e-018, 0,\
 -2.00309e-018, 2.00309e-018, -1.00154e-018, 0, 0, 0, -1.00154e-018,\
 -2.00309e-018, 1.00154e-018, -3.00463e-018, -1.00154e-018, 1.00154e-018,\
 1.00154e-018, 0, -5.00772e-019, 0, -1.50231e-018, 2.00309e-018, 2.00309e-018,\
 5.00772e-019, 0, 0, 0, -5.00772e-019, -2.00309e-018, -2.00309e-018,\
 1.50231e-018, 0, 5.00772e-019, 0, -1.00154e-018, -1.00154e-018, 1.00154e-018,\
 3.00463e-018, -1.00154e-018, 2.00309e-018, 1.00154e-018, 0, 0, 0,\
 1.00154e-018, -2.00309e-018, 2.00309e-018, 0, 2.00309e-018, 0, 1.00154e-018,\
 -2.00309e-018, 2.00309e-018, -1.00154e-018, 2.00309e-018, 0, 2.00309e-018,\
 -1.00154e-018, 2.00309e-018, -2.00309e-018, 1.00154e-018, 0, 2.00309e-018, 0,\
 2.00309e-018, -2.00309e-018, 0, 0, 0, 0, 0, 2.00309e-018, 0, 2.00309e-018, 0,\
 0, 0, 0, 0, 0, 2.00309e-018, -2.00309e-018, -2.00309e-018, 0, 0, 0, 0, 0,\
 2.00309e-018, 2.00309e-018, -2.00309e-018, 0, 0, 0, 2.00309e-018, 0, 0,\
 -4.00617e-018, 0, -2.00309e-018, -2.00309e-018, 0, 0, 0, 0, 2.00309e-018,\
 -2.00309e-018, 0, -2.00309e-018, 0, 0, 2.00309e-018, -2.00309e-018, 0,\
 -2.00309e-018, 0) PERIODIC NOSPLINE" );
}

}