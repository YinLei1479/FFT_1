MIL_3_Tfile_Hdr_ 145A 140A modeler 9 66CC11E0 66EA98DA 2A ray-laptop 28918 0 0 none none 0 0 none 6DE545BC 1EF5 0 0 0 0 0 0 1bcc 1                                                                                                                                                                                                                                                                                                                                                                                              ��g�      @   D   �  �  �  	]  w  {  >  �  �  �  �  	Q          Slot Length   �������      seconds       ?�      ����              ����              ����           �Z             	   begsim intrpt         
   ����   
   doc file            	nd_module      endsim intrpt             ����      failure intrpts            disabled      intrpt interval         ԲI�%��}����      priority              ����      recovery intrpts            disabled      subqueue                     count    ���   
   ����   
      list   	���   
          
      super priority             ����             Objid	\my_node_id;       Objid	\my_id;       int	\my_address;       
int	\type;          Packet*	pkptr;           int current_intrpt_type;   (   #include <math.h>       /* Constant Definitions */   #define RX_IN_STRM		(1)   #define SRC_IN_STRM		(0)   #define TX_OUT_STRM		(1)   #define SINK_OUT_STRM	(0)       7#define EPSILON  		(1e-10)  /* rounding error factor */   #define TDMA_COMPLETE	(-10)   #define FRAME_BEGIN		(2000)   //#define WAIT			(2222)   #define TS				(3333)       "/* Transition Condition Macros */    _#define FROM_RX			(current_intrpt_type == OPC_INTRPT_STRM) && (op_intrpt_strm () == RX_IN_STRM)   b#define FROM_SRC 		(current_intrpt_type == OPC_INTRPT_STRM) && (op_intrpt_strm () == SRC_IN_STRM)    5#define TRANSMITTING	(op_stat_local_read (0) == 1.0)    T#define SLOT 			(current_intrpt_type == OPC_INTRPT_SELF) && (op_intrpt_code () == 0)   Y#define MY_SLOT 		(current_intrpt_type == OPC_INTRPT_SELF) && (op_intrpt_code () == 3000)   8#define END  			(current_intrpt_type == OPC_INTRPT_STAT)       X#define NET_IN			(current_intrpt_type == OPC_INTRPT_SELF) && (op_intrpt_code () == 4444)   \#define SEND_NET_IN		(current_intrpt_type == OPC_INTRPT_SELF) && (op_intrpt_code () == 5555)   ^//#define WAIT_BEGIN 		(current_intrpt_type == OPC_INTRPT_SELF) && (op_intrpt_code () == WAIT)   )#define DATA_ENQ 		(!(op_subq_empty (0)))   W#define TIME_END		(current_intrpt_type == OPC_INTRPT_SELF) && (op_intrpt_code () == TS)           ,#define	SELF_INTRPT_SCHLD	(intrpt_flag == 1)       /* Global Variables */   int		tdma_pk_sent;   int		tdma_pk_rcvd;   int		tdma_bits_sent;   int		tdma_bits_rcvd;   int		tdma_setup;   int		tdma_id;   int		num_slots;                                               Z   �          
   init   
       
      my_id = op_id_self();   $my_node_id = op_topo_parent (my_id);   6op_ima_obj_attr_get(my_node_id,"Address",&my_address);   
       
       
       
   ����   
          pr_state      	     �          
   idle   
       
       
       
      (current_intrpt_type = op_intrpt_type ();       
       
    ����   
          pr_state           Z          
   fr_rx   
       J      
int pk_id;        pkptr =  op_pk_get (RX_IN_STRM);   "op_pk_nfd_get(pkptr,"TYPE",&type);   #op_pk_nfd_get(pkptr,"SEND",&pk_id);       if(type==0x10)   	{   +	if(my_address!=0xFE) op_pk_destroy(pkptr);   	else   		{   "		op_pk_send(pkptr,SINK_OUT_STRM);   		}   	}                       J       
       
       
   ����   
          pr_state        �   �          
   fr_src   
       
   
   !pkptr =  op_pk_get (SRC_IN_STRM);   %op_pk_nfd_get (pkptr, "TYPE", &type);        if(type==0x10)//�����ڵ���ϱ�֡   	{   (	op_pk_nfd_set(pkptr,"SEND",my_address);   A	op_pk_nfd_set(pkptr,"FL",(double) op_pk_total_size_get (pkptr));   	///CRC   	op_pk_send(pkptr,TX_OUT_STRM);   	}   
       
       
       
   ����   
          pr_state               	   	   �   �      �   �   �   �   �   �   �   �          
   tr_10   
       
   default   
       
����   
       
    ����   
       
   ����   
                    pr_transition            	   �   �      v   �   �   �          
   tr_12   
       
����   
       
����   
       
    ����   
       
   ����   
                    pr_transition         	        �      �   �   �   o          
   tr_13   
       
   FROM_RX   
       
����   
       
    ����   
       
   ����   
                    pr_transition            	  H   �     "   m  "   �          
   tr_14   
       
����   
       
����   
       
    ����   
       
   ����   
                    pr_transition      #   	     m   �     %   �  �   �          
   tr_15   
       
   FROM_SRC   
       
����   
       
    ����   
       
   ����   
                    pr_transition      '      	  m   �     �   �  '   �          
   tr_16   
       
����   
       
����   
       
    ����   
       
   ����   
                    pr_transition         J          Load (bits)          (Number of bits broadcast by this node.          TDMA   bucket/default total/sum   linear        ԲI�%��}   Load (bits/sec)          'Number of bits per second broadcast by    this node.      TDMA   bucket/default total/sum_time   linear        ԲI�%��}   Load (packets)          $Number of packets broadcast by this    node.      TDMA   bucket/default total/sum   linear        ԲI�%��}   Load (packets/sec)          'Number of packets per second broadcast    by this node.      TDMA   bucket/default total/sum_time   linear        ԲI�%��}   Traffic Received (bits)          'Number of bits received by this node.     TDMA   bucket/default total/sum   linear        ԲI�%��}   Traffic Received (bits/sec)          &Number of bits per second received by    this node.      TDMA   bucket/default total/sum_time   linear        ԲI�%��}   Traffic Received (packets)          #Number of packets received by this    node.    TDMA   bucket/default total/sum   linear        ԲI�%��}   Traffic Received (packets/sec)          &Number of packets per second received    by this node.       TDMA   bucket/default total/sum_time   linear        ԲI�%��}      TDMA Load (bits)          &Total number of bits broadcast by all    tdma capable nodes.     TDMA   bucket/default total/sum   linear        ԲI�%��}   TDMA Load (bits/sec)           Total number of bits per second    &broadcast by all tdma capable nodes.     TDMA   bucket/default total/sum_time   linear        ԲI�%��}   TDMA Load (packets)          #Total number of packets per second    %broadcast by all tdma capable nodes.    TDMA   bucket/default total/sum_time   linear        ԲI�%��}   TDMA Load (packets/sec)          #Total number of packets per second    %broadcast by all tdma capable nodes.    TDMA   bucket/default total/sum_time   linear        ԲI�%��}   TDMA Traffic Received (bits)           Total number of bits per second    $received by all tdma capable nodes.    TDMA   bucket/default total/sum_time   linear        ԲI�%��}    TDMA Traffic Received (bits/sec)           Total number of bits per second    $received by all tdma capable nodes.    TDMA   bucket/default total/sum_time   linear        ԲI�%��}   TDMA Traffic Received (packets)          (Total number of packets received by all    tdma capable nodes.    TDMA   bucket/default total/sum   linear        ԲI�%��}   #TDMA Traffic Received (packets/sec)          #Total number of packets per second    $received by all tdma capable nodes.    TDMA   bucket/default total/sum_time   linear        ԲI�%��}                           