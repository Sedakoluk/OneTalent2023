*&---------------------------------------------------------------------*
*& Include          ZOT_29_P_DIALOGPROG_PAI
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  CASE sy-ucomm.
    WHEN '&BACK'.
      SET SCREEN 0.
    WHEN '&CANCEL'.
      SET SCREEN 0.
    WHEN '&EXIT'.
      LEAVE PROGRAM.
    WHEN '&TAB1'. "function kodu veririz.
      tb_id-activetab = '&TAB1'.
    WHEN '&TAB2'.
      tb_id-activetab = '&TAB2'.
    WHEN '&TAB3'.
      tb_id-activetab = '&TAB3'.
  ENDCASE.

ENDMODULE.

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0101  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0101 INPUT.
  CASE sy-ucomm.
    WHEN '&SAVE'.

      PERFORM save.

  ENDCASE.
ENDMODULE.

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0103  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0103 INPUT.
  CASE sy-ucomm.
    WHEN '&CLEAR'.

      PERFORM clear.

  ENDCASE.
ENDMODULE.


*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0102  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0102 INPUT.

  CASE sy-ucomm.
    WHEN '&DISPLAY'.

      PERFORM display.

    WHEN '&UPDATE'.

      PERFORM update.

    WHEN '&UPDATES'.
      PERFORM updatesave.

  ENDCASE.
ENDMODULE.
