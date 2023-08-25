*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_29_T_STOK...................................*
DATA:  BEGIN OF STATUS_ZOT_29_T_STOK                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_29_T_STOK                 .
CONTROLS: TCTRL_ZOT_29_T_STOK
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZOT_29_T_STOK                 .
TABLES: ZOT_29_T_STOK                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
