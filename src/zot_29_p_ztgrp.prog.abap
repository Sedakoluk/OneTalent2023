*&---------------------------------------------------------------------*
*& Report ZOT_29_P_ZTGRP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_ztgrp.

TYPE-POOLS: ztgrp.

DATA: sonuc TYPE c LENGTH 5 VALUE 'siyah'.

IF sonuc eq ztgrp_color.

  WRITE: 'Sonuc: ', ztgrp_sonuc.

ENDIF.
