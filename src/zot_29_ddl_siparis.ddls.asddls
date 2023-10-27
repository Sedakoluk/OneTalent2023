@AbapCatalog.sqlViewName: 'ZOT_29_CDS_SIP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sipariş CDS'
define view ZOT_29_DDL_SIPARIS
  as select from vbap
{
  vbeln,
  matnr,
  sum(vbap.netwr)   as toplam_netwr,
  sum(vbap.kwmeng ) as toplam_kwmeng
}

group by
  vbeln,
  matnr
