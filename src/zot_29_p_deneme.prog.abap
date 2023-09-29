*&---------------------------------------------------------------------*
*& Report zot_29_p_deneme
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_deneme.


tables : ekko, ekpo.

INCLUDE <ICON>.

types : begin of tp_list,
        sel,
"from header ekko
         EBELN type EBELN,
         BSART type ESART,
         AEDAT type ERDAT,
         ERNAM type ERNAM,
         LIFNR type ELIFN,
"vendor name lfa1
         NAME1 type NAME1_GP,
"from item table ekpo
         EBELP type EBELP,
         TXZ01 type TXZ01,
         MATNR type MATNR,
         MENGE type BSTMG,
         MEINS type BSTME,
         NETPR type BPREI,
         NETWR type BWERT,
         APPROVE TYPE FLAG,
         REMARK TYPE CHAR10,
         LINE_COLOR(4) TYPE C,     "Used to store row color attributes
         FIELD_COLOR TYPE SLIS_T_SPECIALCOL_ALV,
         CELLSTYLE  TYPE LVC_T_STYL,
         ICON1(4),
         ICON2(4),
         ICON3(4),
         ICON4(4),
        end of tp_list.

types : begin of tp_ernam,
        ernam type ekko-ERNAM,
        end of tp_ernam.


data : gt_list type STANDARD TABLE OF tp_list,
       gs_list type tp_list,
       gt_list1 type STANDARD TABLE OF tp_list,
       gs_list1 type tp_list,
       gt_lfa1 type STANDARD TABLE OF lfa1,
       gs_lfa1 type lfa1,
       gt_ernam type STANDARD TABLE OF tp_ernam,
       gs_ernam type tp_ernam,
       gs_field type SLIS_SPECIALCOL_ALV.


 DATA: GT_CELLSTYLE TYPE lvc_t_styl,
       gs_cellstyle type LVC_S_STYL.

DATA: it_return LIKE ddshretval OCCURS 0 WITH HEADER LINE.



"ALV fieldcatalog
DATA:  GT_FCAT    TYPE LVC_T_FCAT,               "slis_t_fieldcat_alv,
       GS_FCAT    LIKE LINE OF GT_FCAT,
       GS_LAYOUT  TYPE LVC_S_LAYO,               "slis_layout_alv,
       GS_VARIANT TYPE DISVARIANT,               "For Save Variant
       GS_GRID    TYPE LVC_S_GLAY,
       gv_cnt type i.

"ALV fieldcatalog
DATA:  GT_FCAT1    TYPE LVC_T_FCAT,               "slis_t_fieldcat_alv,
       GS_FCAT1    LIKE LINE OF GT_FCAT,
       GS_LAYOUT1  TYPE LVC_S_LAYO,               "slis_layout_alv,
       GS_VARIANT1 TYPE DISVARIANT,               "For Save Variant
       GS_GRID1    TYPE LVC_S_GLAY,
       gv_cnt1 type i.

  DATA: T_HEADER       TYPE SLIS_T_LISTHEADER,
        WA_HEADER      TYPE SLIS_LISTHEADER,
        T_LINE         LIKE WA_HEADER-INFO,
        LD_LINES       TYPE I,
        LD_LINESC(10)  TYPE C,
        TODAY_DT(10),
        TODAY_TIME(10).

DATA: r_dd_table TYPE REF TO cl_dd_table_area.


SELECTION-SCREEN begin of BLOCK b1 WITH FRAME TITLE text-001.
  select-OPTIONS  : s_ebeln for ekko-ebeln,
                    s_ebelp for ekpo-ebelp,
                    s_aedat for ekko-aedat,
                    s_ernam for ekko-ernam MODIF ID HID,
                    s_bsart for ekko-bsart MODIF ID DIS.
 SELECTION-SCREEN SKIP.
   PARAMETERS : R_ALL RADIOBUTTON GROUP GRP USER-COMMAND CMD,
                R_WO RADIOBUTTON GROUP GRP,
                R_SO RADIOBUTTON GROUP GRP.
SELECTION-SCREEN end of BLOCK b1.

 INITIALIZATION.
     S_AEDAT-SIGN   = 'I'.
     S_AEDAT-OPTION = 'BT'.
     S_AEDAT-LOW    = SY-DATUM - 365.
     S_AEDAT-HIGH   = SY-DATUM.
     APPEND S_AEDAT.

  IF R_ALL IS INITIAL AND R_WO IS INITIAL AND R_SO IS INITIAL.
     R_ALL = 'X'.
  ENDIF.

at SELECTION-SCREEN OUTPUT.  "PBO

  IF R_ALL = 'X'.
     CLEAR : S_BSART[].
  ELSEIF R_WO = 'X'.

   CLEAR : S_BSART[].
   S_BSART-SIGN    = 'I'.
   S_BSART-OPTION  = 'EQ'.
   S_BSART-LOW     = 'XSWO'.
   append s_bsart.

  ELSEIF R_SO = 'X'.
   CLEAR : S_BSART[].
   S_BSART-SIGN    = 'I'.
   S_BSART-OPTION  = 'EQ'.
   S_BSART-LOW     = 'ZLOC'.
   append s_bsart.
  ENDIF.

  LOOP AT SCREEN.
  IF R_ALL IS INITIAL AND SCREEN-GROUP1 = 'DIS'.
     SCREEN-INPUT = 0.
     MODIFY SCREEN.
  ENDIF.

  IF R_ALL IS INITIAL AND SCREEN-GROUP1 = 'HID'.
     SCREEN-ACTIVE = 0.
     MODIFY SCREEN.
  ENDIF.

  ENDLOOP.

AT SELECTION-SCREEN. "validation

*   IF S_ERNAM-LOW IS INITIAL.
*      message 'Enter the created by' TYPE 'E'.
*   ENDIF.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR S_ERNAM-LOW.

   clear : gt_ernam[].
   gs_ernam-ERNAM  = 'DEVELOPER1'.
   append gs_ernam to gt_ernam.
   gs_ernam-ERNAM  = 'KISHORM'.
   append gs_ernam to gt_ernam.
      gs_ernam-ERNAM  = 'ZAFARK'.
   append gs_ernam to gt_ernam.



CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
  EXPORTING
*   DDIC_STRUCTURE         = ' '
    RETFIELD               = 'ERNAM'
*   PVALKEY                = ' '
*   DYNPPROG               = ' '
*   DYNPNR                 = ' '
*   DYNPROFIELD            = ' '
*   STEPL                  = 0
*   WINDOW_TITLE           =
*   VALUE                  = ' '
   VALUE_ORG              = 'S'
*   MULTIPLE_CHOICE        = ' '
*   DISPLAY                = ' '
*   CALLBACK_PROGRAM       = ' '
*   CALLBACK_FORM          = ' '
*   CALLBACK_METHOD        =
*   MARK_TAB               =
* IMPORTING
*   USER_RESET             =
  TABLES
    VALUE_TAB              = gt_ernam
*   FIELD_TAB              =
   RETURN_TAB             = IT_RETURN
*   DYNPFLD_MAPPING        =
 EXCEPTIONS
   PARAMETER_ERROR        = 1
   NO_VALUES_FOUND        = 2
   OTHERS                 = 3
          .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.

  WRITE it_return-fieldval TO S_ERNAM-LOW.
  REFRESH gt_ernam.




START-OF-SELECTION.

     perform get_data.
     perform build_data.
     perform display_data.

end-of-SELECTION.


*&---------------------------------------------------------------------*
*&      Form  GET_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM GET_DATA .

  select a~EBELN a~BSART a~AEDAT a~ERNAM a~LIFNR
         b~EBELP b~TXZ01 b~MATNR b~MENGE b~MEINS b~NETPR b~NETWR


         from ekko as a INNER JOIN ekpo as b on a~ebeln = b~ebeln
         into CORRESPONDING FIELDS OF TABLE GT_LIST
         WHERE a~ebeln in s_ebeln
           and b~ebelp in s_ebelp
           and a~BSTYP = 'F'
           and a~bsart in s_bsart
           and a~aedat in s_aedat.

     IF GT_LIST[] IS NOT INITIAL.

  select * from lfa1 into CORRESPONDING FIELDS OF TABLE gt_lfa1
  FOR ALL ENTRIES IN gt_list
  WHERE lifnr = gt_list-lifnr.

     ENDIF.


ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  BUILD_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM BUILD_DATA .

    loop at gt_list into gs_list.
    READ TABLE gt_lfa1 into gs_lfa1 with key lifnr = gs_list-lifnr.
    gs_list-name1  = gs_lfa1-name1.

*   "for row colors
**Populate color variable with colour properties
**Char 1 = C (This is a color property)
**Char 2 = 3 (Color codes: 1 - 7)
**Char 3 = Intensified on/off ( 1 or 0 )
**Char 4 = Inverse display on/off ( 1 or 0 )
**i.e. wa_ekko-line_color = 'C410'
*
*
**    IF GS_LIST-NETWR LE '10000.00'.
**       GS_LIST-LINE_COLOR = 'C410'.
**    ELSEIF GS_LIST-NETWR GT '10000.00'.
**       GS_LIST-LINE_COLOR = 'C610'.
**    ENDIF.
*
*
*    IF GS_LIST-NETWR GT '100000.00'.
*     clear : GS_FIELD.
*     GS_FIELD-FIELDNAME = 'TXZ01'.
*     GS_FIELD-COLOR-COL = 6.
*     APPEND GS_FIELD TO GS_LIST-FIELD_COLOR.
*     GS_FIELD-FIELDNAME = 'NETWR'.
*     GS_FIELD-COLOR-COL = 3.
*     APPEND GS_FIELD TO GS_LIST-FIELD_COLOR.
*    ENDIF.

    IF GS_LIST-NETWR GT '100000.00'.
    REFRESH GT_CELLSTYLE.
    CLEAR : gs_list-CELLSTYLE, gs_cellstyle.

    GS_CELLSTYLE-fieldname = 'APPROVE'.   " field1
    GS_CELLSTYLE-style     = cl_gui_alv_grid=>MC_STYLE_DISABLED.
    append GS_CELLSTYLE TO GT_CELLSTYLE.

    GS_CELLSTYLE-fieldname = 'NETWR'.   " field1
    GS_CELLSTYLE-style     = cl_gui_alv_grid=>MC_STYLE_DISABLED.
    append GS_CELLSTYLE TO GT_CELLSTYLE.

    GS_CELLSTYLE-fieldname = 'REMARK'.   " field1
    GS_CELLSTYLE-style     = cl_gui_alv_grid=>MC_STYLE_DISABLED.
    append GS_CELLSTYLE TO GT_CELLSTYLE.

    gs_list-CELLSTYLE[] = GT_CELLSTYLE[].


    ENDIF.

     IF GS_LIST-NETWR LT '10000.00'.
     gs_list-ICON1  = '@08@'.
     ELSEIF GS_LIST-NETWR LT '50000.00'.
     gs_list-ICON1  = '@09@'.
     ELSE.
     gs_list-ICON1  = '@0A@'.
     ENDIF.

     gs_list-ICON2  = '@09@'.
     gs_list-ICON3  = '@0A@'.
     gs_list-ICON4  = ICON_WD_RADIO_BUTTON_EMPTY.

    MODIFY gt_list from gs_list. " TRANSPORTING name1.

    clear : gs_list, gs_lfa1.
    endloop.


ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  DISPLAY_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM DISPLAY_DATA .

  CLEAR : GV_CNT, GT_FCAT[], GS_FCAT.

  GS_LAYOUT-CWIDTH_OPT = 'X'.
*  GS_LAYOUT-STYLEFNAME = 'CELLSTYLE'.
  gs_layout-INFO_FNAME = 'LINE_COLOR'.
  gs_layout-CTAB_FNAME = 'FIELD_COLOR'.
  GS_LAYOUT-BOX_FNAME  = 'SEL'.
  GS_LAYOUT-STYLEFNAME = 'CELLSTYLE'.
  GS_VARIANT-REPORT    = SY-REPID.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'EBELN'.
  GS_FCAT-HOTSPOT   = 'X'.
  GS_FCAT-EMPHASIZE = 'C5'.
  GS_FCAT-COLTEXT = 'PO Number'.
*  GS_FCAT-EMPHASIZE = 'C3'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'AEDAT'.
  GS_FCAT-COLTEXT = 'PO Date'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'ERNAM'.
  GS_FCAT-COLTEXT = 'ERNAM'.
  GS_FCAT-EMPHASIZE = 'C3'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'BSART'.
  GS_FCAT-COLTEXT = 'PO Document type'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'LIFNR'.
  GS_FCAT-COLTEXT   = 'Vendor Code'.
  GS_FCAT-NO_ZERO   = 'X'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'NAME1'.
  GS_FCAT-COLTEXT   = 'Vendor Name'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'EBELP'.
  GS_FCAT-COLTEXT   = 'Line Item'.
  GS_FCAT-NO_ZERO   = 'X'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'TXZ01'.
  GS_FCAT-COLTEXT   = 'Material Text'.
  GS_FCAT-EMPHASIZE = 'C7'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'MATNR'.
  GS_FCAT-COLTEXT   = 'Material Code'.
  GS_FCAT-NO_ZERO   = 'X'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'MENGE'.
  GS_FCAT-COLTEXT   = 'Quantity'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'MEINS'.
  GS_FCAT-COLTEXT   = 'Quantity'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'MEINS'.
  GS_FCAT-COLTEXT   = 'Quantity'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'NETWR'.
  GS_FCAT-COLTEXT   = 'Net Price'.
  GS_FCAT-EDIT      = 'X'.
  GS_FCAT-REF_TABLE = 'EKPO'.
  GS_FCAT-REF_FIELD = 'NETWR'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'APPROVE'.
  GS_FCAT-COLTEXT   = 'Approve'.
  GS_FCAT-CHECKBOX  = 'X'.
  GS_FCAT-EDIT      = 'X'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'REMARK'.
  GS_FCAT-COLTEXT   = 'Remark'.
  GS_FCAT-EDIT      = 'X'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'ICON1'.
  GS_FCAT-COLTEXT   = 'Icon1'.
  GS_FCAT-ICON      = 'X'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.


  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'ICON2'.
  GS_FCAT-COLTEXT   = 'Icon2'.
  GS_FCAT-ICON      = 'X'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.


  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'ICON3'.
  GS_FCAT-COLTEXT   = 'Icon3'.
  GS_FCAT-ICON      = 'X'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.


  GV_CNT = GV_CNT + 1.
  GS_FCAT-COL_POS   =  GV_CNT .
  GS_FCAT-FIELDNAME = 'ICON4'.
  GS_FCAT-COLTEXT   = 'Icon4'.
  GS_FCAT-ICON      = 'X'.
  APPEND GS_FCAT TO GT_FCAT.
  CLEAR GS_FCAT.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
    EXPORTING
      I_CALLBACK_PROGRAM       = SY-REPID
      I_CALLBACK_USER_COMMAND  = 'USER_COMMAND'
      I_CALLBACK_PF_STATUS_SET = 'PF_STATUS'
      I_CALLBACK_TOP_OF_PAGE   = 'TOP-OF-PAGE'
*  I_CALLBACK_HTML_TOP_OF_PAGE = 'HTML_TOP_OF_PAGE'
      IS_LAYOUT_LVC            = GS_LAYOUT
      IT_FIELDCAT_LVC          = GT_FCAT[]
*     I_GRID_SETTINGS          = gs_grid
*     IT_EVENTS                = lt_evts[]
*      IT_EVENTS          = I_EVENTS
      I_DEFAULT                = 'X'
      I_SAVE                   = 'A'
      IS_VARIANT               = GS_VARIANT
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER  =
*     ES_EXIT_CAUSED_BY_USER   =
    TABLES
      T_OUTTAB                 = GT_LIST[]
    EXCEPTIONS
      PROGRAM_ERROR            = 1
      OTHERS                   = 2.

  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.


ENDFORM.

FORM PF_STATUS USING RT_EXTAB TYPE SLIS_T_EXTAB.
*  SET PF-STATUS 'ZPF1'.
  SET PF-STATUS 'ZSTANDARD'.
ENDFORM.


FORM USER_COMMAND  USING R_UCOMM LIKE SY-UCOMM
                         RS_SELFIELD TYPE SLIS_SELFIELD.


DATA : G_GRID_I TYPE REF TO CL_GUI_ALV_GRID.
DATA : LV_REFRESH TYPE FLAG.

  CALL FUNCTION 'GET_GLOBALS_FROM_SLVC_FULLSCR'
*   EXPORTING
*     IR_SALV_FULLSCREEN_ADAPTER       =
   IMPORTING
*     ET_EXCLUDING                     =
*     E_REPID                          =
*     E_CALLBACK_PROGRAM               =
*     E_CALLBACK_ROUTINE               =
     E_GRID                           = G_GRID_I
*     ET_FIELDCAT_LVC                  =
*     ER_TRACE                         =
*     E_FLG_NO_HTML                    =
*     ES_LAYOUT_KKBLO                  =
*     ES_SEL_HIDE                      =
*     ET_EVENT_EXIT                    =
*     ER_FORM_TOL                      =
*     ER_FORM_EOL                      =
            .

   if G_GRID_I is NOT INITIAL.
      LV_REFRESH = 'X'.

    CALL METHOD G_GRID_I->CHECK_CHANGED_DATA
      CHANGING
        C_REFRESH = LV_REFRESH.

   endif.



  CASE R_UCOMM.
    WHEN '&IC1'.
      READ TABLE GT_LIST INTO GS_LIST INDEX RS_SELFIELD-TABINDEX.
*
      if gs_list-ebeln is NOT INITIAL and RS_SELFIELD-FIELDNAME = 'EBELN'.

      SET PARAMETER ID 'BES' FIELD GS_LIST-EBELN.
      CALL TRANSACTION 'ME23N' AND SKIP FIRST SCREEN.
*
      elseif gs_list-ebeln is NOT INITIAL and RS_SELFIELD-FIELDNAME = 'EBELP'.

      SUBMIT ZDEMO_PO_REPORT WITH S_EBELN BETWEEN  gs_list-ebeln and gs_list-ebeln


                             with s_ebelp BETWEEN gs_list-ebelp and gs_list-ebelp
                             AND RETURN.


      elseif gs_list-ebeln is NOT INITIAL.

       gt_list1[] = gt_list[].
       delete gt_list1 WHERE ebeln ne gs_list-ebeln.

       PERFORM display_po_item.

      endif.

   WHEN '&DATA_SAVE' or 'SAVE'.


   WHEN 'BACK'.
     set SCREEN 0.

   ENDCASE.

 CLEAR : SY-UCOMM.
ENDFORM.

FORM TOP-OF-PAGE.

  clear : t_header[].

  WRITE SY-DATUM TO TODAY_DT.

  WA_HEADER-TYP  = 'H'.
  WA_HEADER-INFO = 'Purchase Order Details'.
  APPEND WA_HEADER TO T_HEADER.
  CLEAR WA_HEADER.

  WRITE SY-DATUM TO TODAY_DT.

  WA_HEADER-TYP  = 'S'.
  WA_HEADER-KEY = 'Report Run Date'.
  WA_HEADER-INFO = TODAY_DT.
  APPEND WA_HEADER TO T_HEADER.
  CLEAR WA_HEADER.

  WRITE SY-UZEIT TO TODAY_TIME.

  WA_HEADER-TYP  = 'S'.
  WA_HEADER-KEY = 'Report Run Time'.
  WA_HEADER-INFO = TODAY_TIME.
  APPEND WA_HEADER TO T_HEADER.
  CLEAR WA_HEADER.

*  WA_HEADER-TYP  = 'A'.
*  WA_HEADER-KEY = 'Total PO Value'.
*  WA_HEADER-INFO = '1234.00'.
*  APPEND WA_HEADER TO T_HEADER.
*  CLEAR WA_HEADER.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      IT_LIST_COMMENTARY       = T_HEADER
     I_LOGO                   = 'SLOGO'   "'ENJOYSAP_LOGO'
*     I_END_OF_LIST_GRID       =
*     I_ALV_FORM               =
            .

*
**
*  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
*    EXPORTING
*      IT_LIST_COMMENTARY = T_HEADER
*      i_logo             = 'MYLOGO'.
**      i_logo             = 'ENJOYSAP_LOGO'.
**I_LOGO = 'Z_LOGO'.



ENDFORM.

FORM HTML_TOP_OF_PAGE USING document TYPE REF TO cl_dd_document.

CALL METHOD DOCUMENT->ADD_TEXT_AS_HEADING
  EXPORTING
    TEXT          = 'Purchase Order Details'
*    SAP_COLOR     =
*    SAP_FONTSTYLE =
*    HEADING_LEVEL = 3
*    A11Y_TOOLTIP  =
*  CHANGING
*    DOCUMENT      =
    .

  CALL METHOD DOCUMENT->NEW_LINE
*    EXPORTING
*      REPEAT =
      .

CALL METHOD DOCUMENT->ADD_TABLE
  EXPORTING
    NO_OF_COLUMNS               =  2
*    WITH_HEADING                =
*    CELL_BACKGROUND_TRANSPARENT = 'X'
    BORDER                      = '1'
    WIDTH                       = '40%'
*    WITH_A11Y_MARKS             =
*    A11Y_LABEL                  =
  IMPORTING
*    TABLE                       =
    TABLEAREA                   = r_dd_table
  EXCEPTIONS
    TABLE_ALREADY_USED          = 1
    OTHERS                      = 2
        .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.

  CALL METHOD r_dd_table->new_row.

CALL METHOD R_DD_TABLE->ADD_TEXT
  EXPORTING
    TEXT          = 'FR FC'
*    TEXT_TABLE    =
*    FIX_LINES     =
*    SAP_STYLE     =
*    SAP_COLOR     =
*    SAP_FONTSIZE  =
*    SAP_FONTSTYLE =
*    SAP_EMPHASIS  =
*    STYLE_CLASS   =
*    A11Y_TOOLTIP  =
*  CHANGING
*    DOCUMENT      =
    .

CALL METHOD R_DD_TABLE->ADD_TEXT
  EXPORTING
    TEXT          = 'FR SC'
*    TEXT_TABLE    =
*    FIX_LINES     =
*    SAP_STYLE     =
*    SAP_COLOR     =
*    SAP_FONTSIZE  =
*    SAP_FONTSTYLE =
*    SAP_EMPHASIS  =
*    STYLE_CLASS   =
*    A11Y_TOOLTIP  =
*  CHANGING
*    DOCUMENT      =
    .

  CALL METHOD R_DD_TABLE->NEW_ROW
*    EXPORTING
*      REPEAT =
      .

 CALL METHOD R_DD_TABLE->ADD_TEXT
  EXPORTING
    TEXT          = 'SR FC'
*    TEXT_TABLE    =
*    FIX_LINES     =
*    SAP_STYLE     =
*    SAP_COLOR     =
*    SAP_FONTSIZE  =
*    SAP_FONTSTYLE =
*    SAP_EMPHASIS  =
*    STYLE_CLASS   =
*    A11Y_TOOLTIP  =
*  CHANGING
*    DOCUMENT      =
    .

CALL METHOD R_DD_TABLE->ADD_TEXT
  EXPORTING
    TEXT          = 'SR SC'
*    TEXT_TABLE    =
*    FIX_LINES     =
*    SAP_STYLE     =
*    SAP_COLOR     =
*    SAP_FONTSIZE  =
*    SAP_FONTSTYLE =
*    SAP_EMPHASIS  =
*    STYLE_CLASS   =
*    A11Y_TOOLTIP  =
*  CHANGING
*    DOCUMENT      =
    .

CALL METHOD R_DD_TABLE->NEW_ROW
*  EXPORTING
*    REPEAT =
    .


*  CALL METHOD DOCUMENT->ADD_GAP
*    EXPORTING
*      WIDTH      = 150
**      WIDTH_LIKE =
*      .
*
*
*CALL METHOD DOCUMENT->ADD_PICTURE
*  EXPORTING
*    PICTURE_ID       =  'SLOGO'
**    WIDTH            =
**    ALTERNATIVE_TEXT =
**    TABINDEX         =
*    .
*
*  CALL METHOD DOCUMENT->NEW_LINE
**    EXPORTING
**      REPEAT =
*      .
*
*
*  CALL METHOD DOCUMENT->NO_LINEBREAK
**    EXPORTING
**      START  =
**      END    =
*      .
*
* CALL METHOD DOCUMENT->ADD_TEXT
*   EXPORTING
*     TEXT          =  'Column1'
**     TEXT_TABLE    =
**     FIX_LINES     =
**     SAP_STYLE     =
**     SAP_COLOR     =
**     SAP_FONTSIZE  =
**     SAP_FONTSTYLE =
**     SAP_EMPHASIS  =
**     STYLE_CLASS   =
**     A11Y_TOOLTIP  =
**   CHANGING
**     DOCUMENT      =
*     .
*
*   CALL METHOD DOCUMENT->NO_LINEBREAK
**    EXPORTING
**      START  =
**      END    =
*      .
*
*
* CALL METHOD DOCUMENT->ADD_TEXT
*   EXPORTING
*     TEXT          =  'Column2'
**     TEXT_TABLE    =
**     FIX_LINES     =
**     SAP_STYLE     =
**     SAP_COLOR     =
**     SAP_FONTSIZE  =
**     SAP_FONTSTYLE =
**     SAP_EMPHASIS  =
**     STYLE_CLASS   =
**     A11Y_TOOLTIP  =
**   CHANGING
**     DOCUMENT      =
*     .
*
*
*   CALL METHOD DOCUMENT->NO_LINEBREAK
**    EXPORTING
**      START  =
**      END    =
*      .
*
*  CALL METHOD DOCUMENT->ADD_GAP
*    EXPORTING
*      WIDTH      = 40
**      WIDTH_LIKE =
*      .
*
*
* CALL METHOD DOCUMENT->ADD_TEXT
*   EXPORTING
*     TEXT          =  'Column3'
**     TEXT_TABLE    =
**     FIX_LINES     =
**     SAP_STYLE     =
**     SAP_COLOR     =
**     SAP_FONTSIZE  =
**     SAP_FONTSTYLE =
**     SAP_EMPHASIS  =
**     STYLE_CLASS   =
**     A11Y_TOOLTIP  =
**   CHANGING
**     DOCUMENT      =
*     .

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  DISPLAY_PO_ITEM
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM DISPLAY_PO_ITEM .

  CLEAR : GV_CNT1, GT_FCAT1[], GS_FCAT1.

  GS_LAYOUT1-CWIDTH_OPT = 'X'.
*  GS_LAYOUT-STYLEFNAME = 'CELLSTYLE'.
*  gs_layout-ctab_fname = 'TCOLOR'.
  GS_LAYOUT1-BOX_FNAME  = 'SEL'.
  GS_VARIANT1-REPORT    = SY-REPID.

  gv_cnt1 = gv_cnt1 + 1.
  gs_fcat1-COL_POS   =  gv_cnt1 .
  gs_fcat1-FIELDNAME = 'EBELN'.
  gs_fcat1-COLTEXT = 'PO Number'.
*  gs_fcat1-EMPHASIZE = 'C3'.
  APPEND gs_fcat1 TO gt_fcat1.
  CLEAR gs_fcat1.


  gv_cnt1 = gv_cnt1 + 1.
  gs_fcat1-COL_POS   =  gv_cnt1 .
  gs_fcat1-FIELDNAME = 'EBELP'.
  gs_fcat1-COLTEXT   = 'Line Item'.
  gs_fcat1-NO_ZERO   = 'X'.
  APPEND gs_fcat1 TO gt_fcat1.
  CLEAR gs_fcat1.

  gv_cnt1 = gv_cnt1 + 1.
  gs_fcat1-COL_POS   =  gv_cnt1 .
  gs_fcat1-FIELDNAME = 'MATNR'.
  gs_fcat1-COLTEXT   = 'Material Code'.
  gs_fcat1-NO_ZERO   = 'X'.
  APPEND gs_fcat1 TO gt_fcat1.
  CLEAR gs_fcat1.

  gv_cnt1 = gv_cnt1 + 1.
  gs_fcat1-COL_POS   =  gv_cnt1 .
  gs_fcat1-FIELDNAME = 'TXZ01'.
  gs_fcat1-COLTEXT   = 'Material Text'.
  APPEND gs_fcat1 TO gt_fcat1.
  CLEAR gs_fcat1.

  gv_cnt1 = gv_cnt1 + 1.
  gs_fcat1-COL_POS   =  gv_cnt1 .
  gs_fcat1-FIELDNAME = 'MENGE'.
  gs_fcat1-COLTEXT   = 'Quantity'.
  APPEND gs_fcat1 TO gt_fcat1.
  CLEAR gs_fcat1.

  gv_cnt1 = gv_cnt1 + 1.
  gs_fcat1-COL_POS   =  gv_cnt1 .
  gs_fcat1-FIELDNAME = 'MEINS'.
  gs_fcat1-COLTEXT   = 'Quantity'.
  APPEND gs_fcat1 TO gt_fcat1.
  CLEAR gs_fcat1.


  gv_cnt1 = gv_cnt1 + 1.
  gs_fcat1-COL_POS   =  gv_cnt1 .
  gs_fcat1-FIELDNAME = 'NETWR'.
  gs_fcat1-COLTEXT   = 'Net Price'.
  APPEND gs_fcat1 TO gt_fcat1.
  CLEAR gs_fcat1.


  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
    EXPORTING
      I_CALLBACK_PROGRAM       = SY-REPID
*      I_CALLBACK_USER_COMMAND  = 'USER_COMMAND'
*      I_CALLBACK_PF_STATUS_SET = 'PF_STATUS'
*      I_CALLBACK_TOP_OF_PAGE   = 'TOP-OF-PAGE'
*  I_CALLBACK_HTML_TOP_OF_PAGE = 'HTML_TOP_OF_PAGE'
      IS_LAYOUT_LVC            = GS_LAYOUT1
      IT_FIELDCAT_LVC          = gt_fcat1[]
*     I_GRID_SETTINGS          = gs_grid
*     IT_EVENTS                = lt_evts[]
*      IT_EVENTS          = I_EVENTS
      I_DEFAULT                = 'X'
      I_SAVE                   = 'A'
      IS_VARIANT               = GS_VARIANT1
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER  =
*     ES_EXIT_CAUSED_BY_USER   =
    TABLES
      T_OUTTAB                 = GT_LIST1[]
    EXCEPTIONS
      PROGRAM_ERROR            = 1
      OTHERS                   = 2.

  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.

ENDFORM.
