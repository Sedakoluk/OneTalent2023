*&---------------------------------------------------------------------*
*& Report zot_29_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_calculator.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_sayi1 TYPE i OBLIGATORY,
              p_sayi2 TYPE i OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  PARAMETERS: rb1 RADIOBUTTON GROUP rad1,
              rb2 RADIOBUTTON GROUP rad1,
              rb3 RADIOBUTTON GROUP rad1,
              rb4 RADIOBUTTON GROUP rad1.

SELECTION-SCREEN END OF BLOCK b2.

START-OF-SELECTION.

  IF rb4 = 'X' AND p_sayi2 = 0.
    MESSAGE 'Sıfıra Bölme İşlemi Yapılamaz!' TYPE 'E'.
    EXIT.
  ENDIF.

*      p_sayi2 = 0.
*  TRY.
*      gv_sonuc = p_sayi1 / p_sayi2.
*    CATCH cx_sy_zerodivide.
*      cl_demo_output=>write( |Sıfıra Bölme İşlemi Yapılamaz!| ).
*  ENDTRY.

  DATA: gv_sayi1 TYPE i,
        gv_sayi2 TYPE i,
        gv_sonuc TYPE p DECIMALS 2.

  gv_sayi1 = p_sayi1.
  gv_sayi2 = p_sayi2.

  IF rb1 = 'X'.
    gv_sonuc = gv_sayi1 + gv_sayi2.

  ELSEIF rb2 = 'X'.
    gv_sonuc = gv_sayi1 - gv_sayi2.

  ELSEIF rb3 = 'X'.
    gv_sonuc = gv_sayi1 * gv_sayi2.

  ELSEIF rb4 = 'X'.
    gv_sonuc = gv_sayi1 / gv_sayi2.

  ENDIF.

  cl_demo_output=>write( gv_sonuc ).
  cl_demo_output=>display(  ).
