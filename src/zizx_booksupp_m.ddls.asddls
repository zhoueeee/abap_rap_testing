@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zizx_booksupp_m
  as select from ztzx_booksupp_m
  association        to parent zizx_booking_m as _Booking        on  $projection.TravelId  = _Booking.TravelId
                                                                 and $projection.BookingId = _Booking.BookingId
  association [1..1] to zizx_travel_m         as _Travel         on  $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Supplement     as _Product        on  $projection.BookingSupplementId = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText as _SupplementText on  $projection.SupplementId = _SupplementText.SupplementID

{
  key ztzx_booksupp_m.travel_id             as TravelId,
  key ztzx_booksupp_m.booking_id            as BookingId,
  key ztzx_booksupp_m.booking_supplement_id as BookingSupplementId,
      ztzx_booksupp_m.supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      ztzx_booksupp_m.price                 as Price,
      ztzx_booksupp_m.currency_code         as CurrencyCode,
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      ztzx_booksupp_m.last_changed_at       as LastChangedAt,

      _Travel,
      _Product,
      _SupplementText,
      _Booking
}
