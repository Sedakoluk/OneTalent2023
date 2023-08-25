*&---------------------------------------------------------------------*
*& Include          ZOT_29_I_ADOBEF_EXCELUP_SEL
*&---------------------------------------------------------------------*

TABLES: lips, likp.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: s_vbeln FOR lips-vbeln MODIF ID sec,
                  s_posnr FOR lips-posnr MODIF ID sec,
                  s_matnr FOR lips-matnr MODIF ID sec,
                  s_kunnr FOR likp-kunnr MODIF ID sec.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  PARAMETERS: p_teslim TYPE char1 RADIOBUTTON GROUP gp1 DEFAULT 'X',
              p_excel  TYPE char1 RADIOBUTTON GROUP gp1,
              p_file type localfile OBLIGATORY . "buna sh tanımlanacak

SELECTION-SCREEN END OF BLOCK b2.

INITIALIZATION.
LOOP AT SCREEN.
 IF screen-name = 'P_FILE' .
   screen-active = 0.
   MODIFY SCREEN.
   ENDIF.
   ENDLOOP.

AT SELECTION-SCREEN OUTPUT. "input disable entera basınca tetikliyor.

  IF p_excel = 'X'.
    LOOP AT SCREEN.
      IF screen-group1 = 'SEC'.
        screen-input = 0.
      ELSE.
        screen-input = 1.
      ENDIF.
      MODIFY SCREEN.
    ENDLOOP.
  ENDIF.

*  IF screen-group1 = 'RB'.
*    IF p_teslim = 'X'.
*      screen-input = 1.
*    ELSE.
*      screen-input = 0.
*    ENDIF.
*    MODIFY SCREEN.
*  ENDIF.


*SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-003.
**  PARAMETERS: p_file LIKE rlgrap-filename RADIOBUTTON GROUP gp2.
*SELECTION-SCREEN END OF BLOCK b3.
