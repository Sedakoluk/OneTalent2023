*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_29_T_BK1....................................*
DATA:  BEGIN OF STATUS_ZOT_29_T_BK1                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_29_T_BK1                  .
CONTROLS: TCTRL_ZOT_29_T_BK1
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZOT_29_T_BK1                  .
TABLES: ZOT_29_T_BK1                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
