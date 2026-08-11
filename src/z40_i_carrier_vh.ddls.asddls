@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier Value Help'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z40_I_CARRIER_VH as select from /dmo/carrier
{
   @UI.lineItem: [{position: 10  }] 
   key carrier_id as CARRIERID,
   @UI.lineItem: [{position: 10  }] 
   name as name
}
