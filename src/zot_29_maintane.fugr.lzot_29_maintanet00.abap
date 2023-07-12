*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_29_T_P_A_TNO................................*
DATA:  BEGIN OF STATUS_ZOT_29_T_P_A_TNO              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_29_T_P_A_TNO              .
CONTROLS: TCTRL_ZOT_29_T_P_A_TNO
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZOT_29_T_P_A_TNO              .
TABLES: ZOT_29_T_P_A_TNO               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
