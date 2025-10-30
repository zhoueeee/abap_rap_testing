@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zizx_booking_m
  as select from ztzx_booking_m
  composition [0..*] of zizx_booksupp_m          as _BookingSupplement
  association        to parent zizx_travel_m            as _Travel on  $projection.TravelId = _Travel.TravelId
  association [0..1] to /DMO/I_Customer          as _Customer      on  $projection.CustomerId = _Customer.CustomerID
  association [0..1] to I_Currency               as _Currency      on  $projection.CurrencyCode = _Currency.Currency
  association [0..1] to /DMO/I_Carrier           as _Carrier       on  $projection.CarrierId = _Carrier.AirlineID
  association [0..1] to /DMO/I_Booking_Status_VH as _BookingStatus on  $projection.BookingStatus = _BookingStatus.BookingStatus
  association [0..1] to /DMO/I_Connection        as _Connection    on  $projection.CarrierId    = _Connection.AirlineID
                                                                   and $projection.ConnectionId = _Connection.ConnectionID
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at as LastChangedAt,

      _Customer,
      _Currency,
      _Carrier,
      _BookingStatus,
      _Connection,
      _Travel,
      _BookingSupplement
}
