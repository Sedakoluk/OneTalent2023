@AbapCatalog.sqlViewName: 'ZOT_29_CDS_TES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Teslimat CDS'
define view ZOT_29_DDL_TESLIMAT
  as select from    lips
    left outer join zot_29_cds_sip as sip on  sip.vbeln = lips.vgbel
                                          and sip.matnr = lips.matnr
    inner join      likp                  on likp.vbeln = lips.vbeln
    inner join      kna1                  on kna1.kunnr = likp.kunnr
{

  key lips.vgbel,
      sip.matnr,
      sip.toplam_kwmeng,
      sip.toplam_netwr,
      lips.lfimg,

      concat(kna1.name1, kna1.ort01) as adres,

      case
      when lips.lfimg > 5 then 'BUYUK_TESLIMAT'
      when lips.lfimg <= 5 then 'KUCUK_TESLIMAT'
      end                            as teslimat_tip,

      division(lips.lfimg , 5,2)     as bolum

}
