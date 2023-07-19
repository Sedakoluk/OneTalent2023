*&---------------------------------------------------------------------*
*& Report zot_29_p_reports
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_reports.

INCLUDE zot_29_include_reports_top.
INCLUDE zot_29_include_reports_slc.
INCLUDE zot_29_include_reports_class.
INCLUDE zot_29_include_reports_mdl.

INITIALIZATION.
  go_main = lcl_main_controller=>get_instance( ).

START-OF-SELECTION.

IF  p_sat = 'X'.
*  LOOP AT SCREEN.
*    IF screen-group1 EQ 'X'.
*      screen-active = 0.
*    ELSE.
*      screen-active = 1.
*    ENDIF.

    SELECT a~banfn,
           a~bnfpo,
           a~matkl,
           a~matnr,
           a~menge,
           a~meins
FROM eban AS a
INNER JOIN ekpo AS b ON a~matkl = b~matkl
INTO TABLE @DATA(lt_eban) WHERE a~banfn IN @s_satno AND a~matkl IN @s_bturu.

*  ENDLOOP.

ELSEIF p_sas = 'X'.
*  LOOP AT SCREEN.
*    IF screen-group1 EQ 'X'.
*      screen-active = 0.
*    ELSE.
*      screen-active = 1.
*    ENDIF.

    SELECT a~ebeln,
           a~ebelp,
           a~matkl,
           a~matnr,
           a~menge,
           a~meins
    FROM ekpo AS a
    INNER JOIN eban AS b ON a~banfn = b~banfn AND
                            a~bnfpo = b~bnfpo
*    INNER JOIN ekko AS c ON a~ebeln = c~ebeln
    INTO TABLE @DATA(lt_ekpo) WHERE a~ebeln IN @s_sasno AND a~matkl IN @s_malg.

*  ENDLOOP.
ENDIF.

go_main->display_grid( ).
