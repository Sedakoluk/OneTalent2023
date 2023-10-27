@AbapCatalog.sqlViewName: 'ZOT_29_CDS_EGT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Eğitim CDS'
define view ZOT_29_DDL_EGT
  as select from ekko
    inner join   ekpo on ekko.ebeln = ekpo.ebeln
    inner join   mara on mara.matnr = ekpo.matnr
    inner join   makt on  makt.matnr = mara.matnr
                      and makt.spras = $session.system_language
    inner join   lfa1 on lfa1.lifnr = ekko.lifnr

{
  ekpo.ebeln                     as ebeln,
  ekpo.ebelp                     as ebelp,
  ekpo.matnr                     as matnr,
  makt.maktx                     as maktx,
  ekpo.werks                     as werks,
  ekpo.lgort                     as lgort,
  ekpo.meins                     as meins,
  lfa1.lifnr                     as lifnr,
  lfa1.adrnr                     as adrnr,

  concat_with_space(lfa1.stras, lfa1.mcod3,1) as satici_adres


}
