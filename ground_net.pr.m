MIL_3_Tfile_Hdr_ 145A 140A modeler 9 66A71D0C 66EA9939 1A ray-laptop 28918 0 0 none none 0 0 none 5BFD08D4 264C 0 0 0 0 0 0 1bcc 1                                                                                                                                                                                                                                                                                                                                                                                              ЋЭg      @   D   H      ь  $(  $,  $0  $4  $@  $D  $H  р           	   begsim intrpt         
   џџџџ   
   doc file            	nd_module      endsim intrpt             џџџџ      failure intrpts            disabled      intrpt interval         дВI­%У}џџџџ      priority              џџџџ      recovery intrpts            disabled      subqueue                     count    џџџ   
   џџџџ   
      list   	џџџ   
          
      super priority             џџџџ             /* my node address */   int	\my_address;       Objid	\my_id;       Objid	\my_node_id;       /* rcv pk type */   
int	\type;       /* 0 or 1 for the net topo */   int	\topo[24][24];       int	\node_num;       int	\topo_address[24][3];          Packet* pkptr;   
int i,j,z;      #include <math.h>       /* Constant Definitions */       #define SRC_IN		(1)   #define SINK_OUT	(1)   #define TX_OUT		(2)   #define RX_IN		(2)               "/* Transition Condition Macros */    Z#define FROM_RX_PK			(op_intrpt_type() == OPC_INTRPT_STRM) && (op_intrpt_strm () == RX_IN)   \#define FROM_SRC_PK 		(op_intrpt_type() == OPC_INTRPT_STRM) && (op_intrpt_strm () == SRC_IN)                                                      Z   в          
   init   
       
   
   //initial begin   my_id = op_id_self();   $my_node_id = op_topo_parent (my_id);   6op_ima_obj_attr_get(my_node_id,"Address",&my_address);   for(i=0;i<24;i++)    	for(j=0;j<24;j++) topo[i][j]=0;   for(i=0;i<24;i++)   '	for(j=0;j<3;j++) topo_address[i][j]=0;   node_num=13;   5printf("$$$$$$$$$$$$ground net over$$$$$$$$$$$$$\n");   
                     
   џџџџ   
          pr_state           в          
   idle   
                                       џџџџ             pr_state        J   Z          
   rx_rcv   
       
   ~   int a_topo[276];   int num_elements=9;   int int_array[9];   unsigned char bit_sequence[35];       //ЪеЕНВЛЭЌРраЭАќЕФааЮЊ   "pkptr=op_pk_get(op_intrpt_strm());   %op_pk_nfd_get (pkptr, "TYPE", &type);               if(type==0x10)//link_maintain   	{   	z=0;   0	op_pk_nfd_get(pkptr,"Net_Topo1",&int_array[0]);   0	op_pk_nfd_get(pkptr,"Net_Topo2",&int_array[1]);   0	op_pk_nfd_get(pkptr,"Net_Topo3",&int_array[2]);   0	op_pk_nfd_get(pkptr,"Net_Topo4",&int_array[3]);   0	op_pk_nfd_get(pkptr,"Net_Topo5",&int_array[4]);   0	op_pk_nfd_get(pkptr,"Net_Topo6",&int_array[5]);   0	op_pk_nfd_get(pkptr,"Net_Topo7",&int_array[6]);   0	op_pk_nfd_get(pkptr,"Net_Topo8",&int_array[7]);   0	op_pk_nfd_get(pkptr,"Net_Topo9",&int_array[8]);   "	for(i = 0; i < num_elements; i++)   		for(j = 0; j <4; j++)   D			bit_sequence[i * 4 + j] = (int_array[i] >> (8 * (3 - j))) & 0xFF;   	for (i=0;i<276;i++)   9        a_topo[i] = (bit_sequence[i / 8] >> (i % 8)) & 1;   	//зщжЏtopo   	for(i=0;i<24;i++)   !		for(j=0;j<24;j++) topo[i][j]=0;   	for(i=0;i<23;i++)   		for(j=i+1;j<24;j++)   			{   			topo[i][j]=a_topo[z];   			topo[j][i]=a_topo[z];   			z++;   			}   %	printf("\n ground get the topo:\n");   	for(i=0;i<node_num;i++)   	{   	for(j=0;j<node_num;j++)   		printf("%d   ",topo[i][j]);   	printf("\n");   	}   <	op_pk_nfd_get(pkptr,"Nei_longtitude0",&topo_address[0][0]);   <	op_pk_nfd_get(pkptr,"Nei_longtitude1",&topo_address[1][0]);   <	op_pk_nfd_get(pkptr,"Nei_longtitude2",&topo_address[2][0]);   <	op_pk_nfd_get(pkptr,"Nei_longtitude3",&topo_address[3][0]);   <	op_pk_nfd_get(pkptr,"Nei_longtitude4",&topo_address[4][0]);   <	op_pk_nfd_get(pkptr,"Nei_longtitude5",&topo_address[5][0]);   <	op_pk_nfd_get(pkptr,"Nei_longtitude6",&topo_address[6][0]);   <	op_pk_nfd_get(pkptr,"Nei_longtitude7",&topo_address[7][0]);   <	op_pk_nfd_get(pkptr,"Nei_longtitude8",&topo_address[8][0]);   <	op_pk_nfd_get(pkptr,"Nei_longtitude9",&topo_address[9][0]);   >	op_pk_nfd_get(pkptr,"Nei_longtitude10",&topo_address[10][0]);   >	op_pk_nfd_get(pkptr,"Nei_longtitude11",&topo_address[11][0]);   >	op_pk_nfd_get(pkptr,"Nei_longtitude12",&topo_address[12][0]);   >	op_pk_nfd_get(pkptr,"Nei_longtitude13",&topo_address[13][0]);   >	op_pk_nfd_get(pkptr,"Nei_longtitude14",&topo_address[14][0]);   >	op_pk_nfd_get(pkptr,"Nei_longtitude15",&topo_address[15][0]);   >	op_pk_nfd_get(pkptr,"Nei_longtitude16",&topo_address[16][0]);   >	op_pk_nfd_get(pkptr,"Nei_longtitude17",&topo_address[17][0]);   >	op_pk_nfd_get(pkptr,"Nei_longtitude18",&topo_address[18][0]);   >	op_pk_nfd_get(pkptr,"Nei_longtitude19",&topo_address[19][0]);   >	op_pk_nfd_get(pkptr,"Nei_longtitude20",&topo_address[20][0]);   >	op_pk_nfd_get(pkptr,"Nei_longtitude21",&topo_address[21][0]);   >	op_pk_nfd_get(pkptr,"Nei_longtitude22",&topo_address[22][0]);   >	op_pk_nfd_get(pkptr,"Nei_longtitude23",&topo_address[23][0]);       :	op_pk_nfd_get(pkptr,"Nei_latitude0",&topo_address[0][1]);   :	op_pk_nfd_get(pkptr,"Nei_latitude1",&topo_address[1][1]);   :	op_pk_nfd_get(pkptr,"Nei_latitude2",&topo_address[2][1]);   :	op_pk_nfd_get(pkptr,"Nei_latitude3",&topo_address[3][1]);   :	op_pk_nfd_get(pkptr,"Nei_latitude4",&topo_address[4][1]);   :	op_pk_nfd_get(pkptr,"Nei_latitude5",&topo_address[5][1]);   :	op_pk_nfd_get(pkptr,"Nei_latitude6",&topo_address[6][1]);   :	op_pk_nfd_get(pkptr,"Nei_latitude7",&topo_address[7][1]);   :	op_pk_nfd_get(pkptr,"Nei_latitude8",&topo_address[8][1]);   :	op_pk_nfd_get(pkptr,"Nei_latitude9",&topo_address[9][1]);   <	op_pk_nfd_get(pkptr,"Nei_latitude10",&topo_address[10][1]);   <	op_pk_nfd_get(pkptr,"Nei_latitude11",&topo_address[11][1]);   <	op_pk_nfd_get(pkptr,"Nei_latitude12",&topo_address[12][1]);   <	op_pk_nfd_get(pkptr,"Nei_latitude13",&topo_address[13][1]);   <	op_pk_nfd_get(pkptr,"Nei_latitude14",&topo_address[14][1]);   <	op_pk_nfd_get(pkptr,"Nei_latitude15",&topo_address[15][1]);   <	op_pk_nfd_get(pkptr,"Nei_latitude16",&topo_address[16][1]);   <	op_pk_nfd_get(pkptr,"Nei_latitude17",&topo_address[17][1]);   <	op_pk_nfd_get(pkptr,"Nei_latitude18",&topo_address[18][1]);   <	op_pk_nfd_get(pkptr,"Nei_latitude19",&topo_address[19][1]);   <	op_pk_nfd_get(pkptr,"Nei_latitude20",&topo_address[20][1]);   <	op_pk_nfd_get(pkptr,"Nei_latitude21",&topo_address[21][1]);   <	op_pk_nfd_get(pkptr,"Nei_latitude22",&topo_address[22][1]);   <	op_pk_nfd_get(pkptr,"Nei_latitude23",&topo_address[23][1]);       8	op_pk_nfd_get(pkptr,"Nei_height0",&topo_address[0][2]);   8	op_pk_nfd_get(pkptr,"Nei_height1",&topo_address[1][2]);   8	op_pk_nfd_get(pkptr,"Nei_height2",&topo_address[2][2]);   8	op_pk_nfd_get(pkptr,"Nei_height3",&topo_address[3][2]);   8	op_pk_nfd_get(pkptr,"Nei_height4",&topo_address[4][2]);   8	op_pk_nfd_get(pkptr,"Nei_height5",&topo_address[5][2]);   8	op_pk_nfd_get(pkptr,"Nei_height6",&topo_address[6][2]);   8	op_pk_nfd_get(pkptr,"Nei_height7",&topo_address[7][2]);   8	op_pk_nfd_get(pkptr,"Nei_height8",&topo_address[8][2]);   8	op_pk_nfd_get(pkptr,"Nei_height9",&topo_address[9][2]);   :	op_pk_nfd_get(pkptr,"Nei_height10",&topo_address[10][2]);   :	op_pk_nfd_get(pkptr,"Nei_height11",&topo_address[11][2]);   :	op_pk_nfd_get(pkptr,"Nei_height12",&topo_address[12][2]);   :	op_pk_nfd_get(pkptr,"Nei_height13",&topo_address[13][2]);   :	op_pk_nfd_get(pkptr,"Nei_height14",&topo_address[14][2]);   :	op_pk_nfd_get(pkptr,"Nei_height15",&topo_address[15][2]);   :	op_pk_nfd_get(pkptr,"Nei_height16",&topo_address[16][2]);   :	op_pk_nfd_get(pkptr,"Nei_height17",&topo_address[17][2]);   :	op_pk_nfd_get(pkptr,"Nei_height18",&topo_address[18][2]);   :	op_pk_nfd_get(pkptr,"Nei_height19",&topo_address[19][2]);   :	op_pk_nfd_get(pkptr,"Nei_height20",&topo_address[20][2]);   :	op_pk_nfd_get(pkptr,"Nei_height21",&topo_address[21][2]);   :	op_pk_nfd_get(pkptr,"Nei_height22",&topo_address[22][2]);   :	op_pk_nfd_get(pkptr,"Nei_height23",&topo_address[23][2]);   	   	op_pk_destroy(pkptr);   	}                   
                     
   џџџџ   
          pr_state        Т            
   src_rcv   
       
      "pkptr=op_pk_get(op_intrpt_strm());   %op_pk_nfd_get (pkptr, "TYPE", &type);       !if(type==0x15)//appointment_req_G   	op_pk_send(pkptr,TX_OUT);   
                     
   џџџџ   
          pr_state                        Б   б      g   Ю   і   б          
   tr_0   
       џџџџ          џџџџ          
    џџџџ   
          џџџџ                       pr_transition               Ю            Ф   Х      §        Р          
   tr_1   
       
   default   
       џџџџ          
    џџџџ   
          џџџџ                       pr_transition              '           М  9   h          
   tr_3   
       
   
FROM_RX_PK   
       џџџџ          
    џџџџ   
          џџџџ                       pr_transition              5        H   j     П          
   tr_5   
       џџџџ          џџџџ          
    џџџџ   
          џџџџ                       pr_transition                 ф        к  Д   џ          
   tr_6   
       
   FROM_SRC_PK   
       џџџџ          
    џџџџ   
          џџџџ                       pr_transition              x   ч     А       р          
   tr_7   
       
џџџџ   
       џџџџ          
    џџџџ   
          џџџџ                       pr_transition                                             