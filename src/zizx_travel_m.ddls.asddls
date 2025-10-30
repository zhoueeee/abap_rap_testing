@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travelling CDS View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zizx_travel_m
  as select from ztzx_travel_m
  association [0..1] to /DMO/I_Agency            as _Agency   on $projection.AgencyId = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer          as _Customer on $projection.AgencyId = _Customer.CustomerID
  association [0..1] to I_Currency               as _Currency on $projection.CurrencyCode = _Currency.Currency
  association [0..1] to /DMO/I_Overall_Status_VH as _Status   on $projection.OverallStatus = _Status.OverallStatus
{
  key ztzx_travel_m.travel_id       as TravelId,
      ztzx_travel_m.agency_id       as AgencyId,
      ztzx_travel_m.customer_id     as CustomerId,
      ztzx_travel_m.begin_date      as BeginDate,
      ztzx_travel_m.end_date        as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      ztzx_travel_m.booking_fee     as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      ztzx_travel_m.total_price     as TotalPrice,
      ztzx_travel_m.currency_code   as CurrencyCode,
      ztzx_travel_m.description     as Description,
      ztzx_travel_m.overall_status  as OverallStatus,
      ztzx_travel_m.created_by      as CreatedBy,
      ztzx_travel_m.created_at      as CreatedAt,
      ztzx_travel_m.last_changed_by as LastChangedBy,
      ztzx_travel_m.last_changed_at as LastChangedAt,

      _Agency,
      _Customer,
      _Currency,
      _Status
}
