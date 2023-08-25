*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_29_T_TESLIMT................................*
DATA:  BEGIN OF STATUS_ZOT_29_T_TESLIMT              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_29_T_TESLIMT              .
CONTROLS: TCTRL_ZOT_29_T_TESLIMT
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZOT_29_T_TESLIMT              .
TABLES: ZOT_29_T_TESLIMT               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
