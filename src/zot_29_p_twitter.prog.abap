*&---------------------------------------------------------------------*
*& Report zot_29_p_twitter
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_29_p_twitter.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_tid  TYPE char3,
              p_twit TYPE char200.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  PARAMETERS: p_at     RADIOBUTTON GROUP rad1 DEFAULT 'X' USER-COMMAND radio,
              p_degis  RADIOBUTTON GROUP rad1,
              p_sil    RADIOBUTTON GROUP rad1,
              p_goster RADIOBUTTON GROUP rad1.

SELECTION-SCREEN END OF BLOCK b2.

START-OF-SELECTION.

  DATA: gv_tid   TYPE zot_29_e_tid,
        gv_tweet TYPE zot_29_e_tweet.

  DATA : gt_twitter TYPE TABLE OF zot_29_t_twitter,
         gs_twitter TYPE zot_29_t_twitter.

  gv_tid   =  p_tid .
  gv_tweet = p_twit.

  IF p_at EQ abap_true.

*    INSERT VALUE #( tweetid = p_tid
*                    tweet = p_twit
*                    ) INTO TABLE gt_twitter.

    SELECT tweetid , tweet
       FROM zot_29_t_twitter
      WHERE tweetid EQ @p_tid
       INTO TABLE @DATA(gt_at).

    DATA: lt_at TYPE TABLE OF zot_29_t_twitter.
    APPEND VALUE #( tweetid = p_tid  tweet = p_twit  ) TO lt_at.
    MODIFY zot_29_t_twitter FROM TABLE lt_at.

    IF sy-subrc = 0.
      MESSAGE 'Tweet başarılı bir şekilde atıldı.' TYPE 'S' DISPLAY LIKE 'I'.
    ELSE.
      MESSAGE 'Tweet atılamadı.' TYPE 'E'.
    ENDIF.

  ELSEIF p_degis EQ abap_true.

*    UPDATE zot_29_t_twitter SET p_tid = tweetid
*        WHERE tweet = p_twit.
*         COMMIT WORK AND WAIT.

    SELECT tweetid , tweet
FROM zot_29_t_twitter
WHERE tweetid EQ @p_tid
INTO TABLE @DATA(gt_degis).

    DATA: lt_degistir TYPE TABLE OF zot_29_t_twitter.
    APPEND VALUE #( tweetid = p_tid  tweet = p_twit  ) TO lt_degistir.
    MODIFY zot_31_t_twitter FROM TABLE lt_degistir.

    IF sy-subrc = 0.
      MESSAGE 'Tweet başarılı bir şekilde değiştirildi.' TYPE 'S' DISPLAY LIKE 'I'.
    ELSE.
      MESSAGE 'Tweet değiştirilemedi.' TYPE 'E'.
    ENDIF.

*LOOP AT gt_twitter WHERE tweetid = p_tid.
*gt_twitter-id = gv_tweet.
*MODIFY gt_twitter.
*ENDLOOP.

  ELSEIF p_sil EQ abap_true.

*    DELETE FROM zot_29_t_twitter WHERE tweetid = gv_tid.

    SELECT tweetid , tweet
       FROM zot_29_t_twitter
      WHERE tweetid EQ @p_tid
       INTO TABLE @DATA(gt_sil).

    DATA: lt_sil TYPE TABLE OF zot_29_t_twitter.
    DELETE FROM zot_29_t_twitter WHERE tweetid EQ p_tid.

    IF sy-subrc = 0.
      MESSAGE 'Tweet başarılı bir şekilde silindi.' TYPE 'S' DISPLAY LIKE 'I'.
    ELSE.
      MESSAGE 'Tweet silinemedi.' TYPE 'E'.
    ENDIF.

  ELSEIF p_goster EQ abap_true.

*    SELECT *
*    FROM zot_29_t_twitter
*    WHERE tweetid EQ gv_tid
*    INTO TABLE @gt_twitter.

    SELECT *
           FROM zot_29_t_twitter
           INTO TABLE @DATA(gt_gstr).

    IF sy-subrc = 0.
      MESSAGE 'Tweet başarılı bir şekilde gösterildi.' TYPE 'S' DISPLAY LIKE 'I'.
    ELSE.
      MESSAGE 'Tweet gösterilemedi.' TYPE 'E'.
    ENDIF.

    " SELECT * FROM zot_29_t_twitter INTO TABLE gt_twitter.

  ENDIF.


  cl_demo_output=>display(  ).
