*&---------------------------------------------------------------------*
*& Report ZOT_29_P_LOCKOBJECT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_lockobject.

TABLES vbak.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_belg TYPE vbeln,
              rb1    RADIOBUTTON GROUP gr1,
              rb2    RADIOBUTTON GROUP gr1.

SELECTION-SCREEN END OF BLOCK b1.

*DATA: d_vbeln LIKE likp-vbeln.        "vbeln depolamak için

*d_vbeln = p_belg.

START-OF-SELECTION.

  IF rb1 EQ abap_true.
* belgeyi kilitlemek için
    CALL FUNCTION 'ENQUEUE_EVVBAKE'
      EXPORTING
        mode_vbak      = 'X'
        mandt          = sy-mandt
        vbeln          = p_belg
      EXCEPTIONS
        foreign_lock   = 1
        system_failure = 2
        OTHERS         = 3.
IF  sy-subrc EQ 0.
MESSAGE 'Belge kilitlendi' TYPE 'I'.
ENDIF.

"    PERFORM call_transaction.

  ELSEIF rb2 EQ abap_true.

*---belgenin kilidini açmak için
    CALL FUNCTION 'DEQUEUE_EVVBAKE'
      EXPORTING
        mode_vbak = 'X'
        mandt     = sy-mandt
        vbeln     = p_belg.

    MESSAGE 'Satış belgesi işleniyor' TYPE 'S' DISPLAY LIKE 'E'.
"    PERFORM call_transaction.

  ENDIF.
*&---------------------------------------------------------------------*
*& Form call_transaction
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM call_transaction .
  TRY.
      CALL TRANSACTION 'VA02' WITH AUTHORITY-CHECK.
    CATCH cx_sy_authorization_error.
      RETURN.
  ENDTRY.
ENDFORM.
