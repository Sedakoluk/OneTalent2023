*&---------------------------------------------------------------------*
*& Include          ZOT_29_I_ENH_UFM
*&---------------------------------------------------------------------*

IF vbak-vkorg EQ '1000'.

  CASE screen-name.
    WHEN 'VBKD-FKDAT'.
      screen-input = 0 .
  ENDCASE.

ENDIF.
