*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_29_T_DENEME.................................*
DATA:  BEGIN OF STATUS_ZOT_29_T_DENEME               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_29_T_DENEME               .
CONTROLS: TCTRL_ZOT_29_T_DENEME
            TYPE TABLEVIEW USING SCREEN '0007'.
*...processing: ZOT_29_T_P_A_TNO................................*
DATA:  BEGIN OF STATUS_ZOT_29_T_P_A_TNO              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_29_T_P_A_TNO              .
CONTROLS: TCTRL_ZOT_29_T_P_A_TNO
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: ZOT_29_T_P_EGTM.................................*
DATA:  BEGIN OF STATUS_ZOT_29_T_P_EGTM               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_29_T_P_EGTM               .
CONTROLS: TCTRL_ZOT_29_T_P_EGTM
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: ZOT_29_T_P_ETUR.................................*
DATA:  BEGIN OF STATUS_ZOT_29_T_P_ETUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_29_T_P_ETUR               .
CONTROLS: TCTRL_ZOT_29_T_P_ETUR
            TYPE TABLEVIEW USING SCREEN '0003'.
*...processing: ZOT_29_T_P_ITUR.................................*
DATA:  BEGIN OF STATUS_ZOT_29_T_P_ITUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_29_T_P_ITUR               .
CONTROLS: TCTRL_ZOT_29_T_P_ITUR
            TYPE TABLEVIEW USING SCREEN '0004'.
*...processing: ZOT_29_T_P_MAST.................................*
DATA:  BEGIN OF STATUS_ZOT_29_T_P_MAST               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_29_T_P_MAST               .
CONTROLS: TCTRL_ZOT_29_T_P_MAST
            TYPE TABLEVIEW USING SCREEN '0005'.
*...processing: ZOT_29_T_TWITTER................................*
DATA:  BEGIN OF STATUS_ZOT_29_T_TWITTER              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_29_T_TWITTER              .
CONTROLS: TCTRL_ZOT_29_T_TWITTER
            TYPE TABLEVIEW USING SCREEN '0006'.
*.........table declarations:.................................*
TABLES: *ZOT_29_T_DENEME               .
TABLES: *ZOT_29_T_P_A_TNO              .
TABLES: *ZOT_29_T_P_EGTM               .
TABLES: *ZOT_29_T_P_ETUR               .
TABLES: *ZOT_29_T_P_ITUR               .
TABLES: *ZOT_29_T_P_MAST               .
TABLES: *ZOT_29_T_TWITTER              .
TABLES: ZOT_29_T_DENEME                .
TABLES: ZOT_29_T_P_A_TNO               .
TABLES: ZOT_29_T_P_EGTM                .
TABLES: ZOT_29_T_P_ETUR                .
TABLES: ZOT_29_T_P_ITUR                .
TABLES: ZOT_29_T_P_MAST                .
TABLES: ZOT_29_T_TWITTER               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
